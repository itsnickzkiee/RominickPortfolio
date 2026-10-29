Rominick Portfolio – Layout + Pop-Out Profile Fix
============================================

Updated files (copy into the Git-connected RominickPortfolio folder):
1. index.html          — changes only hero profile HTML, preserves featured projects & themes
2. themes.css          — five themes + fixed project cards + responsive pop-out hero
3. profile-popout.png  — portrait silhouette made from your supplied portfolio screenshot

IMPORTANT
- BEFORE replacing index.html, save a copy if you edited it since the prior theme setup.
- If your index.html has newer edits, do NOT overwrite it. Instead update only the
  <div class="profile-container">...</div> within the Hero section to this:

  <div class="profile-container profile-popout-container">
      <div class="profile-glow" aria-hidden="true"></div>
      <div class="profile-frame" aria-hidden="true"></div>
      <div class="profile-image">
          <img src="profile-popout.png" alt="Rominick Dulay in a black suit">
      </div>
  </div>

- DO NOT remove your existing style.css, script.js, theme-init.js, or themes.js.
- Themes CSS must load AFTER style.css:
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="themes.css">
- Existing project filters and contact form stay untouched.

Test with Live Server at Home, Projects, and on a narrow mobile viewport. Try all 5 themes.

Commands (from C:\Users\Rominick\Downloads\RominickPortfolio):
  git add index.html themes.css profile-popout.png
  git commit -m "Fix project cards and add pop-out profile"
  git push origin main

PORTRAIT NOTE
The transparent pop-out image was reconstructed from the portfolio screenshot you provided,
so it is lower-resolution than your original nicks.png. For a sharper result later, use a
background-removed transparent PNG exported from the original formal photo and rename it
profile-popout.png.
