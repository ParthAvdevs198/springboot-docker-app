package com.example.demo.service;


import com.example.demo.model.User;
import com.example.demo.exception.UserNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class UserService {

  static List<User> userList = new ArrayList<>();

  static {
    userList.add(new User(101, "Parth", "Bopal"));
    userList.add(new User(102, "Vaibhav", "Rajkot"));
    userList.add(new User(103, "Arpit", "Jamnagar"));
    userList.add(new User(104, "Mihu", "Vadodara"));
    userList.add(new User(105, "Yash", "Kankot"));
  }

  public User getUserById(int id) {
    return userList.stream().filter(s -> s.getId() == id).findFirst().orElseThrow(UserNotFoundException::new);
  }

  public User createUser(User user) {
    userList.add(user);
    return user;
  }

  public List<User> getAllUsers() {
    List<User> collect = userList.stream().collect(Collectors.toList());
    return collect;
  }

  public User updateUser(User user, int id) {
    User user1 = userList.stream().map(
            u -> {
              if (u.getId() == id) {
                u.setName(user.getName());
                u.setAddress(user.getAddress());
              }
              return u;
            }
    ).findFirst().orElseThrow(UserNotFoundException::new);
    return user1;
  }


}
