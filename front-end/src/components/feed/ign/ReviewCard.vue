<template>
    <div>
        <div class="col-md-12">
            <div class="card-columns">
                <div class="card">
                    <img class="card-img-top img-fluid" src="" alt="Card image cap">
                    <div class="card-block">
                        <h4 class="card-title">{{ reviewcard.title }}</h4>
                        <p class="card-text">{{ reviewcard.description }}</p>
                    </div>
                </div>
            </div>
        </div>
    <!-- HIDDEN -->
    <app-review-article></app-review-article>
    <!-- END -->
    </div>
</template>

<script>
import ReviewArticle from '@/components/feed/ign/ReviewArticle'

export default {
    props: ['reviewcard'],
    components: {
        appReviewArticle: ReviewArticle
    }
}
</script>

<style>
</style>
