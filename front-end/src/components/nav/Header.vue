<template>
    <nav id="spock_navbar" class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
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

        <router-link id="spock_brand" to="/" class="navbar-brand">
            <span id="s">S</span>
            <span id="p">p</span>
            <span id="o">O</span>
            <span id="c">c</span>
            <span id="k">k</span>
        </router-link>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul id="spock_ul" class="navbar-nav mr-auto">
                <router-link to="/review" activeClass="active" tag="li">
                    <a>Beam Me Up</a>
                </router-link>
                <router-link to="/youtube" activeClass="active" tag="li">
                    <a>Streams</a>
                </router-link>
                <router-link to="/amazon" activeClass="active" tag="li">
                    <a>Products</a>
                </router-link>
            </ul>
        </div>
    </nav>
</template>

<script>
export default {
}
</script>

<style>
#spock_navbar {
    background-color: transparent!important;
    padding: 20px 50px;
    margin-bottom: 25px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}

#spock_brand > span#s {
    color: #FF5722;
}
#spock_brand > span#p {
    color: #00ADB5;
}
#spock_brand > span#o {
    color: #303841;
}
#spock_brand > span#c {
    color: #00ADB5;
}
#spock_brand > span#k {
    color: #FF5722;
}

#spock_ul a {
    color: #303841;
    padding: 0 10px;
}

#spock_ul a:link {
    text-decoration: none;
}

#spock_ul a:hover {
    text-decoration: none;
    background-color: #00ADB5;
    color: #EEEEEE;
    padding: 18px 10px;
}

#spock_ul a:active {
    text-decoration: none;
    background-color: #FF5722;
    color: #EEEEEE;
    padding: 10px;
}
</style>
