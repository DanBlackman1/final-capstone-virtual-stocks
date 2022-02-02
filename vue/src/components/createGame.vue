<template>
  <div id="main">
      <form v-on:submit.prevent='addGame'>
        Name: <input type="text" v-model='newGame.name'/>
        End date: <input type="date" v-model='newGame.endDate'>
        <button type="submit" value="save">Create Game</button>
      </form>
   </div>
</template>

<script>
import GameService from "../services/GameService.js";
export default {
    data(){
        return{
            newGame:{}
        }
    },
    methods:{
        addGame(){
            GameService.createGame(this.newGame).then(() =>{
                this.newGame={};
                this.$router.push({name:'home'});
            })
        }
    }
}
</script>

<style>

</style>