# ANT Flutter Project (v2)

Includes:
- Flutter app with auto-update check
- Node.js backend API stub for version info
- Placeholder Firebase configs

## Run App
flutter pub get
flutter run

## Run Backend
cd backend
npm install express
node server.js

Then app checks http://10.0.2.2:3000/api/version when running on emulator.

---
## CI/CD Setup

- GitHub Actions workflow is included at `.github/workflows/build.yml`
- On push to `main`, Flutter APK will build automatically
- A GitHub Release will be created with the APK attached
- Use that release URL in backend `update_url`

---
## 🔑 Signed APK Setup

1. Generate keystore:  
   ```bash
   keytool -genkey -v -keystore ant-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias antkey
   ```

2. Encode to base64:  
   ```bash
   base64 ant-key.jks > ant-key.jks.base64
   ```

3. Add GitHub secrets:
   - `ANT_KEYSTORE_BASE64`
   - `ANT_KEYSTORE_PASSWORD`
   - `ANT_KEY_ALIAS`
   - `ANT_KEY_PASSWORD`

4. Push to `main` → GitHub Actions builds a **signed APK** and publishes a **GitHub Release**.
