<template>
  <div id="main">
   <div class="table">
    <table>
    <thead>
      <tr id="textForCursor">
        <th>Game Name</th>
        <th>Portfolio Value</th>
        <th>Game End Date</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='(game, index) in gameList' v-bind:key="game.gameId" v-on:click="goToGameDetails(game, accountList[index])">
        <td  class="hover" id="gameName">
          {{game.gameName}}
          </td>
        <td class="hover">
          ${{Number(accountList[index].userBalance).toLocaleString()}}
        </td>
       <td class="hover">
          {{game.endDate}}
        </td>
      </tr>
    </tbody>
  </table>
   </div>
  </div>
</template>

<script>
import GameService from "../services/GameService.js";
export default {
  data() {
    return {
      accountList: [],
      gameList: [],
    };
  },
  methods: {
    getGameList(id) {
      GameService.viewGamesByUserId(id).then((response) => {
        this.accountList = response.data.accountsList;
        this.gameList = response.data.gamesList;
      });
    },
    goToGameDetails(game, account) {
      this.$store.commit("SET_GAME", game);
      this.$store.commit("SET_ACCOUNT", account);
      this.$router.push("/gameDetails");
    },
  },
  beforeMount() {
    this.getGameList(this.$store.state.user.id);
  },
};
</script>

<style scoped>
#textForCursor {
  cursor: default;
  justify-content: center;
}

.hover:hover {
  cursor: pointer;
}
#gameName {
  color: darkblue;
  text-decoration: underline;
  font: bold;
}
.table {
  border: black solid;
  width: 500px;
  text-align: center;
  padding: 5px;
} 
</style>