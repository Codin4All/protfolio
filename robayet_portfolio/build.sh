
#!/usr/bin/env bash
set -e

git clone --depth 1 https://github.com/flutter/flutter.git -b stable /tmp/flutter
export PATH="/tmp/flutter/bin:$PATH"

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release
