const { app, BrowserWindow } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 900,
    height: 720,
    minWidth: 700,
    minHeight: 580,
    backgroundColor: '#0a0a0f',
    title: 'BUTTON SMASHER',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
    },
    // Frameless-look via custom frame, but keep default frame for simplicity
    frame: true,
    resizable: true,
  });

  win.setMenuBarVisibility(false);
  win.loadFile(path.join(__dirname, 'src', 'index.html'));
}

app.whenReady().then(() => {
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  app.quit();
});
