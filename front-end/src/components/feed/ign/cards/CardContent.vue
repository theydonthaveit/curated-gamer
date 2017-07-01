<template>
    <!-- Modal -->
    <div class="modal fade" :id="'modal' + articleContent.id" tabindex="-1" role="dialog" :aria-labelledby="'modal' + articleContent.id" aria-hidden="false">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" :id="'modal' + articleContent.id">{{articleContent.title}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" v-on:click="closeModal">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                <p>
                    {{ articleContent.youtube.comment }}
                </p>
                <!--<div >-->
                    <iframe  class="iframeParent" width="100%" height="500px" :src="articleContent.youtube.url" frameborder="0" allowfullscreen></iframe>
                <!--</div>-->
                <div class="paragraphParent">
                    <p v-for="n in articleContent.content.text">
                        {{ n }}
                    </p>
                </div>
                <a :href="articleContent.link">
                <small class="text-muted">
                    {{ articleContent.title }}
                </small>
                </a>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
export default {
    props: ['articleContent'],
    methods: {
        closeModal: function()
        {
            var iframe = this.$el.querySelector('iframe');
            var iframeSrc = iframe.src;

            return iframe.src = iframeSrc;
        },
    }
}
</script>

<style>
.iframeParent {
    -webkit-box-shadow: 0px 0px 15px 8px rgba(43,42,43,0.29);
    -moz-box-shadow: 0px 0px 15px 8px rgba(43,42,43,0.29);
    box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    display: block;
}
.paragraphParent {
    margin-top: 2.5em;
}
.modal-dialog {
    max-width: 85%;
    margin: 55px auto;
}
.modal-content {
    padding: 0 64px;
}
.card {
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}
.card:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}
.card {
    border: none;
    background-color: #EEEEEE;
}
</style>
