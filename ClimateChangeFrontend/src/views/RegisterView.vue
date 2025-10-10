<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import auth from '../services/auth'

const router = useRouter()
const rut = ref('')
const first_name = ref('')
const last_name = ref('')
const email = ref('')
const password = ref('')
const message = ref(null)
const loading = ref(false)

const submit = async () => {
  message.value = null
  loading.value = true
  try {
    const payload = {
      rut: rut.value,
      first_name: first_name.value,
      last_name: last_name.value,
      email: email.value,
      password: password.value
    }
    await auth.register(payload)
    message.value = { type: 'success', text: 'Account created successfully' }
    router.push({ name: 'login' })
  } catch (err) {
    const text = err?.response?.data?.message || err.message || 'Register failed'
    message.value = { type: 'error', text }
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="auth-container">
    <div class="auth-card">
      <div class="auth-header">
        <h2>Crear cuenta</h2>
        <div class="auth-icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="36" height="36">
            <path fill="currentColor" d="M15,4A4,4 0 0,0 11,8A4,4 0 0,0 15,12A4,4 0 0,0 19,8A4,4 0 0,0 15,4M15,5.9C16.16,5.9 17.1,6.84 17.1,8C17.1,9.16 16.16,10.1 15,10.1A2.1,2.1 0 0,1 12.9,8A2.1,2.1 0 0,1 15,5.9M4,7V10H1V12H4V15H6V12H9V10H6V7H4M15,13C12.33,13 7,14.33 7,17V20H23V17C23,14.33 17.67,13 15,13M15,14.9C17.97,14.9 21.1,16.36 21.1,17V18.1H8.9V17C8.9,16.36 12.03,14.9 15,14.9Z" />
          </svg>
        </div>
      </div>
      
      <form @submit.prevent="submit" class="auth-form">
        <div class="form-row">
          <div class="form-group">
            <label for="rut">RUT</label>
            <div class="input-with-icon">
              <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
                <path fill="currentColor" d="M12,19.2C9.5,19.2 7.29,17.92 6,16C6.03,14 10,12.9 12,12.9C14,12.9 17.97,14 18,16C16.71,17.92 14.5,19.2 12,19.2M12,5A3,3 0 0,1 15,8A3,3 0 0,1 12,11A3,3 0 0,1 9,8A3,3 0 0,1 12,5M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />
              </svg>
              <input 
                id="rut" 
                v-model="rut" 
                type="text" 
                placeholder="12345678-9" 
                required 
                pattern="^[0-9]{7,8}-[0-9K]$"
                title="Formato RUT válido: 12345678-9"
              />
            </div>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="first_name">Nombre</label>
            <div class="input-with-icon">
              <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
                <path fill="currentColor" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z" />
              </svg>
              <input id="first_name" v-model="first_name" type="text" required />
            </div>
          </div>
          
          <div class="form-group">
            <label for="last_name">Apellido</label>
            <div class="input-with-icon">
              <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
                <path fill="currentColor" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z" />
              </svg>
              <input id="last_name" v-model="last_name" type="text" required />
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="email">Correo electrónico</label>
          <div class="input-with-icon">
            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
              <path fill="currentColor" d="M20,8L12,13L4,8V6L12,11L20,6M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4Z" />
            </svg>
            <input id="email" v-model="email" type="email" required />
          </div>
        </div>

        <div class="form-group">
          <label for="password">Contraseña</label>
          <div class="input-with-icon">
            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
              <path fill="currentColor" d="M12,17A2,2 0 0,0 14,15C14,13.89 13.1,13 12,13A2,2 0 0,0 10,15A2,2 0 0,0 12,17M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6A2,2 0 0,1 4,20V10C4,8.89 4.9,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z" />
            </svg>
            <input 
              id="password" 
              v-model="password" 
              type="password"
              placeholder="Mínimo 8 caracteres" 
              required 
              minlength="8"
              title="La contraseña debe tener al menos 8 caracteres"
            />
          </div>
          <small class="form-hint">La contraseña debe tener al menos 8 caracteres</small>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn-submit" :disabled="loading">
            <span v-if="loading">
              <svg class="spin-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                <path fill="currentColor" d="M12,4V2A10,10 0 0,0 2,12H4A8,8 0 0,1 12,4Z" />
              </svg>
              Creando cuenta...
            </span>
            <span v-else>Crear cuenta</span>
          </button>
        </div>
      </form>

      <div v-if="message" class="message" :class="message.type">
        <svg v-if="message.type === 'success'" class="message-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
          <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
        </svg>
        <svg v-else class="message-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">
          <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
        </svg>
        {{ message.text }}
      </div>

      <div class="auth-footer">
        <p>¿Ya tienes una cuenta? <router-link to="/login">Inicia sesión</router-link></p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.auth-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 200px);
  padding: 2rem 1rem;
}

.auth-card {
  width: 100%;
  max-width: 600px;
  background: var(--color-background-soft);
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
  padding: 2rem;
}

.auth-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.auth-header h2 {
  font-size: 1.8rem;
  font-weight: 600;
  color: var(--color-heading);
}

.auth-icon {
  color: var(--color-primary);
  background-color: var(--color-background-mute);
  padding: 0.7rem;
  border-radius: 50%;
}

.auth-form {
  margin-bottom: 1.5rem;
}

.form-row {
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.form-row .form-group {
  flex: 1;
  margin-bottom: 0;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
  font-weight: 500;
  color: var(--color-text);
}

.form-hint {
  display: block;
  font-size: 0.8rem;
  margin-top: 0.5rem;
  color: var(--color-text-light);
}

.input-with-icon {
  position: relative;
}

.input-icon {
  position: absolute;
  left: 1rem;
  top: 50%;
  transform: translateY(-50%);
  color: var(--color-text-light);
}

.input-with-icon input {
  width: 100%;
  padding: 0.75rem 1rem 0.75rem 2.8rem;
  font-size: 1rem;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background-color: var(--color-background);
  transition: border-color 0.3s, box-shadow 0.3s;
}

.input-with-icon input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.15);
}

.form-actions {
  margin-top: 2rem;
}

.btn-submit {
  width: 100%;
  padding: 0.8rem 1rem;
  background-color: var(--color-primary);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  font-weight: 500;
  cursor: pointer;
  transition: background-color 0.3s;
  display: flex;
  justify-content: center;
  align-items: center;
}

.btn-submit:hover {
  background-color: var(--color-primary-dark);
}

.btn-submit:disabled {
  background-color: var(--color-text-light);
  cursor: not-allowed;
}

.message {
  margin-top: 1rem;
  padding: 1rem;
  border-radius: 8px;
  font-size: 0.95rem;
  display: flex;
  align-items: center;
}

.message.success {
  background-color: rgba(46, 204, 113, 0.15);
  color: #27ae60;
}

.message.error {
  background-color: rgba(231, 76, 60, 0.15);
  color: #e74c3c;
}

.message-icon {
  margin-right: 0.5rem;
  flex-shrink: 0;
}

.spin-icon {
  animation: spin 1s linear infinite;
  margin-right: 0.5rem;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.auth-footer {
  margin-top: 2rem;
  text-align: center;
  font-size: 0.9rem;
  color: var(--color-text-light);
}

.auth-footer a {
  color: var(--color-primary);
  text-decoration: none;
  font-weight: 500;
}

.auth-footer a:hover {
  text-decoration: underline;
}

@media (max-width: 576px) {
  .form-row {
    flex-direction: column;
    gap: 0;
  }
}
</style>
