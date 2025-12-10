# 💰 Financial Portfolio

Flutter app for tracking investment portfolios with asset prices and performance visualization.

## Features

**Portfolio Dashboard**
- Asset list with current prices and percentage changes

**Performance Chart**
- 30-day portfolio value history
- Touch tooltips with date and value details

**Theme System**
- Retail Bank theme
- Neo Bank theme
- Toggle between themes instantly

**Performance Optimizations**
- 10-second response caching
- 5-second network timeout protection

## Architecture

```
lib/src/
├── core/theme/              # Theme management (BLoC)
├── features/portfolio/
│   ├── data/               # gRPC client, repositories
│   ├── domain/             # Repository interfaces
│   └── presentation/       # BLoC, UI widgets
└── generated/              # Protocol Buffers
```

**Patterns Used:**
- Clean Architecture (data/domain/presentation layers)
- BLoC pattern for state management
- Repository pattern for data access
- Protocol Buffers for type-safe data models
- Sealed classes for exhaustive state handling

## Tech Stack

| Category | Technology |
|----------|-----------|
| Framework | Flutter 3.10+ |
| State Management | BLoC, Equatable |
| Networking | gRPC, Protocol Buffers |
| Charts | fl_chart |
| Testing | flutter_test, bloc_test, mocktail |

## Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart SDK 3.10.1 or higher
- Protocol Buffers compiler (protoc) - for regenerating `.proto` files

**Note:** Protocol Buffer files are already generated in `lib/src/generated/`. You only need `protoc` if you modify `protos/assets.proto`.

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Generate coverage report
flutter test --coverage
```

## 📋 What to Expect

- Mock gRPC client simulates real API with 400ms delay (feels natural)
- 5 sample assets with realistic stock data
- Random daily fluctuations to simulate real market movement
