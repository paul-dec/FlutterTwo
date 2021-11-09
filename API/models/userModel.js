const mongoose = require('mongoose')
const CryptoJS = require("crypto-js")

const userSchema = new mongoose.Schema({
    pseudo: {
        type: String,
        max: 255,
        required: true
    },
    email: {
        type: String,
        unique: true,
        max: 255,
        required: true
    },
    password: {
        type: String,
        min: 8,
        max: 255,
        required: true
    },
    NFTs: [{
        url: String,
        name: String,
        description: String
    }]
},{
    timestamps: true
});

userSchema.methods.isPasswordMatching = function (password) {
    var bytes  = CryptoJS.AES.decrypt(this.password, process.env.KE_PASSWORD);
    return bytes.toString(CryptoJS.enc.Utf8) === password
}

module.exports = mongoose.model('User', userSchema);