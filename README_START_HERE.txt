ROMINICK PORTFOLIO — FIVE-SWITCHABLE-THEMES UPDATE
==================================================
Works with your existing HTML/CSS/JS pages and project cards.

Themes:
1 Cyber Blue (futuristic cyan)
2 Minimal Luxury (white editorial)
3 Bento Grid (dashboard-style cards)
4 Developer Terminal (black / green command-line)
5 Creative Bold (violet/cyan expressive)

IMPORTANT: This is a safe patch, not a replacement projects.html.
It preserves your ScanSafe, FieldPro APK, PARA and all your existing edits.

INSTALL IN VS CODE (Windows PowerShell)
-------------------------------------
1. Extract this ZIP.
2. Copy these four files into:
   C:\Users\Rominick\Downloads\RominickPortfolio\
   - theme-init.js
   - themes.css
   - themes.js
   - INSTALL_THEMES.ps1
3. In VS Code, open the Git-connected folder above.
4. In Terminal (PowerShell):
   cd C:\Users\Rominick\Downloads\RominickPortfolio
   powershell -ExecutionPolicy Bypass -File .\INSTALL_THEMES.ps1
5. Run the website locally (VS Code Live Server recommended).
6. Look for the "Theme" settings control in the navbar.
7. Choose among the five designs. Your choice is stored in localStorage
   and remembered when navigating to About, Projects, Contact, or refreshing.
8. After testing, push to Github / Vercel:
   git add index.html about.html projects.html contact.html theme-init.js themes.css themes.js
   git commit -m "Add five switchable portfolio themes"
   git push origin main

NO NPM, no backend, no database needed for the themes.
Web3Forms contact form and existing project filtering remain unchanged.

SAFETY / CUSTOMIZATION
----------------------
The installer adds only references to three NEW files in your current HTML.
It does not replace index.html, projects.html, style.css, or script.js.
It also saves backup copies of HTML into your Windows TEMP directory.
You can run the installer again; it does not add duplicate references.

Pop-out portrait: the themes include decorative framed/offset profile effects.
For a true person-shaped cutout protruding from the frame, use a transparent
background portrait PNG in the existing profile <img src="...">. Regular
JPEGs have an opaque rectangular background and cannot give a clean silhouette.

If the automatic installer is blocked, manually add in each HTML:
- Just BEFORE the existing style.css link:
    <script src="theme-init.js"></script>
- Just AFTER the existing style.css link:
    <link rel="stylesheet" href="themes.css">
- Just AFTER the existing script.js tag near </body>:
    <script src="themes.js"></script>

Note: if you edit projects after making this patch, your original project
filters continue working; no extra data attributes are needed.
