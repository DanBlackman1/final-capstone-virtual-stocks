<template>
  <div id="main">
    <ul>
      <li v-for='(game, index) in gameList' v-bind:key="game.gameId">
        {{game.gameName}}
        {{accountList[index].userBalance}}
        {{game.endDate}}
      </li>
    </ul>
  </div>
</template>

<script>
import GameService from "../services/GameService.js"
export default {
  data() {
    return { 
      accountList: [],
      gameList: [],
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