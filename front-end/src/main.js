// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Resource from 'vue-resource'
import Store from './store/store'

Vue.use(Resource);

window.Vue = Vue
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  Resource,
  template: '<App/>',
  components: { App }
})
