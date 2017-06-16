<template>
    <div>
        <div class="col-md-12">
            <div class="card-columns">
                <div class="card">
                    <img class="card-img-top img-fluid" src="" alt="">
                    <div class="card-block">
                        <h4 class="card-title">Review Title</h4>
                        <p class="card-text">Review Description</p>
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
    components: {
        appReviewArticle: ReviewArticle
    }
}
</script>

<style>
</style>
