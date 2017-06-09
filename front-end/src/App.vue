<template>
    <div class="container-fluid">
        <app-header></app-header>
        <app-preview></app-preview>
        <div class="row">
            <!-- SITE NAV -->
            <div class="col-md-1">
                <p class="text-center">
                S
                </p>
                <p class="text-center">
                I
                </p>
                <p class="text-center">
                T
                </p>
                <p class="text-center">
                E
                </p>
                <p class="text-center">
                S
                </p>
            </div>
            <!-- SITE NAV END -->
            <div class="col-md-10">
                <router-view></router-view>
            </div>
            <!-- REVIEW NAV -->
            <div class="col-md-1">
                <span onclick="openNav()">
                    <p class="text-center">
                    R
                    </p>
                    <p class="text-center">
                    E
                    </p>
                    <p class="text-center">
                    V
                    </p>
                    <p class="text-center">
                    I
                    </p>
                    <p class="text-center">
                    E
                    </p>
                    <p class="text-center">
                    W
                    </p>
                    <p class="text-center">
                    S
                    </p>
                </span>
            </div>
            <!-- REVIEW NAV END -->
        </div>
    </div>
</template>

<script>
    import Header from '@/components/navs/Header'
    import Preview from '@/components/navs/Preview'

    export default {
        components: {
            appHeader: Header,
            appPreview: Preview,
        }
    }
</script>

<style>
</style>
