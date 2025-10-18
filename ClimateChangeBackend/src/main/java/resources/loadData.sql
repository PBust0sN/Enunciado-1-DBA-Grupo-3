-- Poblar tabla de usuarios (password default para todos es 'Hola1234')
INSERT INTO users (first_name, last_name, rut, password, email, role) VALUES
                                                                          ('Juan', 'Pérez', '12345678-9', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'juan.perez@ejemplo.com', 'ROLE_ADMIN'),
                                                                          ('María', 'González', '98765432-1', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'maria.gonzalez@ejemplo.com', 'ROLE_USER'),
                                                                          ('Carlos', 'Rodríguez', '11111111-1', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'carlos.rodriguez@ejemplo.com', 'ROLE_USER'),
                                                                          ('Ana', 'Martínez', '22222222-2', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'ana.martinez@ejemplo.com', 'ROLE_ADMIN'),
                                                                          ('Pedro', 'Sánchez', '33333333-3', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'pedro.sanchez@ejemplo.com', 'ROLE_USER'),
                                                                          ('Laura', 'Díaz', '44444444-4', '$2a$10$RgltMjiv61gUbaivPGiFmu/SDaamf7kdmtJ/IAxh2pgYn3XBKw7Pu', 'laura.diaz@ejemplo.com', 'ROLE_USER');

-- Poblar tabla de puntos de medición
INSERT INTO measure_points (latitud, longitud, sensor_type) VALUES
                                                                (-33.456789, -70.123456, 'Temperatura'),
                                                                (-33.456123, -70.124567, 'Emisiones de CO2'),
                                                                (-33.612125, -71.632559, 'Nivel del mar'),
                                                                (-33.454321, -70.126789, 'Masa de hielo'),
                                                                (-33.453456, -70.127890, 'Temperatura'),
                                                                (-33.452345, -70.128901, 'Emisiones de CO2'),
                                                                (-33.451234, -70.129012, 'Nivel del mar'),
                                                                (-33.450123, -70.130123, 'Masa de hielo'),
                                                                (-33.449012, -70.131234, 'Temperatura'),
                                                                (-33.448901, -70.132345, 'Emisiones de CO2'),
                                                                (-33.447890, -70.133456, 'Nivel del mar'),
                                                                (-33.446789, -70.134567, 'Masa de hielo'),
                                                                (-33.445678, -70.135678, 'Temperatura'),
                                                                (-33.444567, -70.136789, 'Emisiones de CO2'),
                                                                (-33.443456, -70.137890, 'Nivel del mar'),
                                                                (NULL, -70.140000, 'Temperatura'),      -- latitud nula
                                                                (-33.440000, NULL, 'Emisiones de CO2'), -- longitud nula
                                                                (0, 0, 'Nivel del mar');


-- Poblar tabla de conjuntos de datos
INSERT INTO dataset (name_dataset, description_dataset, source_dataset, date_authorization_dataset) VALUES
                                                                                                        ('Clima Santiago 2023', 'Datos climáticos recopilados durante el año 2023', 'Estación Meteorológica Central', '2023-01-15'),
                                                                                                        ('Contaminación Urbana', 'Mediciones de contaminantes en zona metropolitana', 'Red de Monitoreo Ambiental', '2023-02-20'),
                                                                                                        ('Radiación Solar', 'Niveles de radiación UV en distintos puntos de la ciudad', 'Instituto Meteorológico', '2023-03-10'),
                                                                                                        ('Monitoreo CO2 Global', 'Datos sobre emisiones de CO2 en diferentes regiones', 'Red Global Climática', '2023-04-05'),
                                                                                                        ('Niveles Oceánicos 2023', 'Mediciones de nivel del mar en costas chilenas', 'Instituto Oceanográfico', '2023-05-12'),
                                                                                                        ('Glaciares Andinos', 'Monitoreo de masas de hielo en la cordillera', 'Centro Glaciológico', '2023-06-18');

-- Poblar tabla de mediciones
INSERT INTO measurements (value_measurement, date_measurement, id_measure_points, id_dataset) VALUES
-- Puntos 1 a 5 (Temperatura, Emisiones de CO2, Nivel del mar, Masa de hielo, Temperatura)
(27.1, '2023-08-01 10:00:00+00', 1, 1),
(30.2, '2023-09-01 11:00:00+00', 1, 1),
(26.8, '2024-01-15 09:30:00+00', 1, 1),
(28.0, '2024-06-10 12:00:00+00', 1, 1),

