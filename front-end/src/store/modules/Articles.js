import Articles from '../../api/articles'

const state = {
    articles: []
}

const mutations = {
    'SET_ARTICLES' (state, articles) {
        state.articles = Articles
    }
}

const actions = {
    initArticles: ({ commit }) => {
        commit( 'SET_ARTICLES', articles )
    }
}

const getters = {
    article: state => {
        return state.Articles
    }
}

export default {
    state,
    mutations,
    actions,
    getters
}
