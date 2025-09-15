# Cold-Chain-Shipment-Monitoring
# MediSafe Logistics Monitoring System Overview
The MediSafe Logistics Monitoring System is a Python-based solution designed to monitor temperature-sensitive medical shipments (e.g., vaccines) in real-time. The system processes sensor data from shipments, detects threshold violations, generates summary reports, and provides actionable insights to ensure product safety. It is modular, extensible, and robust, handling data consistency issues like missing or delayed readings.
# Key Features
Data Model: Stores shipment, sensor, and reading data in a relational schema.  
Violation Detection: Identifies threshold violations, sustained issues, and correlated events (e.g., shock + temperature spikes).  
Summary Reports: Generates detailed reports per shipment, including average, min, max readings, violation counts, and risk assessments.  
Modularity: Easily extensible for new sensors or rules via configuration.  
Scalability: Supports integration with databases (e.g., PostgreSQL) and message queues (e.g., Kafka) for real-time processing.  
Data Consistency: Handles missing or delayed readings with interpolation and flagging.Flag delayed readings (timestamp older than expected) as potential issues.  
Sample Dataset: Includes data for 5 shipments with 10+ readings per sensor, including violation cases.








