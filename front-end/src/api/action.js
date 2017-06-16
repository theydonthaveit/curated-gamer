import Vue from 'vue'

export const ignApi = ({commit}) => {
    Vue.http.get('http://127.0.0.1:3000/api/V1/sites/ign/articles')
        .then(response => response.json())
        .then(data => {
            if (data) {
                const title = data.title
            }
        })
}
