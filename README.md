# Movies App

<img width="300" alt="Screenshot 2023-09-21 at 6 31 45 PM" src="https://github.com/HassanHamdouna/move_app/assets/97970072/bf6a66fe-60b2-4063-ab01-3373aef55838">
<img width="300" alt="Screenshot 2023-09-21 at 6 31 27 PM" src="https://github.com/HassanHamdouna/move_app/assets/97970072/06670a09-524c-4fc4-b3ba-9faafe454d40">
<img width="300" alt="Screenshot 2023-09-21 at 6 30 30 PM" src="https://github.com/HassanHamdouna/move_app/assets/97970072/92ac1c40-e7cd-4198-96d4-a6662f16d78d">
<img width="300" alt="Screenshot 2023-09-21 at 6 30 44 PM" src="https://github.com/HassanHamdouna/move_app/assets/97970072/dfd5aaed-def4-482b-8ba1-1663b718b8fb">
<img width="300" alt="Screenshot 2023-09-21 at 8 55 13 PM" src="https://github.com/HassanHamdouna/move_app/assets/97970072/8f8ea38e-d74e-4e9e-b8c2-3274c145bd2a">



## Description

The Movies App is a Flutter application that allows users to discover and view information about movies and TV series. It utilizes the [The Movie Database (TMDb) API](https://developer.themoviedb.org/docs) to fetch data and offers a rich user experience with features such as a clean MVVM pattern, a well-organized project structure, and a custom theme design.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Configuration](#configuration)
- [Libraries Used](#libraries-used)
- [Contributing](#contributing)
- [Installation](#installation)
- [License](#license)

## Features

- Discover popular movies and TV series.
- Search for specific movies or series.
- View detailed information about movies and series, including ratings, descriptions, and cast.
- Organized MVVM pattern for efficient state management.
- Custom theme design for an appealing user interface.
- And more!


## Usage

- Launch the Movies App on your device.
- Explore the home screen to discover popular movies and TV series.
- Use the search feature to find specific movies or series.
- Tap on a movie or series card to view detailed information.
- Enjoy a seamless and visually appealing experience!
- And more!


## Libraries Used

The Movies App leverages various Flutter packages and libraries to enhance functionality and user experience. Some of the notable libraries used include:

- [Equatable](https://pub.dev/packages/equatable): Simplifies equality comparisons in Dart.
- [Dio](https://pub.dev/packages/dio): A powerful HTTP client for making network requests.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc): State management library for Flutter applications.
- [Get It](https://pub.dev/packages/get_it): A simple Service Locator for Dart and Flutter.
- [animate_do](https://pub.dev/packages/animate_do): Provides pre-built animations for Flutter widgets.
- [cached_network_image](https://pub.dev/packages/cached_network_image): Caches network images and optimizes performance.
- [carousel_slider](https://pub.dev/packages/carousel_slider): Allows the creation of image carousels.
- [google_fonts](https://pub.dev/packages/google_fonts): Provides access to the Google Fonts library.
- [shimmer](https://pub.dev/packages/shimmer): Adds shimmering effect to Flutter applications.
- [intl](https://pub.dev/packages/intl): Provides internationalization and localization support.
- [video_player](https://pub.dev/packages/video_player): Handles video playback.
- [choi](https://pub.dev/packages/choi): A Flutter implementation of the BLoC pattern.
- [duo](https://pub.dev/packages/duo): Simplifies managing app themes.


## Configuration

The Movies App uses the [The Movie Database (TMDb) API](https://developer.themoviedb.org/docs) to fetch data. To set up the API integration, follow these steps:

1. Sign up for a TMDb API key.
2. Configure the API key in the app. You can do this in the `lib/data/constants/api_constants.dart` file:

   ```dart
   class ApiConstants {
     static const String apiKey = 'YOUR_API_KEY_HERE';
   }



## Contributing

We welcome contributions to the Movies App! If you'd like to contribute, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bugfix: `git checkout -b feature/new-feature`.
3. Make your changes, ensuring that your code follows our coding standards.
4. Submit a pull request with a clear title and description of your changes.
5. Our team will review your pull request and provide feedback.

Thank you for contributing to our project!


## License

This project is licensed under the [MIT License](LICENSE).

**MIT License**


  

## Installation

To run the Movies App on your local machine, follow these installation steps:

```bash
# Clone the repository:
git clone https://github.com/yourusername/movies-app.git

# Navigate to the app directory:
cd movies-app

# Install dependencies:
flutter pub get

# Run the app:
flutter run


