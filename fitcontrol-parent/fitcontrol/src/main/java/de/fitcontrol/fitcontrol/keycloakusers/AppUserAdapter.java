package de.fitcontrol.fitcontrol.keycloakusers;


import org.keycloak.component.ComponentModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.storage.adapter.AbstractUserAdapterFederatedStorage;

import de.fitcontrol.model.AppUser;

public class AppUserAdapter extends AbstractUserAdapterFederatedStorage {

	private final AppUser user;
	private final ComponentModel model;


    public AppUserAdapter(KeycloakSession session, RealmModel realm,
                             ComponentModel model, AppUser user) {
        super(session, realm, model);
        this.user = user;
		this.model = new ComponentModel();
    }

    @Override
    public String getUsername() {
        return user.getUserName();
    }

    @Override
    public String getEmail() {
        return user.getEmail();
    }

    @Override
    public String getId() {
        return model.getId() + ":" + user.getId(); // keycloak-specific ID
    }

	@Override
	public void setUsername(String username) {
		// TODO Auto-generated method stub
		
	}
}
