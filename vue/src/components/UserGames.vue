<template>
  <div id="main">
    hey
    <div v-for:='game in gameList' :key="game.id">
    gameName: {{game.gameName}} 
    </div>
    <div v-for:="account in AccountList" :key="account.id"></div>
    
    
  </div>
</template>

<script>
import GameService from "../services/GameService.js"
export default {
  data() {
    return { 
      accountList: [],
      gameList: []
    }
  },
  methods: {
    getGameList(){
           GameService.viewGamesByUserId(this.userId).then((response) =>{
             this.accountList = response.data[0];
             this.gameList = response.data[1];
            })
  }
}
}
</script>

<style>

</style>