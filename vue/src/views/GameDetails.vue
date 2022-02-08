<template>
  <div class="main">
    <div id="layout">
        <div id="leaderboard">
            <th>
              <div class="title">{{ game.gameName }}</div>
            </th>
            <th class="gametime"> 
              <div class="end">{{ " Ends on " + game.endDate }}</div>
            </th>
            <table>
                <thead>
                <tr>
                    <th>Place</th>
                    <th>Username</th>
                    <th>Portfolio Value</th>
                </tr>
                </thead>
                <tr v-for='(place, index) in leaderboard' v-bind:key="place.accountId">

                <td class="data">{{ index + 1 }}</td>
                <td class="data">{{ place.username }}</td>
                <td class="data">{{ place.userBalance }}</td>
                </tr>
            </table>
            <button v-on:click="goToPortfolio()">View My Portfolio</button>
        </div>
            <div id="invite">
            <thead>
            <tr>
                <th class="inviteUser">Invite User with Email</th>
            </tr>
            </thead>
            <form action="" method="get" class="form-example">
            <div class="form-example">
            <label for="name">Enter User Email: </label>
            <input type="text" name="name" id="name" required>
         </div>
  <div class="form-example">
    <label for="email">Enter User Email: </label>
    <input type="email" name="email" id="email" required>
  </div>
  <div class="form-example">
    <input type="submit" value="Invite!">
  </div>
</form>
  </div>
   
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
                organizerId: this.$store.state.game.organizerId,
                gameId: this.$store.state.game.gameId
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
            GameService.viewDetailsByGameId(this.$store.state.user.id, this.game.gameId).then((response) =>{
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
        },
        setLeaderBoard(){
          console.log("method called")
            GameService.viewLeaderBoard(this.$store.state.game.gameId).then((response)=>{
                console.log(response);
                this.$store.commit('SET_LEADERBOARD', response.data);
                this.leaderboard = this.$store.state.leaderboard
            })
        }
    },
    beforeMount() {
     this.setLeaderBoard();
     this.refresh();
     this.viewDetails();
     },
}
</script>


<style scoped>
tr, td, th {
  height: 30px;
}
.data {
  text-align: center;
}
.title{
font-size: 30px;
text-transform:uppercase;
letter-spacing: 10px;
height: 7px;

}
.end {
height: 22px;
font-size:17px;
border: rgb(17, 16, 16) solid;
border-bottom:black solid 3px;
width:210px;
}
.gametime {
  display:flex ;
  justify-content:center ;
}

#layout {
display:flex;
justify-content: space-around;
}

/* #invite{
     border: black solid;
     padding: 5px;
} */

div.form-example {
    display: table-row;
}

label, input {
    display: table-cell;
    margin-bottom: 10px;
}

label {
    padding-right: 10px;
}
/* spacing */
#leaderboard {
  display:grid;
  /* width: 33%; */
  border-collapse: collapse;
  border: 3 px solid rgb(22, 29, 22);
  margin: 5px;
  align-items: stretch;
  border: black solid;
  padding: 10px;
  /* height: 400px; */
  width:550px;
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
td {
  font-size: 75%;
}
th {
  font-size: 100%;
}
/* typography */
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

.inviteUser{
  text-align: left;
  padding: 20px;
}
h1,h2{
  text-align: center;
}
@media only screen and (max-width: 600px) {
    #leaderBoard{
        display: grid;
        width: 100%;
    }
    #invite{
        display: grid;
    }
    #layout{
        display: grid;
    }
}
</style>