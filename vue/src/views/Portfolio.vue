<template>
  <div class="main">
      <h1>{{ game.gameName + " ENDS ON " + game.endDate }}</h1>

        <table>
            <thead>
            <tr>
        <th>Stock Name</th>
        <th>Number of Shares</th>
        <th>Total Value</th>
            </tr>
            </thead>
          <tr v-for='stock in assets' v-bind:key="stock.stockSymbol">
              <td>{{ stock.stockSymbol }}</td>
              <td>{{ stock.numberOfShares }}</td>
              <td>{{  }}</td>
              </tr>  
        </table>
  </div>
</template>

<script>

import GameService from "../services/GameService.js";
export default {
    name: 'portfolio',
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
            assets: [],
        }
    },
    methods:{
        getAssets(accountId) {
            GameService.getPortfolio(accountId).then((response) => {
                this.assets = response.data;
            })
        }
    },
    beforeMount() {
        this.getAssets(this.$store.state.account.accountId);
    }
}
</script>

<style>

</style>