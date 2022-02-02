import axios from 'axios';

export default {
    viewGamesByUserId(id) {
        return axios.get(`/${id}`)
    },
    createGame(game, id) {
        return axios.post(`/${id}`, game)
    }
}