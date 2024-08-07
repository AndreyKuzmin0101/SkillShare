package ru.kpfu.itis.skillshare.mainservice.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.kpfu.itis.skillshare.mainservice.exception.notfound.UserNotFoundException;
import ru.kpfu.itis.skillshare.mainservice.service.UserService;

@Controller
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;

    @GetMapping("/profile")
    public String getProfile() {
        return "profile";
    }

    @GetMapping("/users/{id}")
    public String getProfileSomeUser(@PathVariable("id") Long id, Model model) {
        try {
            model.addAttribute("user", userService.getProfileById(id));
            return "user-profile";
        } catch (UserNotFoundException e) {
            return "not-found";
        }

    }
}
