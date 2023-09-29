package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class StaticApplication {

	public static void main(String[] args) {


		SpringApplication.run(StaticApplication.class, args);
	}

	@GetMapping("/")
	public String hello() {
		System.out.println("update service and change cloudbuild.yaml file  ........");
		return "Springboot-User-Service!";
	}


}
