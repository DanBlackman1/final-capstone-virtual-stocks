<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }"> <img id="homeImage" src="../images/homeImage.jpg" alt="Home" style="width:40px;height:40px;"></router-link>&nbsp;&nbsp;
     
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
div#nav{
display: flex;
justify-content: space-between;
}

html{
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}
</style>