import axios from 'axios';

export default {
    viewGamesByUserId(id) {
        return axios.get(`/${id}`)
    }
}