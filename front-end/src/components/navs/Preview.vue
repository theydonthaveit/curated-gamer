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
            <div class="container">
                <div class="row pre-cards">
                    <div class="col-md-4">
                        <div class="card text-center">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Active</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Link</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link disabled" href="#">Disabled</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-block">
                                <h4 class="card-title">Special title treatment</h4>
                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                    <div class="card text-center">
                    <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                    <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                    </ul>
                    </div>
                    <div class="card-block">
                    <h4 class="card-title">Special title treatment</h4>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                    <div class="card text-center">
                    <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                    <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                    </ul>
                    </div>
                    <div class="card-block">
                    <h4 class="card-title">Special title treatment</h4>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                    </div>
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
