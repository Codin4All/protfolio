# Md. Robayet Ferodus - Portfolio (Flutter Web)

## Run
1. Install Flutter (3.22+). Inside this folder run:
   `flutter create . --platforms web`   (adds the missing web files, keeps yours)
2. `flutter pub get`
3. `flutter run -d chrome`
4. Build: `flutter build web --release` then upload `build/web` to Firebase Hosting / Netlify / GitHub Pages.

If Chrome's remote-debug connection times out, run `flutter run -d web-server --web-hostname=127.0.0.1 --web-port=7357` and open `http://127.0.0.1:7357` in Chrome. VS Code also has a `Portfolio - Web Server Preview` launch profile. Web-server mode has more limited browser debugging than the Chrome device.

## Email contact form
The contact form sends submissions through FormSubmit to `robayetferodosh@gmail.com`. No provider IDs are needed. FormSubmit requires a one-time email confirmation on first use. Confirm its activation email to release pending submissions to your inbox. FormSubmit processes the submission before forwarding it to your inbox.

## Edit your content
Everything lives in `lib/data/portfolio_data.dart`: contact details, project GitHub/Live links,
certificates, skills, about text, and the CV link.
Images: screenshots go in `assets/images/` (project_1.png ...), certificates in `assets/certificates/`.

## Before publishing
- Replace `YOUR-DOMAIN.com` in `web/index.html`, `web/robots.txt`, `web/sitemap.xml`.
- Replace the placeholder certificates and add your resume link.
- Submit the sitemap in Google Search Console.
