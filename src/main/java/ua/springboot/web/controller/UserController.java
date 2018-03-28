package ua.springboot.web.controller;


import java.io.IOException;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.springboot.web.domain.ImageRequest;
import ua.springboot.web.entity.UserEntity;
import ua.springboot.web.mapper.UserMapper;
import ua.springboot.web.service.UserService;
import ua.springboot.web.service.utils.CustomFileUtils;

@Controller
@RequestMapping({"/user", "/admin"})
public class UserController {
    
    @Autowired
    private UserService userServuce;
    
    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'USER')")
    public String showProfile(Model model, Principal principal) throws IOException{
	UserEntity entity = userServuce.findUserByEmail(principal.getName());
	entity.setImagePath(CustomFileUtils.getImage("user_" + entity.getId(), entity.getImagePath()));
	
	model.addAttribute("userProfile", UserMapper.entityToUserProfile(entity));
	return "user/profile";
    }
    
//    @GetMapping("/profile")
//    public String uploadImage(Model model){
//	model.addAttribute("uploadImage", new ImageRequest());
//	return "user/profile";
//    }
//    
//    @PostMapping("/profile")
//    private String saveImage(@ModelAttribute ("uploadImage") ImageRequest request, Principal principal) throws IOException{
//	UserEntity entity = userServuce.findUserByEmail(principal.getName());
//	entity.setImagePath(request.getFile().getOriginalFilename());
//	CustomFileUtils.createImage("user_" + entity.getId(), request.getFile());
//	
//	return "redirect:/user";
//    }
    
    @GetMapping("/edit")
    public String editUserProfile(Model model, Principal principal){
	UserEntity entity = userServuce.findUserByEmail(principal.getName());
	model.addAttribute("userProfile", UserMapper.entityToUserProfile(entity));
	return "user/edit";
    }
    
}
