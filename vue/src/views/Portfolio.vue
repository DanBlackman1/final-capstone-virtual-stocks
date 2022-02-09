<template>
  <div class="main">
    <div class="overview">
<!--   <h2 class="gameTitle">{{ game.gameName + " ENDS ON " + game.endDate }}</h2>
    <h2>make a trade</h2>
    <h2>Stocks to buy</h2> -->
     <!-- Stock search: <input type="search" placeholder="Search"> -->
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
          <tr class="clickable" v-for="stock in assets" v-bind:key="stock.stockSymbol" v-on:click="populateFields(stock.stockSymbol, stock.numberOfShares)">
            <td class="leftTable">{{ stock.stockSymbol }}</td>
            <td class="leftTable">{{ stock.numberOfShares }}</td>
            <td class="leftTable">${{ parseFloat(getAssetLineValue(stock)).toFixed(2)}}</td>
            <!--<td class="leftTable">${{ parseFloat(getAssetLineValue(stock)).toFixed(2)}}</td>-->

          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Total Portfolio Value</th>
            <th> </th>
          </tr>
        </tfoot>
      </table>
      <table class="trade">
        <thead>
          <tr >
            <th colspan="2">Funds for Purchase: ${{ Number(account.dollarAmount).toLocaleString() }} </th>
           </tr>
        </thead>
        <tbody class="middleColumns">
          <td class="midSpacing">Enter stock ticker:<br><br>
            <input type="text" id='tickerInput' max="50px" style="width: 50px"><br>
            <button class="btnBuy" v-on:click="buyStock(generateBuyOrder())"> Buy </button>
          </td >
            <td class="midSpacing">Enter number of shares:<br><br><input type="text" id='sharesInput' style="width: 50px"><br>
            <button class="btnSell" v-on:click="sellStock(generateSellOrder())"> Sell </button>
          </td>
          
        </tbody>
        <tfoot>
          <tr>
            <th colspan="1">Funds for Purchase: ${{ Number(account.dollarAmount).toLocaleString() }}</th>
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
        <tbody id="rightTable">
          <tr class="clickable" v-for="stock in this.$store.state.stockPrices" v-bind:key="stock.stockSymbol" v-on:click="populateFields(stock.stockSymbol, 10)">
            <td colspan="2" class="rowCheck">{{ stock.stockSymbol }}</td>
            <td class="rowCheck">${{ parseFloat(stock.currentPrice).toFixed(2)}}</td>

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

      assets: [],
    };
  },

  computed: {},
  methods: {
    getAssets(accountId) {
      console.log("get assets")
      GameService.getPortfolio(accountId).then((response) => {
        console.log(response.data);
        this.$store.commit('SET_PORTFOLIO', response.data.stockList);
      this.assets = this.$store.state.portfolio;
      this.getTime();
      });
    },
    populateFields(stockSymbol, numberOfShares){
      document.getElementById('tickerInput').setAttribute("value", stockSymbol);
      document.getElementById('sharesInput').setAttribute("value", numberOfShares);

    },
    generateBuyOrder(){
      console.log("generate buy order")
      let price = 0;
      let stockSymbol = document.getElementById('tickerInput').value;
      let pricesArr = this.$store.state.stockPrices;
          for(let i = 0; i < pricesArr.length; i++) {
        if(stockSymbol === pricesArr[i].stockSymbol) {
       price = pricesArr[i].currentPrice;}}
      let buyOrder = {sharesToAdd: document.getElementById('sharesInput').value,
      stockSymbol: stockSymbol, accountId: this.account.accountId, currentPrice: price}
      return buyOrder;
    },
    buyStock(buyOrder){
      console.log("buy function")
      let isFound = false;
      // let stocksOwned = this.assets;
      for(let i = 0; i < this.assets.length; i++){
        if(buyOrder.stockSymbol === this.assets[i].stockSymbol){
          isFound = true;
        }
      }
      if(isFound){
        GameService.buyStock(buyOrder);
        console.log("executed current buy")
      }
      else{
        GameService.buyNewStock(buyOrder);
        console.log("executed new buy")
      }
    },
    generateSellOrder(){
      console.log("generate sales order")
      let price = 0;
      let maxSharesToSubtract = 0;
      let sellQuantity = 0;
      let allShares = false;
      let stockSymbol = document.getElementById('tickerInput').value;
      let portfolioArr = this.assets;
          for(let i = 0; i < portfolioArr.length; i++) {
        if(stockSymbol === portfolioArr[i].stockSymbol) {
       price = portfolioArr[i].currentPrice;
       maxSharesToSubtract = portfolioArr[i].numberOfShares}}
       if(document.getElementById('sharesInput').value < maxSharesToSubtract){
       sellQuantity = document.getElementById('sharesInput').value;}
      else{ sellQuantity = maxSharesToSubtract;
      allShares = true;}
        let sellOrder = {sharesToSubtract: sellQuantity,
      stockSymbol: stockSymbol, accountId: this.account.accountId, currentPrice: price, allShares: allShares}
      return sellOrder;
    },
    sellStock(sellOrder){
      console.log("sell function")
      GameService.sellStock(sellOrder);
    },
    getTime() {
    let allOfTime = new Date();
    this.lastRefreshed = (allOfTime.getMinutes() < 10) ? allOfTime.getHours() + ":0" + allOfTime.getMinutes() + ":" + allOfTime.getSeconds()
     : allOfTime.getHours() + ":" + allOfTime.getMinutes() + ":" + allOfTime.getSeconds();               
    },
    getAssetLineValue(stock) {
      let pricesArr = this.$store.state.stockPrices;
      for(let i = 0; i < pricesArr.length; i++) {
        if(stock.stockSymbol === pricesArr[i].stockSymbol) {
          return stock.numberOfShares * pricesArr[i].currentPrice;
        }
      }
    }
  },
  created() {
    this.getAssets(this.account.accountId);
  },
  
};
</script>
<style scoped>
/* .rightTable{
  height: 50px;
  overflow: auto;
  
} */
thead, tfoot{
  cursor: default;
}
button{
  margin-top: 5px;
  padding: 3px;
  width: 75px;
}
.btnBuy, .btnSell{
  cursor: pointer;
}

