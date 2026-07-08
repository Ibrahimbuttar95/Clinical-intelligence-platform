# Clinical Intelligence Platform - APK Installation Guide

## Quick Start

### Option 1: Using Build Scripts (Linux/Mac)

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Build APK
./scripts/build_apk.sh debug      # For testing
./scripts/build_apk.sh release    # For production

# Install APK
./scripts/install_apk.sh debug
```

### Option 2: Manual Build

```bash
cd frontend

# Clean and get dependencies
flutter clean
flutter pub get

# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release
```

---

## Installation Methods

### Method 1: Direct Installation via ADB

```bash
# Prerequisites
# - Android device with USB Debugging enabled
# - Android SDK Platform Tools installed
# - USB cable

# Connect device
adb devices

# Install APK
adb install -r build/app/outputs/flutter-apk/app-debug.apk

# Or for release
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

### Method 2: File Transfer Installation

1. Build APK:
   ```bash
   flutter build apk --release
   ```

2. Transfer APK to Android device:
   - Via email
   - Via cloud storage (Google Drive, OneDrive)
   - Via USB file transfer

3. On device:
   - Enable "Unknown Sources" in Settings → Security
   - Open file manager
   - Locate APK file
   - Tap to install

### Method 3: Firebase App Distribution

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Distribute APK
firebase app:distribute build/app/outputs/flutter-apk/app-release.apk \
  --app 1:YOUR_PROJECT_ID:android:YOUR_APP_ID \
  --release-notes "Version 1.0.0" \
  --testers-file testers.txt
```

### Method 4: GitHub Releases

1. Create release on GitHub
2. Upload APK as attachment
3. Share release link with users

---

## APK Files Generated

### Debug APK
- **Location:** `frontend/build/app/outputs/flutter-apk/app-debug.apk`
- **Size:** ~50-70 MB
- **Use case:** Development and testing
- **Signing:** Auto-signed with debug key

### Release APK
- **Location:** `frontend/build/app/outputs/flutter-apk/app-release.apk`
- **Size:** ~25-35 MB (optimized)
- **Use case:** Production, distribution
- **Signing:** Requires signing key

### App Bundle
- **Location:** `frontend/build/app/outputs/bundle/release/app-release.aab`
- **Use case:** Google Play Store submission
- **Benefits:** Smaller downloads, device-specific optimization

---

## System Requirements

### For Building APK
- Flutter SDK 3.13.0+
- Android SDK (API 21+)
- Gradle 8.0+
- Java 11+
- RAM: 4GB minimum (8GB recommended)
- Storage: 5GB free space

### For Running App
- Android 5.0+ (API 21+)
- RAM: 2GB minimum
- Storage: 100MB free space
- Internet connection

---

## Troubleshooting

### Build Fails
```bash
# Clean everything
flutter clean
cd frontend && rm -rf build/ && cd ..

# Get dependencies again
flutter pub get
flutter pub upgrade

# Try building again with verbose output
flutter build apk --debug -v
```

### Installation Fails
```bash
# Uninstall previous version
adb uninstall com.example.clinical_intelligence_platform

# Install again
adb install build/app/outputs/flutter-apk/app-debug.apk

# Force install
adb install -r -g build/app/outputs/flutter-apk/app-debug.apk
```

### Device Not Detected
```bash
# List devices
adb devices

# Reconnect device
adb disconnect
adb connect <device_ip>

# Check USB drivers (Windows)
# Device Manager → Update drivers if needed
```

### Permission Issues
```bash
# Grant runtime permissions on device
# Settings → Apps → Clinical Intelligence → Permissions
# Enable: Microphone, Storage, Camera (as needed)
```

---

## First Launch

1. **Open App** from home screen or app drawer
2. **Grant Permissions:**
   - Microphone (for voice input)
   - Storage (for file access)
   - Camera (if applicable)
3. **Connect to Backend:**
   - Ensure backend server is running
   - Check internet connectivity
4. **Register Account:**
   - Email and password
   - Verify connection to backend API

---

## Network Configuration

### Development

Edit `frontend/lib/services/api_client.dart`:

```dart
const String baseUrl = 'http://192.168.x.x:8000';
// Replace with your machine IP where backend is running
```

### Production

```dart
const String baseUrl = 'https://api.yourdomain.com';
```

---

## Performance Tips

1. **Reduce APK Size:**
   - Remove unused dependencies
   - Use release build (smaller than debug)
   - Enable ProGuard minification

2. **Improve Startup:**
   - Use release build
   - Close other apps
   - Warm up device

3. **Better Experience:**
   - Install on high-end device if available
   - Test on multiple devices
   - Monitor performance with Android Studio Profiler

---

## Updates

### Updating Installed App

```bash
# Build new version
# Update version in pubspec.yaml first
# Then build and install with -r flag

adb install -r build/app/outputs/flutter-apk/app-release.apk
```

### Automated Updates

Implement in-app update checking:
```dart
// Check for new version
// Download from backend
// Prompt user to update
```

---

## Security Considerations

1. **Always use HTTPS in production**
2. **Store sensitive data securely** using flutter_secure_storage
3. **Validate all API responses**
4. **Keep dependencies updated**
5. **Use ProGuard/R8 for obfuscation**
6. **Test on emulator before device**

---

## Support & Resources

- **Flutter Documentation:** https://flutter.dev/docs
- **Android Documentation:** https://developer.android.com/docs
- **GitHub Issues:** Report issues on repository
- **Email Support:** Contact development team

---

## Next Steps

1. ✓ Build APK
2. ✓ Install on device
3. → Test all features
4. → Report issues
5. → Provide feedback

Enjoy Clinical Intelligence Platform!
