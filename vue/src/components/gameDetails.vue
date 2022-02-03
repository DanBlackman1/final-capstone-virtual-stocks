<template>
  
</template>

<script>

import GameService from "../services/GameService.js";
export default {
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
    }
}
</script>

<style>

</style>