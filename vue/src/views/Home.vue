<template>
  <div class="home">
    <div class="splitTables">
      <div class="createGame">
        <div>
          <h1>Create New Game</h1>
          <createGame />
        </div>
      </div>
    <div class="addingInfo">
      
      <div class="box">
        <h1>View Existing Games</h1>
        <userGames/>
      </div>
    </div>
    
    <div class="invites">
      <h1>Invited Users</h1>
      <invite-users />
    </div>
    </div>
  </div>
</template>

<script>
import createGame from "@/components/createGame.vue"
import userGames from "@/components/UserGames.vue"
import InviteUsers from '../components/InviteUsers.vue';

export default {
  name: "home",
  components:{
    createGame,
    userGames,
    InviteUsers
  }
};
</script>

<style scoped>
h1{
  cursor: default;
}
.splitTables{
  display: flex;
  justify-content: space-around;
  grid-area: createGame;
  display: grid;
  grid-template-areas: 
  "splitTables addingInfo"
  "invites invites";
}
.addingInfo{
  display: grid;
  grid-area: addingInfo;
}
.invites{
  grid-area: invites;
  justify-self: left;
  margin-top: 20px;
}




@media only screen and (max-width: 790px) {
  .splitTables{
    display: grid; 
    grid-template: 
    "splitTables ."
    "invites invites"
    "addingInfo addingInfo";   
  }


}
</style>