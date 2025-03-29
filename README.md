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

## Setup & Run
### Prerequisites
- **Golang** installed
- **PostgreSQL** installed
- **Docker & Docker Compose** installed

### 1. Clone the Repository
```sh
<<<<<<< HEAD
git clone git@github.com:Trodyy/user_events.git
cd user_events
```

### 2. Setup PostgreSQL Database
```sh
psql -U postgres -c "CREATE DATABASE user_evnets;"
psql -U postgres -d user_events -f schema.sql
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
