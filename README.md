# MovieHub

MovieHub is a Flutter app that allows users to explore movies and TV shows using the TMDB API. It provides a comprehensive set of features for discovering, searching, and tracking favorite content. The app is built using Flutter and follows the Clean Code architecture principles.

## Features

- **Search:** Search for movies and TV shows by title.
- **Watchlist:** Add movies and TV shows to your watchlist for later viewing.
- **Now Playing Movies:** Browse the latest movies currently playing in theaters.
- **Popular Movies:** Explore a collection of popular movies based on user ratings.
- **Top Rated Movies:** Discover the highest-rated movies according to user ratings.
- **Movie Details:** View detailed information about movies, including overview, rating, release date, and genres.
- **Movie Cast:** Access the cast and crew members of movies.
- **Movie Reviews:** Read reviews and ratings from users for a specific movie.
- **Similar Movies:** Discover similar movies based on the selected movie.
- **On Air TV Shows:** Explore TV shows that are currently airing.
- **Popular TV Shows:** Discover popular TV shows based on user ratings.
- **Top Rated TV Shows:** Explore the highest-rated TV shows according to user ratings.
- **TV Show Details:** View detailed information about TV shows, including overview, rating, and genres.
- **Similar TV Shows:** Discover similar TV shows based on the selected TV show.
- **TV Show Season Details:** Access information about individual seasons of a TV show.

## Screenshots

Include some screenshots or GIFs showcasing the user interface and features of your app.

## Getting Started

To get started with MovieHub, follow these steps:

1. Clone the repository:
   ```shell
   git clone https://github.com/OssHeikal/MovieHub.git

2. Navigate to the project directory:
   ```shell
   cd MovieHub
   
3. Install dependencies:
   ```shell
   flutter pub get

3. Obtain a TMDB API key:
- Sign up for an account on the [TMDB website](https://www.themoviedb.org/).
- Navigate to your account settings and click on the "API" section.
- Generate a new API key and copy it.

4. Add your API key to the project:
- Open the project in your preferred IDE and navigate to `lib/core/data/network/api_constants.dart`.
- Replace the value of `apiKey` with your TMDB API key.
  ```shell
  apiKey = 'YOUR_API_KEY';

6. Run the app: 
   ```shell
   flutter run

## Packages

The following packages are used in this project:

- [bloc](https://pub.dev/packages/bloc): A predictable state management library for Dart.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Flutter integration for the bloc state management library.
- [cached_network_image](https://pub.dev/packages/cached_network_image): A flutter library to show images from the internet and keep them in the cache directory.
- [carousel_slider](https://pub.dev/packages/carousel_slider): A carousel slider widget for Flutter.
- [dartz](https://pub.dev/packages/dartz): A functional programming package for Dart.
- [dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart.
- [equatable](https://pub.dev/packages/equatable): Simplify equality comparisons in Dart.
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar): A simple yet fully customizable rating bar for Flutter.
- [get_it](https://pub.dev/packages/get_it): A simple service locator for Dart and Flutter.
- [go_router](https://pub.dev/packages/go_router): A flexible and lightweight router for Flutter.
- [google_fonts](https://pub.dev/packages/google_fonts): A package for using custom Google Fonts in Flutter.
- [shimmer](https://pub.dev/packages/shimmer): A package for creating shimmering effect loading placeholders in Flutter.

To include these packages in your project, add them to the `pubspec.yaml` file and run `flutter pub get` to fetch the dependencies.

For more information about each package, refer to the provided links to their pub.dev pages.

## Contributing

Contributions to MovieHub are welcome! If you encounter any issues or have suggestions for improvement, please submit a bug report or a feature request via the issue tracker. You can also fork the repository, make your changes, and submit a pull request.
   