.midSpacing{
  margin: 5px;
  font-weight: bold;
  font-size: 13px;
  cursor: default;
}
.middleColumns{
  display: flex;
  justify-content: center;
  padding: 10px;
}

.leftTable{
  border: burlywood solid;
}
.overview{
  display: flex;
  justify-content: center;
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
  font-size:75%;
  letter-spacing: 1px;
  text-align: center;
 
}

th
{
  font-size:100%;
  letter-spacing: 2px;
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

.rowCheck {
  text-align: center;
  border: burlywood solid;
  
}
tfoot th {
  text-align: center;
  border: 2px solid gold;
}
/* graphic and colors */
.money thead,
.money tfoot {
  background: url("../images/m.png");

  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(5, 42, 56);
   width: 75px;
  height: 50px;
}
.trade thead,
.trade tfoot {
  background: url("../images/m.png");
  

  /*background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(5, 88, 121);
  width: 75px;
  height: 50px;
}
.options thead,
.options tfoot {
  background: url("../images/m.png");

  background-repeat: round; /* Makes money lie flat as if on a tabletop */
  color: rgb(232, 236, 228);
  text-shadow: 2px 3px 2px rgb(6, 42, 56);
   width: 75px;
  height: 50px;
  
  
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
.money tbody tr:nth-child(odd):hover {
   background-color:lightcoral;
}


.money tbody tr:nth-child(even) {
  background-color: rgb(211, 206, 206);
}
.money tbody tr:nth-child(even):hover {
 background-color:lightcoral;
}


.options tbody tr:nth-child(odd) {
  background-color: rgba(77, 149, 35, 0.534);
}
.options tbody tr:nth-child(odd):hover {
  background-color:green;
}


.options tbody tr:nth-child(even) {
  background-color: rgba(13, 70, 92, 0.589);
}
.options tbody tr:nth-child(even):hover {
  background-color: green;
}

.clickable:hover{
    cursor: pointer;
    transform: scale(1.1);
    transition: all .2s ease-in-out;
}
@media only screen and (max-width: 600px) {
  #tables{
    display: grid;
  }
}
</style>