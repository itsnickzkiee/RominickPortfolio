/*
  Keep the existing five-theme logic, but move its dropdown out of the
  navbar's backdrop-filter containing block. This makes it fit on phones.
*/
(function () {
  'use strict';

  function makeThemePanelResponsive() {
    const panel = document.getElementById('themePickerPanel');
    if (!panel || panel.dataset.mobileFixApplied === 'true') return;

    panel.dataset.mobileFixApplied = 'true';
    document.body.appendChild(panel);

    // The original theme script closes on outside pointerdown.
    // As the panel is no longer inside .theme-picker, don't treat
    // tapping an option inside the panel as an outside click.
    panel.addEventListener('pointerdown', function (event) {
      event.stopPropagation();
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', makeThemePanelResponsive);
  } else {
    makeThemePanelResponsive();
  }
})();
