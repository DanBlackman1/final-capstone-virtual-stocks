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
          {{Number(accountList[index].userBalance).toLocaleString()}}
        </td>
       <td class="hover">
          {{game.endDate}}
        </td>
      </tr>
    </tbody>
  </table>
  <table>
    <thead>
      <tr id="textForCursor">
        <th>Game Name</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='invite in myInvites' v-bind:key="invite.gameId">
        <td>{{ invite.gameName }}</td>
        <td>{{ invite.startDate }}</td>
        <td>{{ invite.endDate }}</td>
        <td>
            <button v-on:click.prevent="acceptInvite(invite.gameId)">Accept</button>
        </td>
         <td>
            <button v-on:click.prevent="declineInvite(invite.gameId)">Decline</button>
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
      myInvites: []
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
    },
    getInvitesList() {
      GameService.seeMyInvites(this.$store.state.user.id).then((response) => {
        this.myInvites = response.data;
      })
    },
    declineInvite(gameId) {
      let inviteGameId = gameId;
      let inviteUserId = this.$store.state.user.id;
      console.log("whether tis nobler in the mind to delete such invites...")
      GameService.declineInvite(inviteUserId, inviteGameId).then((response) => {
        if (response.status === 204 || response.status === 202 || response.status === 200) {
          this.$router.go();
        }
      });
    },
    acceptInvite(gameId) {
      let invite = {
        gameId: gameId,
        userId: this.$store.state.user.id,
      }
      GameService.confirmInvite(invite);
      this.$router.go();
    }
    },
    beforeMount(){
      this.getGameList(this.$store.state.user.id);
      this.getInvitesList();
    },

}
</script>

<style scoped>
#textForCursor{
  cursor: default;
}
.hover:hover{
  cursor: pointer;
}
#gameName{
  color: darkblue;
  text-decoration: underline;
  font: bold;
}
main{
  font-family: 'Times New Roman', Times, serif;
}

</style>