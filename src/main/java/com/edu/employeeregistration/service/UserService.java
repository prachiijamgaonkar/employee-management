package com.edu.employeeregistration.service;

import com.edu.employeeregistration.dao.UserDAO;
import com.edu.employeeregistration.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Component
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public UserDTO addUser(String name, String dateOfBirth, String gender, String address, String city, String state, String loginId, String password) {
        UserDTO user = new UserDTO();
        user.setName(name);
        user.setDateOfBirth(dateOfBirth);
        user.setGender(gender);
        user.setAddress(address);
        user.setCity(city);
        user.setState(state);
        user.setLoginId(loginId);
        user.setPassword(password);

        try {
            return userDAO.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserDTO login(String loginId, String password) {
        try {
            return userDAO.login(loginId, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public List<UserDTO> findAllUsers() {
		return userDAO.findAllUsers();
	}
}
