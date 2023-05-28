package com.deni.obs.exception;

import org.springframework.http.HttpStatus;

public class ValidationErrorException extends Exception {

    public ValidationErrorException() {
        super(HttpStatus.BAD_REQUEST.name());
    }

    public ValidationErrorException(String message) {
        super(message);
    }

}
