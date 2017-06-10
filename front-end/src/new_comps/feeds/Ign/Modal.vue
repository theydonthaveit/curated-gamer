<template>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h5>Popover in a modal</h5>
                <p>This
                    <a
                        href="#"
                        role="button"
                        class="btn btn-secondary popover-test"
                        title="Popover title"
                        data-content="Popover body content is set in this attribute."
                        >button
                    </a> triggers a popover on click.
                </p>
                <hr>
                <h5>Tooltips in a modal</h5>
                <p>
                    <a href="#" class="tooltip-test" title="Tooltip"
                    >This link
                    </a>
                     and
                    <a href="#" class="tooltip-test" title="Tooltip"
                    >that link
                    </a> have tooltips on hover.
                </p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
}
</script>

<style>
</style>
