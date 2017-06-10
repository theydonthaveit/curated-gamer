<template>
    <div class="col-md-12">
        <app-preview></app-preview>
        <div class="col-md-1">
            <app-site></app-site>
        </div>
        <div class="col-md-10">
            <app-feed></app-feed>
        </div>
        <div class="col-md-1">
            <app-review></app-review>
        </div>
    </div>
    
    <!-- HIDDEN CONTENT -->
        <app-hidden-site></app-hidden-site>
        <app-hidden-review></app-hidden-review>
        <app-hidden-preview></app-hidden-preview>
    <!-- END -->
</template>

<script>
import Site from '@/components/nav/Site'
import Review from '@/components/nav/Review'
import HiddenSite from '@/components/nav/hidden/Site'

import Preview from '@/components/feed/Preview'
import Feed from '@/components/feed/Feed'

import HiddenReview from '@/components/nav/feed/hidden/Review'
import HiddenPreview from '@/components/nav/feed/hidden/Preview'

export default {
    components: {
        appSite: Site,
        appHiddenSite: HiddenSite,
        appPreview: Preview,
        appHiddenPreview: HiddenPreview,
        appFeed: Feed,
        appReview: Review,
        appHiddenReview: HiddenReview
    }
}
</script>

<style>
</style>
