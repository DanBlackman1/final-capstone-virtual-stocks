<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <createGame />
  </div>
</template>

<script>
import createGame from "@/components/createGame.vue"
export default {
  name: "home",
  components:{
    createGame,
  }
};
</script>
