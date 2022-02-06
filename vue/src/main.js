import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import Vue2Filters from 'vue2-filters' /* npm install vue2-filters lisa*/ 
Vue.use(Vue2Filters) /* npm install vue2-filters lisa*/

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')


