<template>
    <div>
        <h6 class="text-center preview-header">previews</h6>
        <div id="scrollmenu">
            <a class="scrollsub" href="#home">Home</a>
        </div>
        <div
            class="text-center preview-dropdown"
            data-toggle="collapse"
            data-target="#collapseOne"
            aria-expanded="false"
            aria-controls="collapseOne"
            style="padding-bottom: 8px;"
            >&#9660
        </div>
        <div
            id="collapseOne"
            class="collapse hide"
            role="tabpanel"
            >
            <app-hidden-preview></app-hidden-preview>
        </div>
    </div>
</template>

<script>
import HiddenPreview from '@/components/feed/hidden/Preview'

export default {
    components: {
        appHiddenPreview: HiddenPreview
    }
}
</script>

<style>
    div#scrollmenu {
        background-color: #FFF;
        overflow: scroll;
        white-space: nowrap;
    }

    div#scrollmenu a {
        color: black;
        display: inline-block;
        text-align: center;
        padding: 14px;
        text-decoration: none;
    }

    div#scrollmenu a:hover {
        background-color: #777;
    }
</style>
