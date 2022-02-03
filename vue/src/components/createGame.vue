<template>
  <div id="main">
      <form v-on:submit='addGame()'>
        Name: <input type="text" v-model='game.gameName'/>
        End date: <input type="date" v-model='game.endDate'>
        Start date: <input type="date" v-model='game.startDate'>
        <button type="submit" value="save">Create Game</button>
      </form>
   </div>
</template>

<script>
import GameService from "../services/GameService.js";
export default {
    data(){
        return{
            
            game:{
                gameName: '',
                endDate: '',
                startDate: '',
                organizerId: this.$store.state.user.id
            }
        }
    },
    methods:{
        addGame(){
            GameService.createGame(this.game, this.$store.state.user.id).then(() =>{
                this.game.endDate="";
                this.game.startDate="";
                this.game.gameName="";
                this.$router.push({name:'home'});
            })
        }
    }
}
</script>

<style>

</style>