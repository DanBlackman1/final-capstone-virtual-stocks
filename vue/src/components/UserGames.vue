<template>
  <div id="main">
    <ul>
      <li v-for='game in gameList' v-bind:key="game.gameId">
        gameName: {{game.gameName}}
        <!-- {{game.indexOf()}}  -->
        <!-- {{accountList[game.indexOf()].userBalance}} -->
        end Date: {{game.endDate}}
      </li>
    </ul>
    <!-- <div v-for="account in AccountList" v-bind:key="account.accountId"></div> -->
    
    
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
    getGameList(id){
           GameService.viewGamesByUserId(id).then((response) =>{
             this.accountList = response.data.accountsList;
             this.gameList = response.data.gamesList;
            })
         }
      },
    beforeMount(){
      this.getGameList(this.$store.state.user.id);
    }
}
</script>

<style>

</style>