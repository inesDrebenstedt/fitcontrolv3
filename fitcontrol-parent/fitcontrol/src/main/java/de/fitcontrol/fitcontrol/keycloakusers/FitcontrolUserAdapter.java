package de.fitcontrol.fitcontrol.keycloakusers;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.keycloak.component.ComponentModel;
import org.keycloak.models.ClientModel;
import org.keycloak.models.GroupModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.RoleModel;
import org.keycloak.models.SubjectCredentialManager;
import org.keycloak.models.UserModel;
import org.keycloak.storage.StorageId;
import org.keycloak.storage.adapter.AbstractUserAdapterFederatedStorage;

import de.fitcontrol.model.AppUser;

public class FitcontrolUserAdapter  extends AbstractUserAdapterFederatedStorage implements UserModel{
	
	private final AppUser appUser;

	public FitcontrolUserAdapter(KeycloakSession session, RealmModel realm, ComponentModel storageProviderModel, AppUser appUser) {
		super(session, realm, storageProviderModel);
		this.appUser = appUser;
	}

	@Override
	public Stream<RoleModel> getRealmRoleMappingsStream() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<RoleModel> getClientRoleMappingsStream(ClientModel app) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean hasRole(RoleModel role) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void grantRole(RoleModel role) {
		// TODO Auto-generated method stub

	}

	@Override
	public Stream<RoleModel> getRoleMappingsStream() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteRoleMapping(RoleModel role) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getId() {
		return StorageId.keycloakId(storageProviderModel, String.valueOf(appUser.getId()));
		//return String.valueOf(appUser.getId());
	}

	@Override
	public String getUsername() {
		return appUser.getUserName();
	}

	@Override
	public void setUsername(String username) {
		// TODO Prüflogik, ob der Username schon vergeben ist
		appUser.setUserName(username);
	}

	@Override
	public Long getCreatedTimestamp() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setCreatedTimestamp(Long timestamp) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setEnabled(boolean enabled) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setSingleAttribute(String name, String value) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setAttribute(String name, List<String> values) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeAttribute(String name) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getFirstAttribute(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<String> getAttributeStream(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, List<String>> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<String> getRequiredActionsStream() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addRequiredAction(String action) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeRequiredAction(String action) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getFirstName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setFirstName(String firstName) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getLastName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setLastName(String lastName) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setEmail(String email) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isEmailVerified() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setEmailVerified(boolean verified) {
		// TODO Auto-generated method stub

	}

	@Override
	public Stream<GroupModel> getGroupsStream() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinGroup(GroupModel group) {
		// TODO Auto-generated method stub

	}

	@Override
	public void leaveGroup(GroupModel group) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isMemberOf(GroupModel group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String getFederationLink() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setFederationLink(String link) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getServiceAccountClientLink() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setServiceAccountClientLink(String clientInternalId) {
		// TODO Auto-generated method stub

	}

	@Override
	public SubjectCredentialManager credentialManager() {
		// TODO Auto-generated method stub
		return null;
	}

}
