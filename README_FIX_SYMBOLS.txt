FIX FIELDPRO AND OTHER GARBLED SYMBOLS

1. Copy FIX_PORTFOLIO_SYMBOLS.ps1 to:
   C:\Users\Rominick\Downloads\RominickPortfolio

2. In the VS Code terminal:
   cd C:\Users\Rominick\Downloads\RominickPortfolio
   powershell -ExecutionPolicy Bypass -File .\FIX_PORTFOLIO_SYMBOLS.ps1

3. Test with Live Server. Verify FieldPro, PARA, arrow links, copyright and hamburger icon.

4. Commit when correct:
   git add index.html about.html projects.html contact.html
   git commit -m "Fix garbled portfolio symbols"
   git push origin main

The script edits your current HTML files in place, rather than replacing them
with an older copy. It keeps backups of changed files outside the Git repo,
in your Windows TEMP folder. It does not modify CSS, JS, themes, or images.

If the symbol still appears in the live site after a successful Vercel deployment,
refresh or try in a private browser tab to avoid a cached version.
