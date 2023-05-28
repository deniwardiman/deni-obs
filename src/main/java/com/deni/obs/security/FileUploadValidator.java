package com.deni.obs.security;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.io.IOException;
import java.util.List;

import static java.util.Arrays.asList;

/**
 * Created by zer0, the Maverick Hunter
 * on 15/09/18.
 * Class: FileUploadValidator.java
 */
@Component
public class FileUploadValidator {

    private String error;
    private static final String FILE_SUSPICIOUS = "File seems suspicious, we are blocking your request with the same file";
    private static final List<String> WHITE_LISTED_IMAGE_EXTENSION = asList("image/jpg","image/jpeg","image/png");
    
    public void validate(Object o, String type){
        validate(o, type, Boolean.FALSE);
    }
    
    public void validate(Object o, String type, Boolean required) {

        error = null;
        
        MultipartFile validatedFile = (MultipartFile) o;

        if ("img".equals(type)) {
            if (validatedFile == null || validatedFile.isEmpty()) {
                if (required) error = "Please select a file";
            } else {

                // i. Check the file extension and only allow certain files to be uploaded
                // ii. Use a whitelist approach instead of a blacklist
                // iv. Check for files without a filename like .htaccess (on ASP.NET, check for configuration files like web.config)
                if (!WHITE_LISTED_IMAGE_EXTENSION.contains(validatedFile.getContentType().toLowerCase())) {
                    error = "File uploaded is not in jpg/jpeg/png format";
                    return;
                }

                // iii. Check for double extensions such as .php.png
                try {
                    if (ImageIO.read(validatedFile.getInputStream()) == null) {
                        error = FILE_SUSPICIOUS;
                        return;
                    }
                } catch (IOException e) {
                    error = e.getMessage();
                    return;
                }

                // custom condition
                if (validatedFile.getSize() == 0) {
                    error = FILE_SUSPICIOUS;
                }
            }
        }
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }


}
