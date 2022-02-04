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
        return axios.get('/portfolio', accountId)
    }
}