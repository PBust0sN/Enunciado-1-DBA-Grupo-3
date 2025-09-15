package com.example.bda_lab1.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class TokenRefreshResponse {
    private String accessToken;
    private String refreshToken;
    private String tokenType;
}
