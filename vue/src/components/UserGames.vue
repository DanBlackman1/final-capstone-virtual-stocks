<template>
  <div id="main">
    <div class="userGames">
      <div class="games" v-for="game in games" :key="game.id">
        game Name: {{ game. }}
        <br />
        Puppy Weight: {{ dog.weight }}
        <br />
        Paper Trained? {{ dog.paperTrained }}
        <br />
        <!--Remember that dynamic route we defined? It's being called here: -->
        <router-link :to="{ name: 'display-detail', params: { id: dog.id } }"
          >Change Puppy's Data!</router-link
        >
        <br />
        <br />
        <img v-bind:src=dog.image alt="random doggo" width="200" />
      </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>