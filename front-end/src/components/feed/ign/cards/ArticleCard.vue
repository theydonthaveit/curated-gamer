<template>
    <div class="card-columns">
        <app-card-image v-on:load="loadImageData"></app-card-image>
        <app-card-text v-on:load="loadTextData"></app-card-text>
    </div>
</template>

<script>
import CardImage from '@/components/feed/ign/cards/CardImage'
import CardText from '@/components/feed/ign/cards/CardCenterText'

export default {
    components: {
        appCardImage: CardImage,
        appCardText: CardText
    }
}
</script>
<style></style>
