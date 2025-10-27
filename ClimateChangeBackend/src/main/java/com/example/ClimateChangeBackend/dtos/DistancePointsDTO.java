package com.example.ClimateChangeBackend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DistancePointsDTO {
    private Long tempId;
    private Double tempLatitud;
    private Double tempLongitud;
    private String tempSensorType;

    private Long co2Id;
    private Double co2Latitud;
    private Double co2Longitud;
    private String co2SensorType;

    private Double distanceKm;
}
