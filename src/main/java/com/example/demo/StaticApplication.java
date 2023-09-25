package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class StaticApplication {

	public static void main(String[] args) {


		SpringApplication.run(StaticApplication.class, args);
	}

	@GetMapping("/")
	public String hello() {
		System.out.println("update service .......");
		return "Springboot-User-Service!";
	}


}
