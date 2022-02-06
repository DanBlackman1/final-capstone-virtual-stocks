<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <createGame />
    <userGames/>
  </div>
</template>

<script>
import createGame from "@/components/createGame.vue"
import userGames from "@/components/UserGames.vue"

export default {
  name: "home",
  components:{
    createGame,
    userGames
    
  }
};
</script>
