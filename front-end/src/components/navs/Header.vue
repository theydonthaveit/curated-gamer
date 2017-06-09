<template>
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
        <button
            class="navbar-toggler navbar-toggler-right"
            type="button"
            data-toggle="collapse"
            data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>

        <router-link to="/" class="navbar-brand">Spock</router-link>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <router-link to="/review" activeClass="active" tag="li">
                    <a>Beam Me Up</a>
                </router-link>
                <router-link to="/youtube" activeClass="active" tag="li">
                    <a>Streams</a>
                </router-link>
                <router-link to="/amazon" activeClass="active" tag="li">
                    <a>Products</a>
                </router-link>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle"
                        id="dropdown01"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >What is this?
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="#">Who?</a>
                        <a class="dropdown-item" href="#">Why?</a>
                        <a class="dropdown-item" href="#">What?</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</template>

<script>
export default {
}
</script>

<style>
</style>
