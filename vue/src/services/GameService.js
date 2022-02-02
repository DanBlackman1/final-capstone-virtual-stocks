import axios from 'axios';

export default {
    viewGamesByUserId(id) {
        return axios.get(`/${id}`)
    },
    createGame(game) {
        return axios.post(`/${this.user.id}`, game)
    }
}