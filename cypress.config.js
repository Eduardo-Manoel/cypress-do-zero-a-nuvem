const { defineConfig } = require('cypress')

module.exports = defineConfig({
  viewportHeight: 880,
  viewportWidth: 1280,
  video: true,
  screenshots: true,
  e2e: {
    setupNodeEvents(on, config) {
      // Pega versão exata do Opera para usar como string
      const operaPath = 'C:\\Users\\eduar\\AppData\\Local\\Programs\\Opera\\opera.exe';

      config.browsers.push({
        name: 'opera',
        channel: 'stable',
        family: 'chromium',
        displayName: 'Opera',
        path: operaPath,
        version: '124.0.5705.65',  // <-- MUDE AQUI: string obrigatória
        majorVersion: 124      // Mantenha para compatibilidade
      });

      return config;
    },
  },
},
)