<template>
  <div id="main">
    <!-- <ul>
      <li v-for='(game, index) in gameList' v-bind:key="game.gameId" >
        {{game.gameName}}
        {{accountList[index].userBalance}}
        {{game.endDate}}
      </li>
    </ul> -->
    <table>
    <thead>
      <tr>
        <th>Game Name</th>
        <th>Portfolio Value</th>
        <th>Game End Date</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='(game, index) in gameList' v-bind:key="game.gameId">
        <td> <router-link
            v-bind:to="{ name: 'gameDetails', params: { userId: this.$store.state.user.id, gameId: game.id }}"
          >{{game.gameName}}</router-link></td>
        <td>
          <router-link
            v-bind:to="{ name: 'gameDetails', params: { userId: this.$store.state.user.id, gameId: game.id }}"
          >{{accountList[index].userBalance}}</router-link>
        </td>
        <td>
          <router-link
            v-bind:to="{ name: 'gameDetails', params: { userId: this.$store.state.user.id, gameId: game.id }}"
          >{{game.endDate}}</router-link>
        </td>
      </tr>
    </tbody>
  </table>
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
    },
  // mutations:{
  //   SET_GAME(state, game)

  // }

}
</script>

<style>

</style>