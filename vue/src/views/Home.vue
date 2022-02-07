<template>
  <div class="home">
    <div class="splitTables">
      <div>
        <h1>Create New Game</h1>
        <div>
          <createGame />
        </div>
      </div>
    <div class="addingInfo">
      <h1>View Existing Games</h1>
      <div class="box">
      <userGames/>
      </div>
    </div>
    </div>
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

<style scoped>
.splitTables{
  display: flex;
  justify-content: space-around;
}
.box{
  border: black solid;
}

</style>