<template>
    <div class="card-columns">
        <app-card-image></app-card-image>
        <app-card-text
            v-for="article in articles"
            v-bind:key="article"
            :article="article"
        ></app-card-text>
    </div>
</template>

<script>
import CardImage from '@/components/feed/ign/cards/CardImage'
import CardText from '@/components/feed/ign/cards/CardCenterText'

export default {
    created() {
        this.$http.get('http://127.0.0.1:3000/api/V1/sites/ign/articles')
            .then(response => {
                this.articles = response.data.articles })
    },
    data() {
        return {
            articles: ''
        }
    },
    components: {
        appCardImage: CardImage,
        appCardText: CardText
    }
}
</script>

<style>
</style>
