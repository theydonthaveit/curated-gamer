<template>
    <div class="card text-center">
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
    props: ['article']
}
</script>

<style></style>
