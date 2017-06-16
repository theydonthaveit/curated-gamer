import Vue from 'vue'
import Resource from 'vue-resource'

Vue.use(Resource)

export default new Resource({
    http: {
        root: 'http://127.0.0.1:3000/api/V1/sites/ign/articles'
    }
})
