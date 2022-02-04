import axios from 'axios';

export default {
    getStockBySymbol(stockSymbol) {
        return axios.get(`http://api.marketstack.com/v1/intraday?access_key=28d01c87a292d3ebe6d86949d6462031&symbols=${stockSymbol}&interval=1min`)
    }
}