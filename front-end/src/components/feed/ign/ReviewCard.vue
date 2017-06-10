<template>
    <div>
    <div class="col-md-12">
        <div class="card-columns">
            <div class="card">
                <img class="card-img-top img-fluid" src="" alt="Card image cap">
                <div class="card-block">
                    <h4 class="card-title">Card title that wraps to a new line</h4>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
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
