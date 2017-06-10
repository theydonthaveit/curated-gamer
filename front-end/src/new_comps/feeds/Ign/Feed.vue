<template>
    <div>
        <!-- CARD FEED -->
        <app-card></app-card>
        <!-- END -->
        <!-- HIDDEN NAVBAR -->
        <app-site></app-site>
        <!-- END -->
        <!-- HIDDEN NAVBAR -->
        <app-review></app-review>
        <!-- END -->
        <!-- MODAL -->
        <app-modal></app-modal>
        <!-- END -->
    </div>
</template>

<script>
import Review from '@/components/navs/Review'
import Site from '@/components/navs/Sites'
import Card from '@/components/feeds/Ign/Card'
import Modal from '@/components/feeds/Ign/Modal'
import Preview from '@/components/navs/Preview'

export default {
    components: {
        appReview: Review,
        appPreview: Preview,
        appSite: Site,
        appCard: Card,
        appModal: Modal
    }
}
</script>

<style>
</style>
