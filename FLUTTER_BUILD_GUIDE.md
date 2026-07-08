# Flutter APK Build Guide

## Prerequisites

### 1. Install Flutter SDK
```bash
# Download Flutter SDK
# https://flutter.dev/docs/get-started/install

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter --version
```

### 2. Install Android SDK & Tools
```bash
# Install Android Studio
# https://developer.android.com/studio

# Or install Android SDK Command Line Tools
# Set ANDROID_SDK_ROOT environment variable
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Accept licenses
flutter doctor --android-licenses
```

### 3. Verify Setup
```bash
flutter doctor
```

Should show:
- ✓ Flutter (Channel stable)
- ✓ Android toolchain - develop for Android devices
- ✓ Android Studio
- ✓ VS Code (optional)

---

## Project Setup

### 1. Navigate to Frontend Directory
```bash
cd frontend
```

### 2. Get Dependencies
```bash
flutter pub get
```

### 3. Clean Previous Builds
```bash
flutter clean
```

---

## Build APK

### Debug APK (Development)

```bash
# Build debug APK
flutter build apk --debug

# Output location
# build/app/outputs/flutter-apk/app-debug.apk
```

**When to use:**
- Local testing
- Development
- Quick iteration

---

### Release APK (Production)

#### Step 1: Create Signing Key
```bash
# Generate keystore (first time only)
keytool -genkey -v -keystore ~/key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias clinical_key

# Or use Android Studio
# Build → Generate Signed APK
```

When prompted, provide:
- Key store password: `your_password`
- Key password: `your_password`
- Key alias: `clinical_key`
- Common name: Your name
- Organizational unit: Your company
- Organization: Your company name
- City: Your city
- State: Your state
- Country: Your country code (e.g., PK)

#### Step 2: Configure Signing
Edit `android/app/build.gradle`:

```gradle
android {
    ...
    signingConfigs {
        release {
            keyAlias 'clinical_key'
            keyPassword 'your_password'
            storeFile file('/path/to/key.jks')
            storePassword 'your_password'
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

#### Step 3: Build Release APK
```bash
# Build release APK
flutter build apk --release

# Output location
# build/app/outputs/flutter-apk/app-release.apk
```

---

### App Bundle (Google Play Store)

```bash
# Build App Bundle
flutter build appbundle --release

# Output location
# build/app/outputs/bundle/release/app-release.aab
```

**Benefits:**
- Smaller download size
- Automatic optimization per device
- Required for Google Play Store

---

## Build with Specific Configuration

### Build for Specific Architecture
```bash
# ARM64 (most devices)
flutter build apk --release --target-platform android-arm64

# ARMv7 (older devices)
flutter build apk --release --target-platform android-arm

# x86 (emulators)
flutter build apk --release --target-platform android-x86

# All architectures
flutter build apk --release
```

### Build with Split APKs
```bash
flutter build apk --release --split-per-abi
```

Outputs:
- `app-armeabi-v7a-release.apk` (ARMv7)
- `app-arm64-v8a-release.apk` (ARM64)
- `app-x86-release.apk` (x86)

---

## Testing APK

### Install on Emulator
```bash
# List emulators
flutter emulators

# Start emulator
flutter emulators --launch <emulator_id>

# Install APK
adb install build/app/outputs/flutter-apk/app-debug.apk
```

### Install on Physical Device
```bash
# Enable USB Debugging on device
# Connect device via USB

# List devices
flutter devices

# Install APK
flutter install build/app/outputs/flutter-apk/app-debug.apk

# Or using adb
adb install build/app/outputs/flutter-apk/app-debug.apk
```

### Run Installed App
```bash
# Get package name from pubspec.yaml
# Usually: com.example.clinical_intelligence_platform

adb shell am start -n com.example.clinical_intelligence_platform/.MainActivity
```

---

## Troubleshooting

### Build Fails with "Could not find SDK"
```bash
# Run doctor to check
flutter doctor -v

# Accept Android licenses
flutter doctor --android-licenses

# Set Android SDK path
export ANDROID_SDK_ROOT=/path/to/android/sdk
```

### Gradle Build Fails
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk --release -v
```

### Permission Errors
```bash
# Make sure you have write permissions
chmod -R 777 ~/Android/Sdk
chmod -R 777 ~/key.jks
```

