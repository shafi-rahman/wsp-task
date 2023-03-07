<template>
    <header id="header" class="header d-flex align-items-center mt-2 mb-2 p-3">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
                <h1 class="fs-3 text-white">WSP - Client Search</h1>
            <nav id="navbar" class="navbar">
                <ul>
                    <li><router-link to="/" class="btn btn-primary">Search Client</router-link></li>
                    <li><router-link to="/dashboard" class="btn btn-primary">Add Cliend</router-link></li>
                </ul>
            </nav>        
        </div>
    </header>
    <router-view></router-view>
</template>
<style>
.navbar ul li {
    float: left;
    margin-right: 10px;
    list-style: none;
}
.navbar ul li a {
    display: block;
}
.navbar ul li a.router-link-exact-active {
    display: none;
}
</style>
