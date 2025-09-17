package de.fitcontrol.fitcontrol.keycloakusers;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.keycloak.component.ComponentModel;
import org.keycloak.credential.CredentialInput;
import org.keycloak.credential.CredentialInputUpdater;
import org.keycloak.credential.CredentialInputValidator;
import org.keycloak.models.GroupModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserCredentialModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.credential.PasswordCredentialModel;
import org.keycloak.storage.StorageId;
import org.keycloak.storage.UserStorageProvider;
import org.keycloak.storage.user.UserLookupProvider;
import org.keycloak.storage.user.UserQueryProvider;
import org.keycloak.storage.user.UserRegistrationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.client.RestTemplate;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.service.ports.AppUserRepository;
import lombok.extern.slf4j.Slf4j;

//This class contains the actual logic for  interacting with the external user store.

@Slf4j
public class FitcontrolUserStorageProvider 
implements UserStorageProvider,
//UserLookupProvider,
UserRegistrationProvider,
//CredentialInputValidator,
CredentialInputUpdater,
UserQueryProvider // Add these as needed
{

	private final KeycloakSession session;
	private final ComponentModel model;
	
	//@Autowired
	//private AppUserRepository appUserRepository;
	
	private final RestTemplate restTemplate;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;

	public FitcontrolUserStorageProvider(KeycloakSession session, ComponentModel model, RestTemplate restTemplate) {
		log.atDebug().log("---------FitcontrolUserStorageProvider--------> ");
		this.session = session;
		this.model = model;
		this.restTemplate = restTemplate;
	}

	@Override
	public void close() {
// Clean up resources if necessary (e.g., closing database connections)
	}
	
	/*
    public void fetchAllUsersFromBackendDB(RealmModel realm) {
        List<AppUser> allUsers = appUserRepository.findAll();
        for (AppUser extUser : allUsers) {
            UserModel kcUser = session.users().getUserByUsername(realm, extUser.getUserName());
            if (kcUser == null) {
                kcUser = session.users().addUser(realm, extUser.getUserName());
                kcUser.setEnabled(true);
                kcUser.setEmail(extUser.getEmail());
                // ... set other fields
            }
        }
    }
    */
    
    public UserModel getUserByUsername(String username, RealmModel realm) {
        ResponseEntity<AppUser> response = restTemplate.getForEntity(
            "http://localhost:8080/api/users/" + username, 
            AppUser.class
        );
        
        if (response.getStatusCode().is2xxSuccessful()) {
        	AppUser userDto = response.getBody();
            // Convert to Keycloak UserModel
            return new FitcontrolUserAdapter(session, realm, model, userDto);
        }

        return null;
    }


// --- UserLookupProvider (for finding users) ---

/*
	@Override
	public UserModel getUserById(RealmModel realm, String id) {
		System.out.println("getUserById: " + id);
		// TODO: Implement logic to fetch user by ID from your external store
				log.atDebug().log("----getUserById---> " );

        String externalId = StorageId.externalId(id);
		AppUser user = appUserRepository.findById(Long.valueOf(externalId)).orElseThrow();
        if (user == null) return null;
		
		return new FitcontrolUserAdapter(session, realm, model, user);
	}


	@Override
	public UserModel getUserByUsername(RealmModel realm, String username) {
		log.atDebug().log("----getUserByUsername---> " );
        AppUser user = appUserRepository.findByUserName(username).orElseThrow();
        
        if (user == null) return null;

        return new AppUserAdapter(session, realm, model, user);
	}
	

	@Override
	public UserModel getUserByEmail(RealmModel realm, String email) {
		log.atDebug().log("----getUserByEmail---> " );
		AppUser user = appUserRepository.findByEmail(email).orElseThrow();
		return new FitcontrolUserAdapter(session, realm, model, user);
	}
		*/

// --- UserRegistrationProvider (for creating/removing users) ---

	@Override
	public UserModel addUser(RealmModel realm, String username) {
// Keycloak calls this when a new user needs to be created, e.g., during self-registration
// or when an admin creates a user in Keycloak UI.
		System.out.println("addUser: " + username);
// TODO: Implement logic to add a new user to your external store
// If successful, create and return a Keycloak UserModel representing the new user.
// If your external store doesn't support user creation via Keycloak, you might throw UnsupportedOperationException.
		return null; // Or throw new UnsupportedOperationException("User creation not supported.");
	}

	@Override
	public boolean removeUser(RealmModel realm, UserModel user) {
// Keycloak calls this when a user is deleted from Keycloak.
		System.out.println("removeUser: " + user.getUsername());
// TODO: Implement logic to remove the user from your external store
// Return true if successful, false otherwise.
// If your external store doesn't support user deletion via Keycloak, you might throw ReadOnlyException.
// throw new ReadOnlyException("User deletion not supported.");
		return false;
	}

	@Override
	public Stream<UserModel> searchForUserStream(RealmModel realm, Map<String, String> params, Integer firstResult,
			Integer maxResults) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<UserModel> getGroupMembersStream(RealmModel realm, GroupModel group, Integer firstResult,
			Integer maxResults) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<UserModel> searchForUserByUserAttributeStream(RealmModel realm, String attrName, String attrValue) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateCredential(RealmModel realm, UserModel user, CredentialInput input) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void disableCredentialType(RealmModel realm, UserModel user, String credentialType) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Stream<String> getDisableableCredentialTypesStream(RealmModel realm, UserModel user) {
		// TODO Auto-generated method stub
		return null;
	}


	/*
	@Override
	public boolean isConfiguredFor(RealmModel realm, UserModel user, String credentialType) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean isValid(RealmModel realm, UserModel user, CredentialInput input) {
		log.atDebug().log("----isValid---> " );
	    if (!(input instanceof UserCredentialModel)) return false;

	    String rawPassword = ((UserCredentialModel) input).getValue();
	    AppUser extUser = appUserRepository.findById(Long.valueOf(StorageId.externalId(user.getId()))).orElseThrow();
	    if (extUser == null) return false;

	    return passwordEncoder.matches(rawPassword, extUser.getPasswordHash());
	}
	*/

	
	@Override
	public boolean supportsCredentialType(String credentialType) {
	    return PasswordCredentialModel.TYPE.equals(credentialType);
	}


}

// old:
/*
 * public class FitcontrolUserStorageProvider implements UserStorageProvider,
 * UserLookupProvider, UserRegistrationProvider {
 * 
 * private final KeycloakSession session; private final ComponentModel model;
 * 
 * 
 * public FitcontrolUserStorageProvider(KeycloakSession session, ComponentModel
 * model) { this.session = session; this.model = model; }
 * 
 * @Override public UserModel getUserById(RealmModel realm, String id) { // TODO
 * Auto-generated method stub return null; }
 * 
 * @Override public UserModel getUserByUsername(RealmModel realm, String
 * username) { // TODO Auto-generated method stub return null; }
 * 
 * @Override public UserModel getUserByEmail(RealmModel realm, String email) {
 * // TODO Auto-generated method stub return null; }
 * 
 * @Override public void close() { // Clean up }
 * 
 * @Override public UserModel addUser(RealmModel realm, String username) { //
 * TODO Auto-generated method stub return null; }
 * 
 * @Override public boolean removeUser(RealmModel realm, UserModel user) { //
 * TODO Auto-generated method stub return false; }
 * 
 * }
 */
