package ru.kpfu.itis.skillshare.mainservice.controller.rest;


import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.kpfu.itis.skillshare.mainservice.api.UserApi;
import ru.kpfu.itis.skillshare.mainservice.dto.request.UserRequestDto;
import ru.kpfu.itis.skillshare.mainservice.dto.response.UserResponseDto;
import ru.kpfu.itis.skillshare.mainservice.service.UserService;
import ru.kpfu.itis.skillshare.mainservice.security.util.SecurityUtil;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController implements UserApi {

    private final UserService userService;

    @Override
    public UserResponseDto getById(Long id) {
        return userService.getUserById(id);
    }

    @Override
    public List<UserResponseDto> getAll() {
        return userService.getAll();
    }

    @Override
    public Long create(UserRequestDto userDto) {
        return userService.save(userDto);
    }

    @Override
    public void update(Long id, UserRequestDto userDto) {
        userService.update(id, userDto);
    }

    @Override
    public void delete(Long id) {
        userService.deleteUser(id);
    }


    @Override
    public UserResponseDto getProfileData() {
        Long userId = SecurityUtil.getIdAuthenticatedUser();
        return userService.getUserById(userId);
    }

    @Override
    public String getCurrentUserProfileImage() {
        Long userId = SecurityUtil.getIdAuthenticatedUser();
        UserResponseDto currentUser = userService.getUserById(userId);
        return currentUser.profileImage();
    }
}
