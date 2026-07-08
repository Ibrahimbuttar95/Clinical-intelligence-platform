#!/bin/bash

# Clinical Intelligence Platform - APK Build Script
# Usage: ./scripts/build_apk.sh [debug|release]

set -e

BUILD_TYPE=${1:-debug}
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"
FRONTEND_DIR="$PROJECT_DIR/frontend"
BUILD_OUTPUT="$FRONTEND_DIR/build/app/outputs/flutter-apk"

echo "================================"
echo "Clinical Intelligence Platform"
echo "APK Build Script"
echo "================================"
echo ""
echo "Build Type: $BUILD_TYPE"
echo "Project Directory: $PROJECT_DIR"
echo ""

# Change to frontend directory
cd "$FRONTEND_DIR"

echo "[1/4] Cleaning previous builds..."
flutter clean

echo "[2/4] Getting dependencies..."
flutter pub get

echo "[3/4] Building $BUILD_TYPE APK..."
if [ "$BUILD_TYPE" = "release" ]; then
    flutter build apk --release
    APK_FILE="$BUILD_OUTPUT/app-release.apk"
    echo ""
    echo "[4/4] Building App Bundle..."
    flutter build appbundle --release
    echo ""
    echo "✓ Build completed successfully!"
    echo ""
    echo "Output files:"
    echo "  - APK: $APK_FILE"
    echo "  - Bundle: $FRONTEND_DIR/build/app/outputs/bundle/release/app-release.aab"
else
    flutter build apk --debug
    APK_FILE="$BUILD_OUTPUT/app-debug.apk"
    echo ""
    echo "[4/4] Build completed successfully!"
    echo ""
    echo "Output file:"
    echo "  - APK: $APK_FILE"
fi

echo ""
echo "APK size: $(du -h $APK_FILE | cut -f1)"
echo ""
echo "To install on device:"
echo "  adb install -r $APK_FILE"
echo ""
echo "To install on emulator:"
echo "  flutter emulators --launch <emulator_name>"
echo "  adb install -r $APK_FILE"
