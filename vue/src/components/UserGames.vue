<template>
  <div id="main">
    <ul>
    <!--<li v-for:="game in gameList"></li> -->
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return { 
      accountList: [],
      gameList: []
    }
  },
  methods: {
    getGameList(){
           GameService.viewGamesByUserId(this.userId).then((response) =>{
             this.accountList = response.data[0];
             this.gameList = response.data[1];
            })
  }
}
</script>

<style>

</style>