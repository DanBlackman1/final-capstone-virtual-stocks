<template>
  <div class="main">
    <div class="overview">
    <h2 class="gameTitle">{{ game.gameName + " ENDS ON " + game.endDate }}</h2>
    <h2>make a trade</h2>
    <h2>Stocks to buy</h2>
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
          <tr v-for="stock in assets" v-bind:key="stock.stockSymbol">
            <td>{{ stock.stockSymbol }}</td>
            <td>{{ stock.numberOfShares }}</td>
            <td>{{ stock.numberOfShares * stock.price }}</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Funds for Purchase</th>
            <th>{{ fundsForPurchase }}</th>
          </tr>
        </tfoot>
      </table>
      <table class="trade">
        <thead>
          <tr>
            <th>Buy  Sell</th>
            <th>Shares</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="stock in assets" v-bind:key="stock.stockSymbol">
            <td>{{ stock.stockSymbol }}</td>
            <td>{{ stock.numberOfShares }}</td>
            <td>{{ stock.numberOfShares * stock.price }}</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Funds for Purchase</th>
            <th>{{ fundsForPurchase }}</th>
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
          <tr v-for="stock in assets" v-bind:key="stock.stockSymbol">
            <td>{{ stock.stockSymbol }}</td>
            <td></td>
            <td>{{ stock.numberOfShares * stock.price }}</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="3">    Make It Rain !    </th>
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
      fundsForPurchase: 23000.0,

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
  },
  beforeMount() {
    this.getAssets(this.$store.state.account.accountId);
  },
  formatPrice(value) {
    /*/lisa */
    let val = (value / 1).toFixed(2).replace(".", ",");
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  },
};
</script>
<style scoped>
.overview{
  display: flex;
  justify-content: space-between;
}
.gameTitle{
  border: black solid;
}
#tables {
  display: flex;
  justify-content: space-evenly;
  align-items: stretch;
}
/* spacing */
table {
  table-layout: flex;
  width: 33%;
  border-collapse: collapse;
  border: 3 px solid rgb(135, 156, 135);
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
thead th:nth-child(4) {
  width: 20%;
}
th,
td {
  padding: 5px;
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
}
tfoot th {
  text-align: center;
}
/* graphic and colors */
.money thead,
.money tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 80px;
  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(201, 223, 181);
  text-shadow: 2px 2px 2px rgb(5, 88, 121);
}
.trade thead,
.trade tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 80px;
  /*background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(201, 223, 181);
  text-shadow: 2px 2px 2px rgb(5, 88, 121);
}
.options thead,
.options tfoot {
  background: url("../images/m.png");
  width: 75px;
  height: 80px;
  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(201, 223, 181);
  text-shadow: 2px 2px 2px rgb(5, 88, 121);
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
  background-color: rgb(211, 206, 206);
}
.options tbody tr:nth-child(even) {
  background-color: rgb(177, 182, 184);
}
</style>