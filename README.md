# Medical App

Fullstack Developer Test - DesktopIP

## Requirements

- Flutter SDK version 3.0 or higher
- Dart version 2.19 or higher
- Android emulator or physical device for testing
- Xcode (for iOS development)

## Getting Started

To get started with this Flutter project, follow these steps:

Clone the Repository

```sh
git clone https://github.com/yogapermana76/medicalapp.git
cd medicalapp

```

### Install Dependencies Make sure you have Flutter SDK and Dart installed.

Install project dependencies by running:

```sh
flutter pub get
```

### Run the App Run the application on an emulator or physical device with:

```sh
flutter run
```

### Build the App To build a release version of the app, use:

```sh
flutter build apk   # For Android
flutter build ios   # For iOS
```

## Installation

1. Download and Install Flutter SDK Follow the installation instructions on the Flutter website.
2. Setup Flutter Add Flutter to your PATH:
   ```sh
   export PATH="$PATH:`<path-to-flutter-sdk>/bin`"
   ```
3. Verify Installation Ensure your Flutter installation is correct with:
   ```sh
   flutter doctor
   ```
4. Install Dependencies If using specific dependencies, make sure to run:
   ```sh
   flutter pub get
   ```

## Environment Variables

```sh
API_URL=
```

## Project Structure

```sh
assets/
│
└── images/            # Gambar aplikasi
    ├── desktopip_logo.png
    ├── icon_line.png
    ├── image_profile.png
    ├── obat_batuk.jpg
    └── obat_batuk.png


lib/
├── config/            # Global Config
│   └── app_config.dart
│
├── models/            # Model Class
│   ├── cart_model.dart
│   ├── chat_model.dart
│   ├── medicine_model.dart
├── ├── message_model.dart
│   └── user_model.dart
│
├── pages/           # UI Pages
│   ├── cart_page.dart
│   ├── checkout_page.dart
│   ├── checkout_success_page.dart
│   ├── detail_chat_page.dart
│   ├── detail_medicine_page.dart
│   ├── edit_profile_page.dart
│   ├── login_page.dart
│   ├── main_page.dart
│   ├── register_page.dart
│   └── splash_page.dart
│
├── providers/           # Global State
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── medicine_provider.dart
│   └── order_provider.dart
│
├── services/          # Service for API and WebSocket
│   ├── auth_service.dart
│   ├── chat_service.dart
│   ├── medicine_service.dart
│   ├── order_service.dart
│   └── websocket_service.dart
│
├── utils/             # Utilities FUnction and Helper
│   ├── error.utils.dart
│   ├── format_date.utils.dart
│   ├── format_number.utils.dart
│   └── local_storage.dart
│
├── widgets/           # Reusable Components
│   ├── auth_guard.dart
│   ├── cart_card.dart
│   ├── chat_bubble.dart
│   ├── chat_tile.dart
│   ├── checkout_card.dart
│   ├── loading_button.dart
│   ├── medicine_card.dart
│   ├── product_card.dart
│   └── product_tile.dart
│
├── main.dart
└── theme.dart

pubspec.yaml            # Dependensi proyek
```

## Dependencies

Here are the main dependencies used in the project, defined in pubspec.yaml:

```sh
dependencies:
  carousel_slider: ^5.0.0
  cupertino_icons: ^1.0.8
  flutter:
    sdk: flutter
  flutter_dotenv: ^5.1.0
  google_fonts: ^6.2.1
  http: ^1.2.2
  intl: ^0.19.0
  provider: ^6.1.2
  shared_preferences: ^2.3.2
  socket_io_client: ^2.0.3+1
```
