<template>
    <div>
        <h5 class="text-center">Some Previews ...</h5>
        <div id="scrollmenu">
            <app-preview-item-small></app-preview-item-small>
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
import PreviewItemSmall from '@/components/feed/ign/PreviewItemSmall'
import HiddenPreview from '@/components/feed/hidden/Preview'

export default {
    components: {
        appPreviewItemSmall: PreviewItemSmall,
        appHiddenPreview: HiddenPreview
    }
}
</script>

<style>
</style>
