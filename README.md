# Flutter App: *Stick-It*

## Description

Introducing our new photo-sharing app, **Stick-It**! **Stick-It** is a social media platform that is similar to Instagram, but with a unique twist - all images uploaded on **Stick-It** are tagged with the location where they were taken and assigned to a group.

**Stick-It** makes it easy for you to organize and share your photos by assigning them to groups. Your fellow group members profit from your discoveries and can find them there themselves. **Stick-It** is perfect for sharing unique places. A very popular content are images and locations of stickers. The app is perfect for keeping track of all the locations and taking images is easy and very fast.

One of the standout features of **Stick-It** is its interactive map view. When you open the app, you'll see a map with pins that represent the different groups you've created. Tapping on a pin will reveal the photo taken at that exact location and was assigned to the group, allowing you to explore different places and memories.

**Stick-It** also allows you to create and delete groups, making it easy to manage your content. Additionally, you can view all your photos and groups in a feed like overview. The shown groups can always be activated or deactivated by a single button press at the top of the screen.

Whether you're a casual photographer or a seasoned traveler, **Stick-It** is the perfect app to capture and share your experiences. So what are you waiting for? Download **Stick-It** today on [Android](https://play.google.com/store/apps/details?id=com.TheGermanApps.buff_lisa) and iOS and start sharing your world!

## How does it work?

### Flutter

The app is programmed in the language dart using the framework flutter. Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. [source](https://en.wikipedia.org/wiki/Flutter_(software))

Therefore, the App can be easily compiled to Android, iOS and Web. In addition to the compilable code base of the widget, android and iOS require to add multiple actions like permission, app image and native ads to be added in their respected native build structure. Everything related to android can be found in the [android folder](/android) and to iOS in the [iOS folder](/ios)

### Structure

How the different pages interact with each can be found [here]().

## Helpful commands

### Set new icon
1. change asset path in pubspec.yaml
2. run: ```flutter packages pub run flutter_launcher_icons:main```

### Build android apk
- run: ```flutter build apk```

### Build app bundle release (android)

- run: ```flutter build appbundle```

### Build ios release

- run ```flutter build ipa```
- run ```xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey B4589LDTP6 --apiIssuer 085ec48f-332a-4138-b4dd-c64be661fa63``` 
- or ```xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey 5QT3Y74Q5L --apiIssuer 085ec48f-332a-4138-b4dd-c64be661fa63```

### Openapi
1. Activate openapi-generator:
  ```shell
  flutter pub global activate openapi_generator_cli
  ```
2. Run generator:
  ```shell
  openapi-generator generate -i ../MonaServerApi/openapi.yaml -g dart -o ./api
  ```