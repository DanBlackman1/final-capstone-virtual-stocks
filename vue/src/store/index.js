import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import StockService from '../services/StockService'

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
let stocksArr = [];
let stock = {};

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    game: currentGame || {},
    account: currentAccount || {},
    stocksArr: [
      "MSFT","AAPL","AMZN","GOOGL","BABA","FB",
      "BRK","VOD","V","JPM","WMT","MA","TSM","CHT",
      "RHHBF","UNH","HD","INTC","KO","VZ","XOM","DIS",
      "NVS","CMCSA","PFE" ],
    assetArr: [],
    stock: {}
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
    SET_ASSETS(state) {
      let tempArr = [];
      for(let i = 0; i < state.stocksArr.length; i++) {
        let arr = [];
        arr = StockService.getStockBySymbol(stocksArr[i]);
        state.stock = {
          stockSymbol: stocksArr[i],
          currentPrice: arr[1][0].last
        };
        tempArr.push(stock);
      }
      state.assetArr = tempArr;
    }
   }
 })
  