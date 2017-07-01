<template>
    <div class="card card-hover">
        <img class="card-img-top img-fluid" src="https://media.playstation.com/is/image/SCEA/prey-listing-thumb-01-ps4-us-14jun16?$Icon$">
        <div class="card-block">
            <h4 class="card-title">Card title that wraps to a new line</h4>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        </div>
        <div class="footer">
        </div>
    </div>
</template>

<script>
export default {
}
</script>
<style>
.card-hover {
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}
.card-hover:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}
.card {
    border: none;
    background-color: #EEEEEE;
}
.card:hover {
    color: white;
    background-color: #FF5722;
} 
.card:hover > img {
    -webkit-filter: invert(100%) !important;
}
</style>
