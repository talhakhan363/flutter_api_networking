<<<<<<< HEAD
# 🌐 Flutter API & Networking App

Welcome to the Week 4 deliverable of my Flutter Development Internship with **DevelopersHub Corporation**. This project marks the transition into Phase 2 of the program, focusing entirely on external data integration.

This repository contains a fully functional Flutter application that connects to a public RESTful API (`JSONPlaceholder`). It demonstrates core networking concepts, including asynchronous HTTP requests, dynamic JSON data parsing, and robust UI state management to gracefully handle loading states and network errors.

## ✨ Features & Highlights

* **RESTful API Integration:** Utilizes the `http` package to perform asynchronous GET requests to fetch real-world mock data.
* **JSON Serialization:** Engineered custom Dart models (`UserModel`) to safely and efficiently parse incoming JSON data into typed Dart objects.
* **Robust UI State Management:** Employs `FutureBuilder` to smoothly handle different network states:
  * ⏳ Interactive loading spinners while fetching data.
  * 🛑 Strict network error handling to prevent app crashes when offline or dealing with server issues.
  * ✅ Successful rendering of parsed data.
* **Dynamic UI Routing:** Passes specific data parameters between screens, navigating from a master list view to a detailed, customized User Profile view.
* **Dynamic UI Avatars:** Integrates with the `ui-avatars.com` API to dynamically generate professional profile pictures based on fetched user names.

## 📂 Project Architecture

The codebase employs a clean, modular architecture to separate network logic, data models, and the user interface:

lib/
│
├── main.dart                      # App entry point and theme configuration
├── models/
│   └── user_model.dart            # Data mapping for JSON -> Dart objects
├── services/
│   └── api_service.dart           # Handles all HTTP requests and error catching
└── screens/
    ├── users_list_screen.dart     # FutureBuilder UI for Loading/Error/List states
    └── user_profile_screen.dart   # Detailed view for individual users

## 🛠️ Technology Stack

Framework: Flutter
Language: Dart
Packages: http: ^1.2.1 (for HTTP network requests)
APIs Used: JSONPlaceholder (/users), UI-Avatars

## 🚀 Getting Started

To run this project on your local machine, follow these steps:
Prerequisites:
Flutter SDK installed on your machine.
An emulator running or a physical device connected.
Installation:
Clone the repository:
git clone https://github.com/talhakhan363/flutter_api_networking
Navigate into the directory:
cd flutter-api-networking
Fetch dependencies:
flutter pub get
Run the app:
flutter run

## 👨‍💻 Author
Muhammad Talha Khan
Software Engineering Undergraduate, UBIT Class of 2026
Project Management Team Member: Microsoft Learn Student Ambassador (MLSA), Google Developer Student Clubs (GDSC)
GitHub: @talhakhan363
LinkedIn: www.linkedin.com/in/muhammad-talha-khan-298941212
=======
# flutter-api-networking
INTERNSHIP TASK 4: A Flutter application demonstrating RESTful API integration, JSON parsing, and robust network error handling using the http package.
>>>>>>> 700db6b77853c3bd5a723e609cff885921f2bf57
