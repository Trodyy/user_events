# User Event Tracking System

## Overview
This project is a **User Event Tracking System** built using **Golang (Gin framework)** for the backend API, **PostgreSQL** as the database, and **Python (Pandas, Matplotlib)** for data analysis. The system allows tracking user activities, storing event logs, and analyzing user behavior.

## Features
- **User Management**: Register and manage users.
- **Event Logging**: Record user actions such as login, purchase, logout, etc.
- **Event Retrieval**: Fetch events based on user ID, event type, or date range.
- **Data Analysis**: Use Python to analyze and visualize user activities.
- **Dockerized Deployment**: Run all services inside Docker containers.

## Tech Stack
- **Backend**: Golang (Gin framework)
- **Database**: PostgreSQL
- **Data Analysis**: Python (Pandas, Matplotlib)
- **Containerization**: Docker, Docker Compose

## Database Schema
The database consists of three main tables:

1. **users**: Stores user details.
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```
2. **user_events**: Logs user activities.
```sql
CREATE TABLE user_events (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    event_type VARCHAR(50),
    event_data JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);
```
3. **event_types**: Stores predefined event categories.
```sql
CREATE TABLE event_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);
```

## Setup & Run
### Prerequisites
- **Golang** installed
- **PostgreSQL** installed
- **Docker & Docker Compose** installed

### 1. Clone the Repository
```sh
git clone <repo-url>
cd event-tracker
```

### 2. Setup PostgreSQL Database
```sh
psql -U postgres -c "CREATE DATABASE event_tracker;"
psql -U postgres -d event_tracker -f schema.sql
```

### 3. Run the Backend Server
```sh
go run main.go
```

### 4. Run the Python Analysis Script
```sh
python analysis.py
```

### 5. Dockerized Deployment
```sh
docker-compose up --build
```

## Future Improvements
- Add authentication using JWT
- Implement Kafka for event streaming
- Create a frontend dashboard for data visualization
