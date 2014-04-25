CryptoWallet = require "./crypto_wallet"
dogecoin = require("node-dogecoin")

class DogeWallet extends CryptoWallet

  currency: "DOGE"

  initialCurrency: "DOGE"

  currencyName: "Dogecoin"

  createClient: (options)->
    @client = dogecoin options.client

  getBalance: (account, callback)->
    @client.getBalance account, (err, balance)=>
      balance = @convert @initialCurrency, @currency, balance.result
      callback(err, balance) if callback

exports = module.exports = DogeWallet