(455.0, '2023-08-02 10:15:00+00', 2, 4),
(460.5, '2023-09-02 11:15:00+00', 2, 4),
(470.2, '2024-01-16 09:45:00+00', 2, 4),
(465.8, '2024-06-11 12:15:00+00', 2, 4),

(3.30, '2023-08-03 10:30:00+00', 3, 5),
(3.40, '2023-09-03 11:30:00+00', 3, 5),
(3.35, '2024-01-17 10:00:00+00', 3, 5),
(3.50, '2024-06-12 12:30:00+00', 3, 5),

(12600.0, '2023-08-04 10:45:00+00', 4, 6),
(12450.3, '2023-09-04 11:45:00+00', 4, 6),
(12550.7, '2024-01-18 10:15:00+00', 4, 6),
(12480.2, '2024-06-13 12:45:00+00', 4, 6),

(27.0, '2023-08-05 11:00:00+00', 5, 1),
(25.9, '2023-09-05 12:00:00+00', 5, 1),
(26.5, '2024-01-19 10:30:00+00', 5, 1),
(27.3, '2024-06-14 13:00:00+00', 5, 1),

-- Puntos 6 a 10
(470.0, '2023-08-06 11:15:00+00', 6, 4),
(472.5, '2023-09-06 12:15:00+00', 6, 4),
(469.8, '2024-01-20 10:45:00+00', 6, 4),
(471.2, '2024-06-15 13:15:00+00', 6, 4),

(3.38, '2023-08-07 11:30:00+00', 7, 5),
(3.41, '2023-09-07 12:30:00+00', 7, 5),
(3.36, '2024-01-21 11:00:00+00', 7, 5),
(3.49, '2024-06-16 13:30:00+00', 7, 5),

(12400.5, '2023-08-08 11:45:00+00', 8, 6),
(12380.2, '2023-09-08 12:45:00+00', 8, 6),
(12450.1, '2024-01-22 11:15:00+00', 8, 6),
(12390.7, '2024-06-17 13:45:00+00', 8, 6),

(29.1, '2023-08-09 12:00:00+00', 9, 1),
(28.7, '2023-09-09 13:00:00+00', 9, 1),
(29.3, '2024-01-23 11:30:00+00', 9, 1),
(28.8, '2024-06-18 14:00:00+00', 9, 1),

(480.0, '2023-08-10 12:15:00+00', 10, 4),
(478.5, '2023-09-10 13:15:00+00', 10, 4),
(479.2, '2024-01-24 11:45:00+00', 10, 4),
(481.1, '2024-06-19 14:15:00+00', 10, 4),

-- Puntos 11 a 15
(3.47, '2023-08-11 12:30:00+00', 11, 5),
(3.44, '2023-09-11 13:30:00+00', 11, 5),
(3.51, '2024-01-25 12:00:00+00', 11, 5),
(3.48, '2024-06-20 14:30:00+00', 11, 5),

(12200.2, '2023-08-12 12:45:00+00', 12, 6),
(12050.8, '2023-09-12 13:45:00+00', 12, 6),
(12150.3, '2024-01-26 12:15:00+00', 12, 6),
(12080.9, '2024-06-21 14:45:00+00', 12, 6),

(25.1, '2023-08-13 13:00:00+00', 13, 1),
(24.7, '2023-09-13 14:00:00+00', 13, 1),
(25.3, '2024-01-27 12:30:00+00', 13, 1),
(24.8, '2024-06-22 15:00:00+00', 13, 1),

(485.0, '2023-08-14 13:15:00+00', 14, 4),
(482.5, '2023-09-14 14:15:00+00', 14, 4),
(483.2, '2024-01-28 12:45:00+00', 14, 4),
(481.9, '2024-06-23 15:15:00+00', 14, 4),

(3.55, '2023-08-15 13:30:00+00', 15, 5),
(3.53, '2023-09-15 14:30:00+00', 15, 5),
(3.57, '2024-01-29 13:00:00+00', 15, 5),
(3.54, '2024-06-24 15:30:00+00', 15, 5),

(25.0, '2024-07-01 10:00:00+00', 16, 1),
(450.0, '2024-07-02 11:00:00+00', 17, 4),
(3.20, '2024-07-03 12:00:00+00', 18, 5);