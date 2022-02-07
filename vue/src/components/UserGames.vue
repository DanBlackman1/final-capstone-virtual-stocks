<template>
  <div id="main">
   <div class="table">
    <table>
    <thead>
      <tr>
        <th>Game Name</th>
        <th>Portfolio Value</th>
        <th>Game End Date</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='(game, index) in gameList' v-bind:key="game.gameId" v-on:click="goToGameDetails(game, accountList[index])">
        <td>
          {{game.gameName}}
          </td>
        <td>
          {{accountList[index].userBalance}}
        </td>
       <td>
          {{game.endDate}}
        </td>
      </tr>
    </tbody>
  </table>
   </div>
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
         },
    goToGameDetails(game, account) {
      this.$store.commit('SET_GAME', game);
      this.$store.commit('SET_ACCOUNT', account)
      this.$router.push('/gameDetails');
    } 
      },
    beforeMount(){
      this.getGameList(this.$store.state.user.id);
    },

}
</script>

<style scoped>

tr:hover{
  background: gray;
}

</style>