# WADDI — Shipping Services Management System

> A real-time shipment tracking mobile application built with Flutter as a graduation project.

---

## 📱 About the Project

WADDI is a shipping and logistics management system that allows users to track shipments in real time, view optimized delivery routes, and manage orders through a clean, intuitive mobile interface.

Built by a team of 5+ students as a graduation project at Banha University (2023).

---

## ✨ Features

- 📦 Real-time shipment tracking with live location updates
- 🗺️ Route optimization using Google Maps SDK
- 🔐 User authentication via Firebase
- 📊 Order and delivery status management
- 🔔 Notifications for shipment status changes
- 📱 Responsive UI for Android and iOS

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Cubit (flutter_bloc) |
| Architecture | Clean Architecture |
| Maps | Google Maps SDK |
| Backend | Firebase (Auth, Firestore) |
| Networking | REST APIs |
| Version Control | Git |

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles, separating the codebase into:

```
lib/
├── core/           # Shared utilities, constants, theme
├── data/           # API clients, repositories, models
├── domain/         # Entities, use cases, interfaces
└── presentation/   # UI screens, Cubits, widgets
```

---

## 👨‍💻 My Contributions

This was a team graduation project (5+ members). My specific contributions included:

- **API Integration** — Connected and consumed RESTful APIs for shipment data, user authentication, and order management including request handling and error management
- **State Management** — Implemented Cubit-based state management across key app features, managing loading, success, and error states
- **UI Development** — Built several core screens including shipment listing, tracking view, and order details with responsive layouts

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio / VS Code
- A Firebase project with Firestore and Authentication enabled

### Installation

```bash
# Clone the repository
git clone https://github.com/ahmedabdalla67/Wadddy_App.git

# Navigate to project directory
cd waddi

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 👥 Team

Graduation project — Banha University, Computer Science & Artificial Intelligence Department (2023).

---

## 📄 License

This project was developed for academic purposes as a graduation project at Banha University.
