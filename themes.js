/* Five portfolio themes. Works on every page, no frameworks needed. */
(function () {
  'use strict';

  const themes = [
    { id: 'cyber',    name: 'Cyber Blue',       description: 'Futuristic · neon cyan',  colors: ['#080c14', '#00c8ff'] },
    { id: 'minimal',  name: 'Minimal Luxury',   description: 'Editorial · warm white', colors: ['#f7f6f1', '#172b47'] },
    { id: 'bento',    name: 'Bento Grid',       description: 'Dashboard · indigo',     colors: ['#101628', '#8b92ff'] },
    { id: 'terminal', name: 'Developer Terminal', description: 'Console · green',       colors: ['#040e0b', '#62f2a2'] },
    { id: 'creative', name: 'Creative Bold',    description: 'Expressive · violet',   colors: ['#111025', '#a563ff'] }
  ];

  const root = document.documentElement;
  const storageKey = 'rominickPortfolioTheme';
  const defaultTheme = 'cyber';
  const nav = document.querySelector('.navbar');
  if (!nav) return;

  const wrapper = document.createElement('div');
  wrapper.className = 'theme-picker';
  wrapper.innerHTML = `
    <button class="theme-picker-trigger" id="themePickerTrigger" type="button"
      aria-label="Open appearance settings" aria-expanded="false" aria-controls="themePickerPanel">
      <span class="theme-picker-icon" aria-hidden="true">⚙</span><span>Theme</span>
    </button>
    <section class="theme-picker-panel" id="themePickerPanel" aria-label="Choose portfolio theme" hidden>
      <div class="theme-picker-heading">
        <div><strong>Appearance</strong><small>Choose a portfolio style</small></div>
        <button class="theme-picker-close" id="themePickerClose" type="button" aria-label="Close appearance settings">×</button>
      </div>
      <div class="theme-picker-options" id="themePickerOptions"></div>
      <p class="theme-picker-note">Your preference is remembered on this browser.</p>
    </section>`;

  nav.insertBefore(wrapper, nav.querySelector('.menu-btn'));
  const trigger = wrapper.querySelector('#themePickerTrigger');
  const panel = wrapper.querySelector('#themePickerPanel');
  const close = wrapper.querySelector('#themePickerClose');
  const options = wrapper.querySelector('#themePickerOptions');

  themes.forEach((theme, index) => {
    const option = document.createElement('button');
    option.type = 'button';
    option.className = 'theme-picker-option';
    option.dataset.theme = theme.id;
    option.setAttribute('aria-pressed', 'false');
    option.innerHTML = `
      <span class="theme-swatch" aria-hidden="true" style="--swatch-bg:${theme.colors[0]};--swatch-accent:${theme.colors[1]}">
        <i></i><i></i><i></i>
      </span>
      <span class="theme-option-label"><strong>${index + 1}. ${theme.name}</strong><small>${theme.description}</small></span>
      <span class="theme-option-check" aria-hidden="true">✓</span>`;
    option.addEventListener('click', () => {
      applyTheme(theme.id);
      setPanelOpen(false);
      trigger.focus();
    });
    options.appendChild(option);
  });

  function applyTheme(themeId) {
    const selected = themes.some(theme => theme.id === themeId) ? themeId : defaultTheme;
    root.setAttribute('data-portfolio-theme', selected);
    options.querySelectorAll('.theme-picker-option').forEach(option => {
      option.setAttribute('aria-pressed', String(option.dataset.theme === selected));
    });
    try { localStorage.setItem(storageKey, selected); } catch (error) { /* still works for this page */ }
  }

  function setPanelOpen(isOpen) {
    panel.hidden = !isOpen;
    trigger.setAttribute('aria-expanded', String(isOpen));
  }

  trigger.addEventListener('click', () => setPanelOpen(panel.hidden));
  close.addEventListener('click', () => { setPanelOpen(false); trigger.focus(); });
  document.addEventListener('pointerdown', event => {
    if (!panel.hidden && !wrapper.contains(event.target)) setPanelOpen(false);
  });
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && !panel.hidden) { setPanelOpen(false); trigger.focus(); }
  });

  applyTheme(root.getAttribute('data-portfolio-theme') || defaultTheme);
})();
