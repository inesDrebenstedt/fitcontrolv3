package de.fitcontrol.service.ports;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.model.Exercise;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Long>{
	
	public Optional<AppUser> findByUserName(String userName);
	public Optional<AppUser> findByEmail(String email);
	

}
