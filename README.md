# UserDetails Feature Module with Clean Architecture and BLoC

This project demonstrates a feature module named **"UserDetails"** in Flutter, following **Clean Architecture principles** and using **BLoC** for state management. The module allows users to view their name, email, and enter their phone number (with Iranian phone number validation) to submit.

## Table of Contents
- [Project Structure](#project-structure)
- [Features](#features)
- [Packages Used](#packages-used)
- [Getting Started](#getting-started)
- [How to Run](#how-to-run)
- [Folder Structure](#folder-structure)
- [How It Works](#how-it-works)

## Project Structure

This project follows the **Clean Architecture** principles, which divides the application into three main layers:
1. **Presentation Layer**: Contains the UI and state management (using Cubit).
2. **Domain Layer**: Contains the business logic, including entities, use cases, and repository contracts.
3. **Data Layer**: Handles data fetching and persistence, such as remote data sources (API calls).

## Features

- **UserDetails Module**:
    - Displays user's name and email.
    - Accepts and validates a phone number input (Iranian format).
    - Submits the phone number.

- **State Management**:
    - Managed using **BLoC** (via `flutter_bloc` package).

- **Data Fetching**:
    - Utilizes **Dio** for making network requests.
    - Logs API calls with **Pretty Dio Logger**.

- **Dependency Injection**:
    - Implemented with **GetIt** for managing services and repositories.

## Packages Used

The following packages are used in this project:

- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: BLoC state management.
- **[equatable](https://pub.dev/packages/equatable)**: Simplifies equality comparisons between objects.
- **[dio](https://pub.dev/packages/dio)**: For making HTTP requests.
- **[pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger)**: Logs network requests in an easy-to-read format.
- **[get_it](https://pub.dev/packages/get_it)**: A service locator for dependency injection.
- **[dartz](https://pub.dev/packages/dartz)**: Functional programming tools such as `Either`.
- **[internet_connection_checker](https://pub.dev/packages/internet_connection_checker)**: Checks network connectivity status.
- - **[shared_preferences](https://pub.dev/packages/shared_preferences)**: For storing simple key-value pairs, such as caching user details for offline access.

## Getting Started

### Prerequisites

## API Endpoints

The following API endpoints are used for this feature module:

1. **Get User Details**
    - **Method:** `GET`
    - **Endpoint:** `https://jsonplaceholder.typicode.com/users/1`
    - **Description:** This endpoint fetches the user's details such as name and email.

2. **Submit User Phone Number**
    - **Method:** `POST`
    - **Endpoint:** `https://reqres.in/api/users`
    - **Description:** This endpoint accepts the user's phone number and submits it for further processing.

Offline Support
This module supports offline mode. If there is no internet connection while fetching user details (like name and email), but cached data is available, the cached data will be used to display the user’s information. This feature ensures that the user can still access their information even without an active internet connection.

Note: To test this feature, you can disable the device’s internet connection. If the user’s data has already been cached, it will be used to display the user's name and email.
This feature is implemented to enhance user experience and ensure data accessibility in case of weak or unavailable internet connectivity.

