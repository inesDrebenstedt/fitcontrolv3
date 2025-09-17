package de.fitcontrol.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.service.ports.AppUserRepository;

@Service
public class AppUserService {

    private final PasswordEncoder passwordEncoder;
    private final AppUserRepository AppUserRepository;

    public AppUserService(PasswordEncoder passwordEncoder, AppUserRepository appUserRepository) {
        this.passwordEncoder = passwordEncoder;
        this.AppUserRepository = appUserRepository;
    }

    public void createAppUser(String appUsername, String rawPassword) {
        String hashedPassword = passwordEncoder.encode(rawPassword);
        AppUser appUser = new AppUser();
        appUser.setUserName(appUsername);
        //appUser.setPasswordHash(); TODO
        AppUserRepository.save(appUser);
    }

    public boolean checkPassword(String rawPassword, String storedHash) {
        return passwordEncoder.matches(rawPassword, storedHash);
    }
}

