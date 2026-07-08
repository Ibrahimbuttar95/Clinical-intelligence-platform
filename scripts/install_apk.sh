#!/bin/bash

# Clinical Intelligence Platform - APK Installation Script
# Usage: ./scripts/install_apk.sh [debug|release]

set -e

BUILD_TYPE=${1:-debug}
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"
FRONTEND_DIR="$PROJECT_DIR/frontend"

if [ "$BUILD_TYPE" = "release" ]; then
    APK_FILE="$FRONTEND_DIR/build/app/outputs/flutter-apk/app-release.apk"
else
    APK_FILE="$FRONTEND_DIR/build/app/outputs/flutter-apk/app-debug.apk"
fi

if [ ! -f "$APK_FILE" ]; then
    echo "APK file not found: $APK_FILE"
    echo "Please build the APK first: ./scripts/build_apk.sh $BUILD_TYPE"
    exit 1
fi

echo "Installing APK on connected device..."
echo "APK: $APK_FILE"
echo ""

adb install -r "$APK_FILE"

echo ""
echo "✓ Installation completed!"
echo ""
echo "To launch the app:"
echo "  adb shell am start -n com.example.clinical_intelligence_platform/.MainActivity"
