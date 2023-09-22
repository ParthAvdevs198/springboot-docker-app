package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class UserNotFoundHandler {

  @ExceptionHandler(value = UserNotFoundException.class)
  public ResponseEntity<String> exception(UserNotFoundException userNotFoundException){
    return new ResponseEntity<>("Message : User Not Found" , HttpStatus.NOT_FOUND);
  }
}
