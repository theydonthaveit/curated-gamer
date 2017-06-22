<template>
    <div id="wrapper">
        <app-review-card></app-review-card>
        <!-- HIDDEN -->
        <app-review-article></app-review-article>
        <!-- END -->
    </div>
</template>

<script>
import ReviewCard from '@/components/feed/ign/reviews/ReviewCard'
import ReviewArticle from '@/components/feed/ign/reviews/ReviewArticle'

export default {
    components: {
        appReviewCard: ReviewCard,
        appReviewArticle: ReviewArticle
    }
}
</script>

<style>
#reviewArticle {
    display: none;
}
</style>
