<template>
  <div class="main">
    <div class="overview">
<!--   <h2 class="gameTitle">{{ game.gameName + " ENDS ON " + game.endDate }}</h2>
    <h2>make a trade</h2>
    <h2>Stocks to buy</h2> -->
    </div>
    <div section id="tables">
      <table class="money">
        <!--<caption>{{Username_Portfolio}}{{UserID}}{{GameName}}</caption> Needed? -->
        <thead>
          <tr>
            <th>Stock Ticker</th>
            <th>Shares</th>
            <th>Total Value</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="stock in assets" v-bind:key="stock.stockSymbol" v-on:click="populateFields(stock.stockSymbol, stock.numberOfShares)">
            <td>{{ stock.stockSymbol }}</td>
            <td>{{ stock.numberOfShares }}</td>
            <td>${{ parseFloat(stock.numberOfShares * stock.price).toFixed(2)}}</td>

          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2"></th>
            <th>{{ Total }}</th>
          </tr>
        </tfoot>
      </table>
      <table class="trade">
        <thead>
          <tr>
            <th colspan="2"></th>
           </tr>
        </thead>
        <tbody>
          <td rowspan="1">Enter stock ticker<input type="text" id='tickerInput'></td>
          <td rowspan="1">Enter number of shares<input type="text" id='sharesInput'></td>
          <tr> Buy </tr>
          <tr>Sell</tr>
          
        </tbody>
        <tfoot>
          <tr>
            <th colspan="1">Funds for Purchase </th>
            <th>{{ account.dollarAmount }}</th>
          </tr>
        </tfoot>
      </table>
      <table class="options">
        <!--<caption>{{Username_Portfolio}}{{UserID}}{{GameName}}</caption> Needed? -->
        <thead>
          <tr>
            <th colspan="2">Stock Ticker</th>
            <th >Price</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="stock in this.$store.state.stockPrices" v-bind:key="stock.stockSymbol" v-on:click="populateFields(stock.stockSymbol, 10)">
            <td colspan="2">{{ stock.stockSymbol }}</td>
            <td>${{ parseFloat(stock.currentPrice).toFixed(2)}}</td>

          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="3"> Current as of: {{ lastRefreshed }}</th>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</template>

<script>
import GameService from "../services/GameService.js";
export default {
  name: "portfolio",
  data() {
    return {
      game: {
        gameName: this.$store.state.game.gameName,
        endDate: this.$store.state.game.endDate,
        startDate: this.$store.state.game.startDate,
        organizerId: this.$store.state.game.organizerId,
      },
      account: {
        accountId: this.$store.state.account.accountId,
        dollarAmount: this.$store.state.account.dollarAmount,
        stockValue: this.$store.state.account.stockValue,
        userBalance: this.$store.state.account.userBalance,
      },
      
      lastRefreshed: '',

      assets: [
        {
          stockSymbol: "BX",
          numberOfShares: 311.8,
          price: 132.25,
        },
        {
          stockSymbol: "FRGSX",
          numberOfShares: 90.07,
          price: 118.44,
        },
        {
          stockSymbol: "FNMA",
          numberOfShares: 700,
          price: 0.8406,
        },
        {
          stockSymbol: "ABT",
          numberOfShares: 40,
          price: 129.71,
        },
        {
          stockSymbol: "VTI",
          numberOfShares: 132.13,
          price: 225.47,
        },
        {
          stockSymbol: " LEN",
          numberOfShares: 14.706,
          price: 90.3,
        },
        {
          stockSymbol: "LUCID",
          numberOfShares: 227,
          price: 27.55,
        },
        {
          stockSymbol: "BRK-B",
          numberOfShares: 53,
          price: 314.99,
        },
        {
          stockSymbol: "CSCO",
          numberOfShares: 68.155,
          price: 55.15,
        },
      ],
    };
  },

  computed: {},
  methods: {
    getAssets(accountId) {
      GameService.getPortfolio(accountId).then((response) => {
        this.assets = response.data;
      });
    },
    populateFields(stockSymbol, numberOfShares){
      document.getElementById('tickerInput').setAttribute("value", stockSymbol);
      document.getElementById('sharesInput').setAttribute("value", numberOfShares);

    },
    getTime() {
      let currentTime = new Date();
      this.lastRefreshed = currentTime.toTimeString;
    }
  },
  beforeMount() {
    this.getAssets(this.$store.state.account.accountId);
    this.getTime();
  },
  
};
</script>
<style scoped>
.overview{
  display: flex;
  justify-content: space-evenly;
}
.gameTitle{
  border: black solid;
}
#tables {
  display: flex;
  justify-content: space-evenly;
  align-items: stretch,
}
/* spacing */
table {
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
/* typography */
/*
html {
  font-family: 'helvetica neue', helvetica, arial, sans-serif;
}*/
/*
thead th, tfoot th {
  font-family: 'Rock Salt', cursive;
}*/

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
/* graphic and colors */
.money thead,
.money tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 50px;
  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(5, 42, 56);
}
.trade thead,
.trade tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 50px;
  /*background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(5, 88, 121);
}
.options thead,
.options tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 50px;
  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(6, 42, 56);
}
thead th,
tfoot th,
money.tfoot td {
  background: linear-gradient(
    to bottom,
    rgba(39, 217, 223, 0.1),
    rgba(6, 83, 88, 0.5)
  );
  border: 2px solid gold;
}
/* zebra striping */

.money tbody tr:nth-child(odd) {
  background-color: rgb(177, 182, 184);
}
.money tbody tr:nth-child(even) {
  background-color: rgb(211, 206, 206);
}
.options tbody tr:nth-child(odd) {
  background-color: rgba(77, 149, 35, 0.534);
}
.options tbody tr:nth-child(even) {
  background-color: rgba(13, 70, 92, 0.589);
}
</style>