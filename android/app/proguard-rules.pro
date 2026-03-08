# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
 
# Dart core libraries (required for runtime)
-keep class dart.** { *; }
-keep class com.dart.** { *; }
 
# Third-party plugins (add specific rules for plugins you use)
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-keep class io.flutter.plugins.firebase.core.** { *; }