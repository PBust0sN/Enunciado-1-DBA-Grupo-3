import api from './http-common'

function login(payload) {
  return api.post('/api/v1/auth/login', payload)
}

function register(payload) {
  return api.post('/api/v1/auth/register', payload)
}

export default { login, register }
