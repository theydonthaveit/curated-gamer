<template>
    <div id="wrapper">
        <div
            :id="article.id"
            class="card text-center"
            v-on:click="retrieveArticle"
            ref="articleDiv"
            data-toggle="modal"
            :data-target="'#modal' + article.id"
            >
            <div class="card-block">
                <h4 class="card-title">
                    {{ article.title }}
                </h4>
                <p class="card-text">{{ article.description }}</p>
                <p class="card-text">
                    <a :href="article.link">
                        <small class="text-muted">
                            {{ article.title }}
                        </small>
                    </a>
                </p>
            </div>
        </div>

        <app-card-content
            v-for="articleContent in articleContents"
            v-bind:key="articleContent"
            :articleContent="articleContent"
            ></app-card-content>
    </div>
</template>

<script>
import CardContent from '@/components/feed/ign/cards/CardContent'

export default {
    props: ['article'],
    data() {
        return {
            articleContents: ''
        }
    },
    methods: {
        retrieveArticle: function(event) {
            var articleId = this.$refs.articleDiv.id
            this.$http.get('http://127.0.0.1:3000/api/V1/sites/ign/article/' + articleId)
                .then(response => {
                    this.articleContents = response.data.articles })
        }
    },
    components: {
        appCardContent: CardContent
    }
}
</script>

<style>
</style>
