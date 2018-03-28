package ua.springboot.web.mapper;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import ua.springboot.web.domain.RegisterRequest;
import ua.springboot.web.domain.UserProfileRequest;
import ua.springboot.web.entity.UserEntity;
import ua.springboot.web.entity.enumeration.UserRole;

public interface UserMapper {

	public static User toSecurityUser(UserEntity entity) {
		return new User(entity.getEmail(), 
				entity.getPassword(), 
				AuthorityUtils.createAuthorityList(String.valueOf(entity.getRole())));
	}
	
	public static UserEntity registerToUser (RegisterRequest request){
		UserEntity entity = new UserEntity();
		
		entity.setFirstName(request.getFirstName());
		entity.setEmail(request.getEmail());
		entity.setPassword(request.getPassword());
		entity.setRole(UserRole.ROLE_USER);
		
		return entity;
	}

	public static UserProfileRequest entityToUserProfile(UserEntity entity){
	    UserProfileRequest request = new UserProfileRequest();
	    
	    request.setEmail(entity.getEmail());
	    request.setFirstName(entity.getFirstName());
	    request.setLastName(entity.getLastName());
	    request.setAddress(entity.getAddress());
	    request.setTelephone(entity.getTelephone());
	    request.setBirthday(entity.getBirthday());
	    request.setImagePath(entity.getImagePath());
	    request.setActivated(entity.isActivated());
	    request.setRole(entity.getRole());
	    
	    return request;
	}
	
}
