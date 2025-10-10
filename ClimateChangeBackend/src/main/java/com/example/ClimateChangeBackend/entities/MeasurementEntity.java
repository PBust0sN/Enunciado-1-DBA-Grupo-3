package com.example.ClimateChangeBackend.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MeasurementEntity {

    private Long id_measurement;

    private double value_measurement;

    private OffsetDateTime date_measurement;

    private int id_points_measurement;

    private int id_dataset;

}
