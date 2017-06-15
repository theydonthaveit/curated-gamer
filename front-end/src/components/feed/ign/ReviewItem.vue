<template>
    <app-review-card
        v-for="reviewcard in reviewcards"
        v-bind:key="reviewcard"
        :reviewcard="reviewcard"
        >
    </app-review-card>
</template>

<script>
import ReviewCard from '@/components/feed/ign/ReviewCard'

export default {
    data() {
        return {
            reviewcards: [
                { id: 1, title: 'Tekken 7', description: 'This is a cool Game' },
                { id: 2, title: 'Dirt 4', description: 'This is a cool Game' },
                { id: 3, title: 'Prey', description: 'This is a cool Game' },
                { id: 4, title: 'Doom', description: 'This is a cool Game' }
            ]
        }
    },
    components: {
        appReviewCard: ReviewCard
    }
}
</script>

<style>
</style>
