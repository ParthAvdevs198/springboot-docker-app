package com.example.demo.controller;


import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("api/v1/user")
@RestController
public class UserController {

  @Autowired
  UserService userService;
  @GetMapping
  public ResponseEntity<List<User>> findAllUser(){
    List<User> allUsers = userService.getAllUsers();
    return new ResponseEntity<>(allUsers , HttpStatus.FOUND);
  }


  @GetMapping("/get")
  public ResponseEntity<User> findUserById(@RequestParam int id){
    User userById = userService.getUserById(id);
    return new ResponseEntity<>(userById , HttpStatus.FOUND);
  }

  @PostMapping
  public ResponseEntity<User> userCreate(@RequestBody User user){
   user =  userService.createUser(user);
    return new ResponseEntity<>(user , HttpStatus.CREATED);
  }


  @PutMapping("/{id}")
  public ResponseEntity<User> updateUser(@RequestBody User user , @PathVariable("id") int id){
    User users = userService.updateUser(user, id);
    return new ResponseEntity<>(users , HttpStatus.OK);
  }
}
