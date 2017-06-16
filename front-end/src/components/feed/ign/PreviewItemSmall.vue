<template>
    <span
        :id="previewsmall.id"
        class="scrollsub badge badge-pill badge-default"
        >{{ previewsmall.name }}</span>
</template>

<script>
export default {
    props: ['previewsmall']
}
</script>

<style>
</style>
