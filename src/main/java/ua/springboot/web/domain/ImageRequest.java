package ua.springboot.web.domain;

import lombok.Data;

import org.springframework.web.multipart.MultipartFile;

@Data
public class ImageRequest {

    private MultipartFile file;
    
}
