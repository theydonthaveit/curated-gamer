<template>
    <!-- Modal -->
    <div class="modal fade" :id="'modal' + articleContent.id" tabindex="-1" role="dialog" :aria-labelledby="'modal' + articleContent.id" aria-hidden="false">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" :id="'modal' + articleContent.id">{{articleContent.title}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <iframe width="100%" height="315" src="https://www.youtube.com/embed/5WNsmCpdhhY" frameborder="0" allowfullscreen></iframe>
                <p v-for="n in articleContent.content.text">
                    {{ n }}
                </p>
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
    props: ['articleContent']
    // computed: {
    //     removeCrap: function() {
    //         var articleMade = []
    //         var text
    //         for ( text in this.articleContent.content.text )
    //         {
    //             if ( text == 'Continue reading…')
    //             {
    //                 articleMade.push(text)
    //             }
    //         }
    //         return articleMade
    //     }
    // }
}
</script>

<style>
</style>
