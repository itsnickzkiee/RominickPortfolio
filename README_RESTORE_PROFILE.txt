RESTORE ORIGINAL RECTANGULAR PROFILE (KEEP 5 THEMES + FIXED CARDS)
=================================================================

The updated files are:
- index.html  : switches the hero profile back to nicky.jpeg within its frame
- themes.css : removes the pop-out-specific styles but KEEPS project card repairs

Steps:
1. Open: C:\Users\Rominick\Downloads\RominickPortfolio
2. Back up index.html and themes.css if you edited either since the last ZIP.
3. Copy these two files into that folder, choosing Replace.
4. Keep your existing nicky.jpeg and style.css, script.js, themes.js, theme-init.js.
5. Preview via Live Server and check all five themes and Project cards.
6. In VS Code terminal:

   git add index.html themes.css
   git commit -m "Restore original profile frame"
   git push origin main

No need to delete profile-popout.png from your computer. It is simply no
longer referenced. Optional cleanup can be done separately.

If index.html has NEWER edits you need to keep, don't overwrite it.
Instead ONLY replace the old pop-out div block in that file with this:

<div class="profile-container">
    <div class="profile-glow"></div>
    <div class="profile-image">
        <img src="nicky.jpeg" alt="Rominick Dulay">
    </div>
</div>

NOTE: This ZIP is a patch for the existing portfolio, not the complete site.
