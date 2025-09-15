package com.example.bda_lab1.security.services;

import com.example.bda_lab1.entities.UserEntity;
import com.example.bda_lab1.repositories.UserRepository;
import com.example.bda_lab1.security.JwtUtil;
import com.example.bda_lab1.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RefreshTokenService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private UserService userService;

    public Optional<UserEntity> findByToken(String token){
        return userRepository.findByRefreshToken(token);
    }

    public String createRefreshToken(Long id){
        UserEntity userEntity = userRepository.findById(id).orElseThrow(()->new RuntimeException("User not found"));
        String refreshToken = jwtUtil.generateRefreshToken();
        long refreshExpiryTime = jwtUtil.getRefreshExpiryTime();
        userService.updateRefreshToken(userEntity.getId(), refreshToken, refreshExpiryTime);
        return refreshToken;
    }

    public String verifyExpiration(UserEntity userEntity) {
        if ((userEntity.getRefreshTokenExpiration() == null) || (userEntity.getRefreshTokenExpiration() < System.currentTimeMillis())) {
            userService.clearRefreshToken(userEntity.getId());
            throw new RuntimeException("Refresh token expired. Login again.");
        }

        return userEntity.getRefreshToken();
    }

    public void deleteByUserId(Long userId) {
        userRepository.findById(userId).ifPresent(userEntity -> {userEntity.setRefreshToken(null);userEntity.setRefreshTokenExpiration(null);userRepository.save(userEntity);});
    }
}
