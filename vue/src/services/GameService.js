import axios from 'axios';

export default {
    viewGamesByUserId(id) {
        return axios.get(`/${id}`)
    },
    createGame(game, id) {
        return axios.post(`/${id}`, game)
    },
    viewDetailsByGameId(userId, gameId) {
        return axios.get('/gameDetails', userId, gameId)
    },
    getPortfolio(accountId) {
        return axios.get(`/portfolio/${accountId}`)
    }, 
    buyNewStock(buyOrder){
        return axios.post('/stocks/buyNew', buyOrder)
    },
    buyStock(buyOrder){
        return axios.put('/stocks/buy', buyOrder)
    },
    sellStock(sellOrder){
        return axios.put('/stocks/sell', sellOrder)
    },
    updateStockPrices() {
        return axios.get('/currentPrices');
    },
    viewLeaderBoard(gameId){
        console.log("axios run")
        return axios.get(`/leaderboard/${gameId}`)
    },
    seeMyInvites(userId){
        return axios.get(`/displayInvites/${userId}`)
    },
    invitePlayer(invite) {
        return axios.post('/invite', invite)
    },
    confirmInvite(invite) {
        return axios.put('/confirm', invite)
    },
    declineInvite(invite) {
        return axios.delete('/declineInvite', invite)
    },
    endGame(gameId){
        return axios.put('/endGame', gameId)
    }

}