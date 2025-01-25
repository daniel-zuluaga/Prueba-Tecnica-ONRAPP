# Project Documentation

## Introduction

This project implements a Clean Architecture using Flutter, with state management through BLoC and support for dependency injection through Kiwi. The goal is to build a modular, scalable and maintainable application to manage products.

## Project Structure

The project structure is organised according to Clean Architecture principles:

lib/
├── core/ # Shared code and common utilities
├── feature/
│ └─── product/ # Main product module
│ ├─── data/ # Data access logic (repositories, API, DTO models)
│ ├── domain/ # Entities and use cases
│ └─── presentation/ # Displays, widgets and BLoC
└└─── main.dart # Entry point of the application

## Technologies used

- Flutter: Main framework for building the user interface.

- BLoC: State handling through events and states.

- Kiwi: Dependency injection.

- Mocktail: Testing framework to simulate dependencies.

- Either.dart: Error handling and results in use cases.

## Best Practices Implemented

- Modularity: Each layer (data, domain, presentation) is well separated.

- Clean Architecture: Application of SOLID principles.

- Unit Testing: Coverage in use cases and BLoC.

- Error Handling: Use of Either to handle errors and successful data.

## Conclusion

This project demonstrates how to use Clean Architecture and modern tools such as BLoC and Kiwi to create modular, scalable and maintainable Flutter applications. The implementation ensures that responsibilities are clearly defined, with easily extensible and testable code.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
