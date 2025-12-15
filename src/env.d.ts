export {};

declare global {
  type ThemeMode = 'system' | 'light' | 'dark';

  interface Window {
    __getThemeMode?: () => ThemeMode;
    __setThemeMode?: (mode: ThemeMode) => ThemeMode | void;
    __resolveThemeMode?: (mode: ThemeMode) => string;
  }
}
