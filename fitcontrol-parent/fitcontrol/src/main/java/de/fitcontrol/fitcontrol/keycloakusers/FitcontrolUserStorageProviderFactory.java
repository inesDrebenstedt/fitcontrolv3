package de.fitcontrol.fitcontrol.keycloakusers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.keycloak.component.ComponentModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;
import org.keycloak.provider.ProviderConfigProperty;
import org.keycloak.storage.StorageId;
import org.keycloak.storage.UserStorageProviderFactory;
import org.keycloak.storage.UserStorageProviderModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;
import org.keycloak.storage.user.UserLookupProvider;
import org.keycloak.storage.user.ImportSynchronization;
import org.keycloak.storage.user.SynchronizationResult;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.service.ports.AppUserRepository;

// This is the entry point for Keycloak to discover and instantiate the provider.
public class FitcontrolUserStorageProviderFactory 
implements UserStorageProviderFactory<FitcontrolUserStorageProvider>,
ImportSynchronization
{

    public FitcontrolUserStorageProviderFactory() {
		super();
	}

	private final RestTemplate restTemplate = new RestTemplate(); // or HttpClient

    @Override
    public FitcontrolUserStorageProvider create(KeycloakSession session, ComponentModel model) {
        return new FitcontrolUserStorageProvider(session, model, restTemplate);
    }
	

    @Override
    public String getId() {
        return "fitcontrol-user-provider";
    }
    
    @Override
    public String getHelpText() {
        return "A custom user storage provider for integrating with an external system.";
    }
    
    @Override
    public List<ProviderConfigProperty> getConfigProperties() {
        List<ProviderConfigProperty> configProperties = new ArrayList<>();

        ProviderConfigProperty host = new ProviderConfigProperty();
        host.setName("serverHost");
        host.setLabel("Server Host");
        host.setType(ProviderConfigProperty.STRING_TYPE);
        host.setHelpText("Hostname or IP address of your user source.");
        configProperties.add(host);

        ProviderConfigProperty port = new ProviderConfigProperty();
        port.setName("serverPort");
        port.setLabel("Server Port");
        port.setType(ProviderConfigProperty.STRING_TYPE);
        port.setHelpText("Port number.");
        configProperties.add(port);

        ProviderConfigProperty useSSL = new ProviderConfigProperty();
        useSSL.setName("useSSL");
        useSSL.setLabel("Use SSL");
        useSSL.setType(ProviderConfigProperty.BOOLEAN_TYPE);
        useSSL.setHelpText("Enable SSL when connecting to the server.");
        configProperties.add(useSSL);
        
        ProviderConfigProperty db = new ProviderConfigProperty();
        db.setName("db");
        db.setLabel("Database");
        db.setType(ProviderConfigProperty.STRING_TYPE);
        db.setHelpText("DB of your user source.");
        configProperties.add(db);
        
        ProviderConfigProperty dbDriver = new ProviderConfigProperty();
        dbDriver.setName("dbDriver");
        dbDriver.setLabel("Database Driver");
        dbDriver.setType(ProviderConfigProperty.STRING_TYPE);
        dbDriver.setHelpText("DB Driver of your user source.");
        configProperties.add(dbDriver);
        
        ProviderConfigProperty dbPassword = new ProviderConfigProperty();
        dbPassword.setName("db-password");
        dbPassword.setLabel("Database Password");
        dbPassword.setType(ProviderConfigProperty.STRING_TYPE);
        dbPassword.setHelpText("DB Password of your user source.");
        configProperties.add(dbPassword);
        
        ProviderConfigProperty dbUsername = new ProviderConfigProperty();
        dbUsername.setName("db-username");
        dbUsername.setLabel("Database Username");
        dbUsername.setType(ProviderConfigProperty.STRING_TYPE);
        dbUsername.setHelpText("DB Username of your user source.");
        configProperties.add(dbUsername);
        
        ProviderConfigProperty dbUrl = new ProviderConfigProperty();
        dbUrl.setName("db-url");
        dbUrl.setLabel("Full Database URL");
        dbUrl.setType(ProviderConfigProperty.STRING_TYPE);
        dbUrl.setHelpText("Full Database URL of your user source.");
        configProperties.add(dbUrl);

        return configProperties;
    }


	@Override
	public SynchronizationResult sync(KeycloakSessionFactory sessionFactory, String realmId,
			UserStorageProviderModel model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SynchronizationResult syncSince(Date lastSync, KeycloakSessionFactory sessionFactory, String realmId,
			UserStorageProviderModel model) {
		// TODO Auto-generated method stub
		return null;
	}

}
