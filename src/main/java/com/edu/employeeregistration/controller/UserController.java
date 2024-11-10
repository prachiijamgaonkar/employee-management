package com.edu.employeeregistration.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.employeeregistration.dto.UserDTO;
import com.edu.employeeregistration.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // Display Sign-Up Page
    @RequestMapping(value = "/register-user", method = RequestMethod.GET)
    protected String getRegistrationPage() {
        return "registration";
    }
    // Display the login form
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "login"; 
    }

    // Register User
    @RequestMapping(value = "/register-user", method = RequestMethod.POST)
    protected String addUser(@RequestParam(name = "name") String name,
                             @RequestParam(name = "dateOfBirth") String dateOfBirth,
                             @RequestParam(name = "gender") String gender,
                             @RequestParam(name = "address") String address,
                             @RequestParam(name = "city") String city,
                             @RequestParam(name = "state") String state,
                             @RequestParam(name = "loginId") String loginId,
                             @RequestParam(name = "password") String password,
                             ModelMap modelMap) {
        UserDTO addedUser = userService.addUser(name, dateOfBirth, gender, address, city, state, loginId, password);
        
        if (addedUser != null) {
            modelMap.addAttribute("message", "User registered successfully! Please log in.");
            return "login"; 
        } else {
            modelMap.addAttribute("message", "Something went wrong.. Please try again.");
            return "registration"; 
        }
    }

    // Login User
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    protected String login(@RequestParam(name = "loginId") String loginId, 
                           @RequestParam(name = "password") String password,
                           ModelMap modelMap, HttpSession httpSession) {
        UserDTO user = userService.login(loginId, password);

        if (user != null) {
            httpSession.setAttribute("user", user);
            modelMap.addAttribute("user", user);
            return "redirect:/home"; // Redirecting to GET /home
        } else {
            modelMap.addAttribute("message", "Invalid email or password.");
            return "login";
        }
    }

    // Home Page - Display Users
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    protected String welcomePage(ModelMap modelMap, HttpSession httpSession) {
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("user");

        if (loggedInUser == null) {
            // Redirect to login if user is not in session
            return "redirect:/login";
        }

        List<UserDTO> users = userService.findAllUsers();
        if (!(users.isEmpty())) {
            modelMap.addAttribute("users", users);
        } else {
            modelMap.addAttribute("message", "No users found.");
        }
        
        modelMap.addAttribute("user", loggedInUser);
        return "home";
    }

    // Logout User
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    protected String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "login";
    }
}
