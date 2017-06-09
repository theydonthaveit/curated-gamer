import Vue from 'vue'
import Router from 'vue-router'

import Spock from '@/components/Spock'
import Feed from '@/components/feeds/Ign/Feed'
import Stream from '@/components/streams/Home'
import Product from '@/components/products/Home'

Vue.use(Router)

export default new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'Spock',
            component: Spock
        },
        {
            path: '/review',
            name: 'Review',
            component: Feed
        },
        {
            path: '/youtube',
            name: 'Youtube',
            component: Stream
        },
        {
            path: '/amazon',
            name: 'Amazon',
            component: Product
        }
    ]
})
