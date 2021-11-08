const CryptoJS = require("crypto-js")

exports.Encrypt = function(password) {
    return CryptoJS.AES.encrypt(password, process.env.KE_PASSWORD).toString();
}