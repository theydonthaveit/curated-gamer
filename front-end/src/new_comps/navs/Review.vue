<template>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class='container'>
        <div class='card'>
        <div class='card_controls'>
        <i class='material-icons'>keyboard_arrow_right</i>
        <i class='material-icons'>keyboard_arrow_left</i>
        <div class='rating fade-in'>
        <p>FILM</p>
        </div>
        </div>
        <div class='card_sub_information top-to-bottom'>
        <h1>TITLE</h1>
        <p>GENRE</p>
        <button>Book</button>
        <button>Buy</button>
        </div>
        <div class='card_overlay fade-in'>
        <div class="img-container">
        <img src="" />
        </div>
        <div class='card_overlay__information fade-in'>
        <h1>Title</h1>
        <p>Information</p>
        <i class='material-icons'>query_builder</i>
        <span>Lenght</span>
        </div>
        </div>
        </div>
        </div>
    </div>
</template>

<script>
export default {
}
</script>

<style>
/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    top: 0;
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}
</style>
