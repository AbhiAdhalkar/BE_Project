# BE_Project

# Smart Public Rest Room Monitoring System

This project is an Arduino-based application designed to monitor and maintain the hygiene of public toilets. By integrating sensors with a web interface, the system can provide real-time feedback on the cleanliness of public restrooms, helping to maintain a hygienic environment.

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [System Requirements](#system-requirements)
- [Installation Guide](#installation-guide)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview
Public hygiene is crucial, especially in public restrooms where cleanliness is often compromised due to poor maintenance. This system is designed to monitor public toilet conditions using sensors connected to an Arduino board, and send data to a web application developed using Java and JSP.

The system:
- Detects cleanliness levels based on sensor inputs.
- Notifies authorities when maintenance is required.
- Helps improve the overall hygiene of public spaces.

## Technologies Used
- **Java 8**: Backend logic implementation.
- **JSP (Java Server Pages)**: For building dynamic web pages.
- **MySQL**: Database for storing sensor data and user information.
- **Apache Server**: For hosting the web application.
- **Tomcat 7.0**: Java-based web server for running JSP applications.
- **Arduino**: Microcontroller to read sensor data.
- **Sensors**: To detect conditions such as odor and cleanliness in the toilet.

## Features
- **Real-time Monitoring**: Displays the current status of the public toilet.
- **Odor Detection**: Sensors detect bad odors and alert the system.
- **Maintenance Alerts**: Sends notifications when maintenance is required.
- **User Interface**: Simple and intuitive web interface for monitoring the data.
- **Database Integration**: Stores historical data for analysis and reporting.

## System Requirements
To run this project, you will need the following software installed on your system:
- **Java Development Kit (JDK) 8**
- **XAMPP Server** (for MySQL)
- **Apache Tomcat 7.0**
- **Eclipse IDE** (with Java EE support)
- **Arduino IDE** (for Arduino programming)
- **MySQL Database** (for storing data)

## Installation Guide

1. **Clone the Repository**  
   Clone the project repository to your local machine using:
   ```bash
   git clone https://github.com/yourusername/smart-public-restroom.git
