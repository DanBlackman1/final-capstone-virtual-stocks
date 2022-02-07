import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));
let currentGame = {};
let currentAccount = {};

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    game: currentGame || {},
    account: currentAccount || {},
    stockPrices: [],
    portfolio: [],
    leaderBoard: []
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_GAME(state, game) {
    state.game = game;
    },
    SET_ACCOUNT(state, account) {
      state.account = account;
    },
    SET_STOCK_PRICES(state, stockList) {
      state.stockPrices = [];
      for(let i = 0; i < stockList.length; i++) {
        let tempStock = {
          stockSymbol: '',
          currentPrice: ''
        };
        tempStock.stockSymbol = stockList[i].stockSymbol;
        tempStock.currentPrice = stockList[i].currentPrice;
        state.stockPrices.push(tempStock);
      }
    },
    SET_PORTFOLIO(state, updatedPortfolio) {
      state.portfolio = [];
      for(let i = 0; i < updatedPortfolio.length; i++) {
        let tempItem = {
          accountId: '',
          stockSymbol: '',
          numberOfShares: ''
        };
        tempItem.accountId = updatedPortfolio[i].accountId,
        tempItem.stockSymbol = updatedPortfolio[i].stockSymbol,
        tempItem.numberOfShares = updatedPortfolio[i].numberOfShares
        state.portfolio.push(tempItem);
      }

    },
    SET_LEADERBOARD(state, accountList) {
      state.leaderBoard = [];
      for(let i = 0; i < accountList.length; i++) {
        let tempAccount = {
          accountId: '',
          userBalance: '',
          stockValue: '',
          dollarAmount: ''
        };
        tempAccount.accountId = accountList[i].accountId,
        tempAccount.userBalance = accountList[i].userBalance,
        tempAccount.stockValue = accountList[i].stockValue,
        tempAccount.dollarAmount = accountList[i].dollarAmount,
        
        state.leaderBoard.push(tempAccount);
      }

    }
    }
  })
