package de.fitcontrol.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.service.ports.AppUserRepository;

@Service
public class AppUserService {
	
	@Autowired
	private AppUserRepository appUserRepository;
	
	public Optional<AppUser> getUserByUserNameAndEmail(String userName, String email){
		return appUserRepository.findByUserNameAndEmail(userName, email);
	}
	

}
