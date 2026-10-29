/* Apply the saved theme before CSS renders to prevent a flash of another theme. */
(function () {
  var allowed = ['cyber', 'minimal', 'bento', 'terminal', 'creative'];
  var saved = 'cyber';
  try { saved = localStorage.getItem('rominickPortfolioTheme') || 'cyber'; } catch (error) {}
  document.documentElement.setAttribute('data-portfolio-theme', allowed.includes(saved) ? saved : 'cyber');
})();
