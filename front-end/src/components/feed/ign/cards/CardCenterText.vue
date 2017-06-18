<template>
    <div
        :id="article.id"
        class="card text-center"
        v-on:click="retrieveArticle"
        ref="articleDiv"
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
</template>

<script>
export default {
    data() {
        return {
            content: ''
        }
    },
    methods: {
        retrieveArticle: function(event) {
            var articleId = this.$refs.articleDiv.id
            this.$http.get('http://127.0.0.1:3000/api/V1/sites/ign/article/' + articleId)
                .then(response => {
                    this.content = response.data.cotent })
        }
    },
    props: ['article']
}
</script>

<style></style>
