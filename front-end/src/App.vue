<template>
    <div class="container-fluid">
        <app-header></app-header>
        <!-- <div class="row"> -->
            <router-view></router-view>
        <!-- </div> -->
    </div>
</template>

<script>
    import Header from '@/components/nav/Header'

    export default {
        components: {
            appHeader: Header
        }
    }
</script>

<style>
body {
    background-color: #EEEEEE;
}
</style>
