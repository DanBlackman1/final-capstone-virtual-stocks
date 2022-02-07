<template>
  <div class="main">
      <h1>{{ game.gameName + " ENDS ON " + game.endDate }}</h1>
    <div section id="leaderboard">
        <table>
            <thead>
            <tr>
        <th>Place</th>
        <th>Username</th>
        <th>Portfolio Value</th>
            </tr>
            </thead>
          <tr v-for='(place, index) in leaderboard' v-bind:key="place.userId">
              <td>{{ index + 1 }}</td>
              <td>{{ place.userName }}</td>
              <td>{{ place.userBalance }}</td>
              </tr>  
        </table>
        <button v-on:click="goToPortfolio()">View My Portfolio</button>

    </div>

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
            },
            account:{
                accountId: this.$store.state.account.accountId,
                dollarAmount: this.$store.state.account.dollarAmount,
                stockValue: this.$store.state.account.stockValue,
                userBalance: this.$store.state.account.userBalance
            },
            leaderboard: [],
        }
    },
    methods:{
        viewDetails(){
            GameService.viewDetailsByGameId(this.user.id, this.game.id).then((response) =>{
                this.game.endDate= response.data.endDate;
                this.game.startDate= response.data.startDate;
                this.game.gameName= this.$store.state.game.gameName;
            })
        },
        goToPortfolio() {
            this.$router.push('/portfolio');
        },
        refresh() {
            GameService.updateStockPrices().then((response) => {
                if (response.status === 200) {
                    this.$store.commit('SET_STOCK_PRICES', response.data);
                }
            })
        }
    },
    beforeMount(userId, gameId) {
        this.refresh();
        this.viewDetailsByGameId(userId, gameId);
    },
    // CHANGE TO SOME KIND OF UPDATE TO SPECIFIC PAGE PUSH OR PORTFOLIO WILL NOT HAVE ACCESS TO INFO 
    beforeDestroy() {
        this.game = {};
        this.account = {};
        this.$store.commit('SET_GAME', this.game);
        this.$store.commit('SET_ACCOUNT', this.account)
    }
}
</script>

<style>
#leaderboard {
  display: flex;
  justify-content: space-evenly;
  align-items: stretch,
}
/* spacing */
#leaderboard {
  table-layout: flex;
  width: 33%;
  border-collapse: collapse;
  border: 3 px solid rgb(22, 29, 22);
  margin: 5px;
}
thead th:nth-child(1) {
  width: 25%;
}
thead th:nth-child(2) {
  width: 25%;
}
thead th:nth-child(3) {
  width: 25%;
}

th,
td {
  padding: 5px;
}
td
{
  font-size:75%;
} 
th
{
  font-size:100%;
}

th {
  letter-spacing: 2px;
}
td {
  letter-spacing: 1px;
}
tbody td {
  text-align: center;
  border: burlywood solid;
}
tbody tr {
  text-align: center;
  border: burlywood solid;
}
tfoot th {
  text-align: center;
}
</style>