### APK Too Large
```bash
# Enable minification and shrinking
flutter build apk --release

# Or build split APKs
flutter build apk --release --split-per-abi
```

### "No connected devices"
```bash
# Check devices
adb devices

# Reconnect device
adb reconnect

# Enable TCP debugging
adb tcpip 5555
adb connect <device_ip>:5555
```

---

## APK Distribution

### Method 1: Direct Installation
```bash
# Send via email or file sharing
# User taps to install (requires Unknown Sources enabled)
```

### Method 2: Google Play Store
1. Create Google Play Developer account ($25 one-time)
2. Create app listing
3. Upload signed AAB (App Bundle)
4. Wait for review (usually 2-4 hours)
5. Publish

### Method 3: Firebase App Distribution
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Distribute APK
firebase app:distribute build/app/outputs/flutter-apk/app-release.apk \
  --app 1:123456789:android:abcdefg... \
  --release-notes "Version 1.0.0 Release" \
  --testers-file testers.txt
```

### Method 4: GitHub Releases
```bash
# Create release with APK as attachment
git tag v1.0.0
git push origin v1.0.0
# Then upload APK to GitHub Releases
```

---

## Performance Optimization

### Reduce APK Size
```bash
# Enable shrinking
android {
    buildTypes {
        release {
            minifyEnabled true      # Enable ProGuard
            shrinkResources true    # Remove unused resources
        }
    }
}
```

### Target Modern Android
```gradle
android {
    compileSdkVersion 34
    targetSdkVersion 34
    minSdkVersion 21
}
```

### Update pubspec.yaml
```yaml
# In pubspec.yaml, remove unused dependencies
# Run: flutter pub outdated
# Run: flutter pub upgrade
```

---

## Debugging APK

### Enable Verbose Logging
```bash
flutter build apk --release -v
```

### Monitor App Logs
```bash
adb logcat
adb logcat | grep flutter
```

### Debug Installed App
```bash
flutter attach
```

---

## Build Variants

### Development
```bash
flutter build apk --debug
```

### Staging
```bash
flutter build apk --release --flavor staging
```

### Production
```bash
flutter build apk --release --flavor production
```

Configure in `pubspec.yaml` or `build.gradle`.

---

## CI/CD Integration (GitHub Actions)

Create `.github/workflows/flutter-build.yml`:

```yaml
name: Flutter Build APK

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.0'
      
      - run: flutter pub get
      - run: flutter build apk --release
      
      - name: Upload to Release
        uses: softprops/action-gh-release@v1
        with:
          files: build/app/outputs/flutter-apk/app-release.apk
```

---

## Build Information

After successful build:

```bash
# Check APK size
ls -lh build/app/outputs/flutter-apk/app-release.apk

# Analyze APK
unzip -l build/app/outputs/flutter-apk/app-release.apk | head -20

# Extract APK info
aapt dump badging build/app/outputs/flutter-apk/app-release.apk
```

---

## Next Steps

1. **Test on Devices:**
   - Physical Android phones
   - Various screen sizes
   - Different Android versions

2. **Optimize:**
   - Reduce app size
   - Improve startup time
   - Test battery usage

3. **Publish:**
   - Google Play Store
   - Firebase App Distribution
   - GitHub Releases

4. **Monitor:**
   - Firebase Analytics
   - Crash reporting
   - Performance monitoring

---

## Resources

- **Flutter Build Docs:** https://flutter.dev/docs/deployment/android
- **Android Studio Guide:** https://developer.android.com/studio
- **Google Play Console:** https://play.google.com/console
- **Firebase Distribution:** https://firebase.google.com/docs/app-distribution

---

## Quick Commands Reference

```bash
# Check setup
flutter doctor

# Get dependencies
flutter pub get

# Clean build
flutter clean

# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle
flutter build appbundle --release

# Run tests
flutter test

# Check version
flutter --version

# Format code
dart format lib/

# Analyze code
dart analyze
```

---

## Notes

- **Keystore Safety:** Keep your `key.jks` file safe and backed up
- **Password Management:** Store passwords securely, never commit to git
- **Version Codes:** Increment for each release (Google Play requirement)
- **Signing Key:** Valid for 25+ years, can be reused for updates
