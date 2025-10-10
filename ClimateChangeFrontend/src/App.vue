<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <div class="app-container">
    <header class="app-header">
      <div class="logo-container">
        <img alt="Clima logo" class="logo" src="./assets/logo.svg" width="48" height="48" />
        <h1 class="site-title">Cambio Climático</h1>
      </div>
      
      <nav class="nav-menu">
        <RouterLink to="/" class="nav-link">Inicio</RouterLink>
        <RouterLink to="/login" class="nav-link">Iniciar Sesión</RouterLink>
        <RouterLink to="/register" class="nav-link">Registrarse</RouterLink>
      </nav>
    </header>

    <main>
      <RouterView />
    </main>
    
    <footer class="app-footer">
      <p>&copy; 2025 Sistema de Monitoreo Climático | Universidad de Santiago de Chile</p>
    </footer>
  </div>
</template>

<style>
:root {
  --color-primary: #3498db;
  --color-primary-dark: #2980b9;
  --color-secondary: #2ecc71;
  --color-background: #f8f9fa;
  --color-background-soft: #ffffff;
  --color-background-mute: #f1f5f9;
  --color-border: #e2e8f0;
  --color-heading: #1e293b;
  --color-text: #334155;
  --color-text-light: #64748b;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  min-height: 100vh;
  color: var(--color-text);
  background: var(--color-background);
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu,
    Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
  font-size: 16px;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.app-header {
  background-color: var(--color-background-soft);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  padding: 1rem 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo-container {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.site-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--color-heading);
}

.logo {
  height: 48px;
  width: auto;
}

.nav-menu {
  display: flex;
  gap: 1.5rem;
}

.nav-link {
  color: var(--color-text);
  text-decoration: none;
  font-weight: 500;
  padding: 0.5rem 0;
  position: relative;
  transition: color 0.3s;
}

.nav-link:hover {
  color: var(--color-primary);
}

.nav-link.router-link-active {
  color: var(--color-primary);
}

.nav-link.router-link-active::after {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 2px;
  width: 100%;
  background-color: var(--color-primary);
}

main {
  flex: 1;
}

.app-footer {
  background-color: var(--color-background-soft);
  border-top: 1px solid var(--color-border);
  padding: 1.5rem;
  text-align: center;
  font-size: 0.9rem;
  color: var(--color-text-light);
}

@media (max-width: 768px) {
  .app-header {
    flex-direction: column;
    gap: 1rem;
    padding: 1rem;
  }
  
  .nav-menu {
    width: 100%;
    justify-content: space-around;
  }
}
</style>
