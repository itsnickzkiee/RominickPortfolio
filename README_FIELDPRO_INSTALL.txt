FIELDPRO PORTFOLIO UPDATE
=========================

WHAT CHANGED
- projects.html: Added FieldPro card and a Mobile filter. Existing 6 projects retained.
- fieldpro.png: FieldPro logo for the project preview.
- downloads/FieldPro.apk: Exact APK supplied by you.

INSTALL / UPDATE (VS CODE)
1. Open your GitHub-connected folder:
   C:\Users\Rominick\Downloads\RominickPortfolio
2. Extract this ZIP. Copy projects.html, fieldpro.png, and the entire
   downloads folder from the ZIP into RominickPortfolio.
3. Allow projects.html to be replaced ONLY if you have not made newer edits
   since the previous ScanSafe version. If you have newer edits, use the
   FIELDPRO_PROJECT_CARD.html snippet supplied in the ZIP instead, and add
   the Mobile filter manually.
4. Save. Open projects.html and check All / Mobile / Other filters.
5. In the GitHub-connected VS Code terminal:
     git add projects.html fieldpro.png downloads/FieldPro.apk
     git commit -m "Add FieldPro APK to portfolio"
     git push origin main
6. After Vercel deployment, test that the Download APK button works.

IMPORTANT NOTE ABOUT APK SIZE
- The APK is about 64.2 MB (61.2 MiB). GitHub warns for files over 50 MiB,
  but allows up to 100 MiB in normal Git. The commit may display a warning.
- For long-term best practice, upload FieldPro.apk as a GitHub Release asset
  instead of committing it with the website; then replace the href on the
  button with the Release's exact asset download URL. Do not use a guessed URL.
- Browser direct APK downloads can require a download confirmation, and on
  Android, installing APKs may require allowing installs from that source.

VERIFIED APP LIBRARIES
From static inspection of the APK: Flutter/Dart, Firebase Authentication,
Cloud Firestore, Geolocator, and Flutter Map assets. This inspection does not
prove that every feature in the description is configured or used at runtime.

NOTE ON PROJECT EDITS
The portfolio here was built from the most recently supplied portfolio ZIP;
if you changed index.html or projects.html locally afterward, keep those edits
by transplanting only the new card instead of overwriting your edited file.
