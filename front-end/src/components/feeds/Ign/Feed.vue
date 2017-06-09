<template>
    <div>
        <div class="card-columns">
            <div class="card">
                <img class="card-img-top img-fluid" src="" alt="Card image cap">
                <div class="card-block">
                    <h4 class="card-title" data-toggle="modal" data-target=".bd-example-modal-lg">Teken 7 Review</h4>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
                <div class="card-footer">
                    <div class="discuss float-left">
                        Click to talk
                    </div>
                    <div class="likes float-right">
                        72 Likes
                    </div>
                    <div class="shares float-right">
                        52 Shares
                    </div>
                </div>
            </div>
            <div class="card p-3">
                <blockquote class="card-block card-blockquote">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                    <footer>
                        <small class="text-muted">
                            Someone famous in <cite title="Source Title">Source Title</cite>
                        </small>
                    </footer>
                </blockquote>
            </div>
            <div class="card">
            <img class="card-img-top img-fluid" src="" alt="Card image cap">
            <div class="card-block">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
            </div>
            <div class="card card-inverse card-primary p-3 text-center">
            <blockquote class="card-blockquote">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
            <footer>
            <small>
            Someone famous in <cite title="Source Title">Source Title</cite>
            </small>
            </footer>
            </blockquote>
            </div>
            <div class="card text-center">
            <div class="card-block">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
            </div>
            <div class="card">
            <img class="card-img img-fluid" src="" alt="Card image">
            </div>
            <div class="card p-3 text-right">
            <blockquote class="card-blockquote">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer>
            <small class="text-muted">
            Someone famous in <cite title="Source Title">Source Title</cite>
            </small>
            </footer>
            </blockquote>
            </div>
            <div class="card">
            <div class="card-block">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
            </div>
        </div>
        <!-- HIDDEN NAVBAR -->
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
        <!-- END -->
        <!-- MODAL -->
        <!-- Large modal -->
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
        <!-- END -->

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


// General Variables
$bg-color: #D8DBE2;
$accent-color: #58A4B0;
$primary-color: #373F51;
$secondary-color: #FFF;
$easing: cubic-bezier(0.680, -0.550, 0.265, 1.550) 1s 0s;

// Card Variables
$c-width: 30em;
$c-height: $c-width - 10;
$c-shadow: 10px 10px 20px darken($bg-color, 9%);

* {
  box-sizing: border-box;
  margin: 0; padding :0;
  font-family: 'Mallanna', sans-serif;
}

html {
  overflow: hidden;
}

body {
  background: $bg-color;
  transform:translate3d(0,0,0);
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 2.5em;
  margin-left: 5em;
  height: 100vh;
}
.card {
  background: $secondary-color;
  width: $c-width;
  height: $c-height;
  position: relative;
  box-shadow: $c-shadow;
  &_controls {
    position: absolute;
    right: 0;
    i {
      background: $primary-color;
      color: #FFF;
      font-size: 2.4em;
      width: 2.09em;
      height: 2.05em;
      line-height: 2em;
      text-align: center;
      display: block;
      cursor: pointer;
      font-style: normal;
    }
    .rating {
      background: $accent-color;
      color: #FFF;
      font-size: 2.4em;
      width: 2.09em;
      height: 2.05em;
      line-height: 2em;
      overflow: hidden;
      position: absolute;
      text-align: center;
      cursor: pointer;
      font-style: normal;
      cursor: default;
      p {
        font-size: 0.7em;
      }
    }
  }
  &_sub_information {
    position: absolute;
    bottom: 0;
    height: 26.4%;
    width: 100%;
    padding: 1em;
    h1 {
      color: $primary-color;
      font-size: 1.2em;
    }
    p {
      margin: -0.8em 0;
      color: lighten($primary-color, 12%);
    }
    button {
      background: $accent-color;
      color: #FFF;
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.6em;
      border: none;
      padding: 1em 1.5em;
      cursor: pointer;
      position: absolute;
      right: 0;
      top: 0;
      margin: 2.5em 1.7em;
      outline: none;
    }
  }
  &_overlay {
    background-size: cover;
    position: absolute;
    width: $c-width;
    height: $c-height;
    transform: translateX($c-width / -6) translateY($c-height / -3.8);
    .img-container {
      display: inline-block;
      overflow: hidden;
      position: absolute;
      z-index: -1;
      height: $c-height;
    }
    img {
      display: block;
      width: 100%;;
      height: 100%;
      object-fit: cover;
      animation: zoom ease-in 20s forwards;
    }
    &__information {
      background: rgba(0, 0, 0, 0.5);
      height: 100%;
      padding: 1em;
      z-index: 1;
      h1, p, i, span {
        color: rgba(255, 255, 255, 1);
      }
      i {
        margin: 0.9em 0;
        border-radius: 100%;
        cursor: default;
        font-size: 1.4em;
        vertical-align: middle;
      }
      span {
        font-size: 0.9em;
      }
    }
  }
}

// Animations
@keyframes rock {
  0% {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(15deg);
  }
  100% {
    transform: rotate(0deg);
  }
}

@keyframes zoom {
  from {
    transform: scale(1);
  }
  to {
    transform: scale(1.5);
  }
}

// Fade In
.fade-in.ng-enter, .fade-in.ng-leave {
  transition: opacity $easing;
}

.fade-in.ng-enter,
.fade-in.ng-leave.ng-leave-active {
  opacity: 0;
}

.fade-in.ng-leave,
.fade-in.ng-enter.ng-enter-active {
  opacity: 1;
}

// Top To Bottom
.top-to-bottom.ng-enter, .top-to-bottom.ng-leave {
  transition: all $easing;
}

.top-to-bottom.ng-enter,
.top-to-bottom.ng-leave.ng-leave-active {
  opacity: 0;
  transform: translateY(1em);
}

.top-to-bottom.ng-leave,
.top-to-bottom.ng-enter.ng-enter-active {
  opacity: 1;
  transform: translateY(0);
}
</style>
