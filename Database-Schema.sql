-- Shipments table
CREATE TABLE Shipments (
    shipment_id VARCHAR(50) PRIMARY KEY,
    origin VARCHAR(100),
    destination VARCHAR(100),
    start_time DATETIME
);

-- Sensors table
CREATE TABLE Sensors (
    sensor_id VARCHAR(50) PRIMARY KEY,
    sensor_name VARCHAR(100),
    sensor_type VARCHAR(50),
    min_threshold FLOAT,
    max_threshold FLOAT,
    unit VARCHAR(20)
);

-- Readings tableactor
CREATE TABLE Readings (
    reading_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    shipment_id VARCHAR(50),
    sensor_id VARCHAR(50),
    timestamp DATETIME,
    value FLOAT,
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id),
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

-- Violations table
CREATE TABLE Violations (
    violation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    reading_id INTEGER,
    shipment_id VARCHAR(50),
    sensor_id VARCHAR(50),
    violation_type VARCHAR(50),
    severity VARCHAR(20),
    timestamp DATETIME,
    FOREIGN KEY (reading_id) REFERENCES Readings(reading_id),
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id),
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);


SELECT r.reading_id, r.shipment_id, r.value, s.sensor_type,
       CASE
           WHEN s.sensor_type = 'ThermoProbe' AND (r.value < 2 OR r.value > 8) THEN 'Temperature Out of Range'
           WHEN s.sensor_type = 'TempTrack' AND (r.value < 2 OR r.value > 10) THEN 'Surface Temp Out of Range'
           ELSE NULL
       END AS rule_violated
FROM Readings r
JOIN Sensors s ON r.sensor_id = s.sensor_id
WHERE (s.sensor_type = 'ThermoProbe' AND (r.value < 2 OR r.value > 8))
   OR (s.sensor_type = 'TempTrack' AND (r.value < 2 OR r.value > 10));
