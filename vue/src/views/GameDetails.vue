<template>
  <div class="main">
      
  </div>
</template>

<script>

import GameService from "../services/GameService.js";
export default {
    name: 'gameDetails',
    data(){
        return{
            
            game:{
                gameName: this.$store.state.game.gameName,
                endDate: this.$store.state.game.endDate,
                startDate: this.$store.state.game.startDate,
                organizerId: this.$store.state.game.organizerId
            }
        }
    },
    methods:{
        viewDetails(){
            GameService.viewDetailsByGameId(this.user.id, this.game.id).then((response) =>{
                this.game.endDate= response.data.endDate;
                this.game.startDate= response.data.startDate;
                this.game.gameName= this.$store.state.game.gameName;
            })
        }
    },
    beforeCreate(userId, gameId) {
        this.viewDetailsByGameId(userId, gameId);
    }
}
</script>

<style>

</style>