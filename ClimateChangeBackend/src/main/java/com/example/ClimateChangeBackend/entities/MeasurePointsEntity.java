package com.example.ClimateChangeBackend.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MeasurePointsEntity {

    private Long idMeasurePoints;
    private Double latitud;
    private Double longitud;
    private String sensorType;
}
