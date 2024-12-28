

# [<img src="/assets/icon/logo-rounded-corners.png" width="23" />](https://lr-projects.de) Stick-It: *Map & Stickers*
 
[![Codemagic build status](https://api.codemagic.io/apps/63413ae4c15332316120753f/63413ae4c15332316120753e/status_badge.svg)](https://codemagic.io/app/63413ae4c15332316120753f/63413ae4c15332316120753e/latest_build)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/lr101/stick-it/issues)
[![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white&style=flat)](https://discord.gg/ReMZ8j6S8X)
[![Play Store](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white&style=flat)](https://play.google.com/store/apps/details?id=com.TheGermanApps.buff_lisa)
[![App Store](https://img.shields.io/badge/App_Store-0D96F6?style=for-the-badge&logo=app-store&logoColor=white&style=flat)](https://apps.apple.com/de/app/stick-it-geomap/id6446781455)

## Description

Experience sticker sharing like never before! Welcome to Stick-It, the app to record where in the world your stickers can be found📍🎉

Upload pictures, share them with your groups and tag them right where you took them. Even better: explore new spots and cool content posted by others on an interactive map! 🌍📸

What makes Stick-It so special?  
🌟 Groups & Community: Share your best shots with groups and discover what your friends and other adventurers have posted. Whether it's street art, stickers or insider tips - Stick-It captures them all!

🗺️ Interactive map view: See all your uploaded stickers and groups directly on the map. Tap on a location to see the local ranking. Oh yes - Ranking - Become the biggest in your region, country or the world and collect Achievements

⚡ Quick & Easy: Take photos, upload, share - all in seconds!

📖 Overview feed: Keep track of all your groups and photos - activate or deactivate groups with just one click.

🚀 Ready to Stick-It?  
What are you waiting for? Get Stick-It now for Android and iOS and discover the world in a whole new way. Your adventures are waiting! 🌟

## How does it work?

The Stick-It app is built using the **Flutter** framework, which allows for cross-platform development on Android, iOS, and web platforms. Here's a high-level overview of how the app works:

### Structure

The app is structured as follows:
 - **data**: contains data models, repositories, and services. Repositories handles and provides database operations. Services provide business logic for the app, including holding global state values and making api calls.
 - **features**: contains the app's features (mostly widgets where a route leads to), such as the main screen, group screen, and profile screen. Each directory is split into representation (UI) and data (screen specific logic and states).
 - **util**: contains utility classes, such as the app's theme, routing, and error handling.
 - **widgets**: contains reusable widgets that are used across the app. Each directory is split into representation (UI) and data (screen specific logic and states).

### Development setup
- Install & setup [Flutter](https://flutter.dev/docs/get-started/install)
- Clone api repository  ```git clone git@github.com:lr101/MonaServerApi.git ../MonaServerApi```
- Run pub get to install dependencies ```flutter pub get```
- Run build runner to generate database and riverpod code: ```dart run build_runner build```

## Developer references

### Set new icon
1. change asset path in pubspec.yaml
2. run: ```flutter packages pub run flutter_launcher_icons:main```

### Build android apk
1. run: ```flutter build apk```

### Release app

The app release in Google Play Store and App Store is managed via Codemagic. The pipeline is triggered when a new commit is pushed to the main branch.

### Generate API
1.
2. Activate openapi-generator: `flutter pub global activate openapi_generator_cli`
3. Run generator: `openapi-generator generate -i ../MonaServerApi/openapi.yaml -g dart -o ./api`
