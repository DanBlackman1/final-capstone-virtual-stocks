<template>
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
</template>

<script>
import GameService from "../services/GameService.js"
export default {
  
    data(){
        return{
        myInvites: [],
        }
    },
    methods:{
        getInvitesList() {
            GameService.seeMyInvites(this.$store.state.user.id).then((response) => {
                this.myInvites = response.data;
      })
    },
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
    },
    beforeMount(){
            this.getInvitesList();
    }
}
</script>

<style scoped>
#textForCursor{
  cursor: default;
  text-align: center;
}
.hover:hover{
  cursor: pointer;
}
</style>