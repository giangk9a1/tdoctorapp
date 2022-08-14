# 1. TDoctor
- App name: TDoctor
- Package name: com.app.khambenh.bacsiviet

  iOS: com.app.khambenh.bacsiviet
    - https://apps.apple.com/us/app/tdoctor/id1443310734

  Android: com.app.khambenh.bacsiviet
    - https://play.google.com/store/apps/details?id=com.app.khambenh.bacsiviet

# 2. Technical Development

## 2.1 How to Run
Step 1: Install Flutter: https://flutter.dev/docs/get-started/install
  - Flutter version: 3.0
  - Channel: stable

Step 2: Get source.
  ```
  flutter pub get
  ```
Step 3: run
  ```
  flutter run
  ```

```
  This project is a starting point for a Flutter application.
  A few resources to get you started if this is your first Flutter project:
  - [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
  For help getting started with Flutter, view our
  [online documentation](https://flutter.dev/docs), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.
```

## 2.2 API document
  

# 3. Development: How to build 
# 3.1 Flutter
```
  flutter run
```

## 3.2 Build apk release

```
  flutter build apk --split-per-abi
```

## Adroid appbundle 

```
    APK

    flutter build apk --flavor prod -t lib/main_prod.dart
    App Bundle

    flutter build appbundle --flavor prod -t lib/main_prod.dart
    and for dev

    APK

    flutter build apk --flavor dev -t lib/main_dev.dart
    App Bundle

    flutter build appbundle --flavor dev -t lib/main_dev.dart
```


