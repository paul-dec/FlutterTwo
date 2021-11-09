const User = require('../models/userModel')
const Encryption = require('../utils/encryption')

exports.registerUser = async function (req, res) {
    var user = new User({
        pseudo: req.body.pseudo,
        password: Encryption.Encrypt(req.body.password),
        email: req.body.email
    })
    try {
        await user.save()
    } catch (error) {
        return res.status(500).json({ message: "Email already used" })
    }
    return res.status(200).json({ 
        message: "User registered"
    })
}

exports.loginUser = async function (req, res) {
    const user = await User.findOne({ email: req.body.email })
    if (!user || !user.isPasswordMatching(req.body.password))
        return res.status(400).json({ message: "Email or password not valid" })
    user.password = "hidden"
    user.NFTs = "hidden"
    return res.status(200).json({ 
        message: user
    })
}

exports.getNFTs = async function (req, res) {
    const user = await User.findById(req.body.id)
    user.password = "hidden"
    return res.status(200).json({
        message: user
    })
}

exports.addNFT = async function (req, res) {
    if (!req.body.url.startsWith("https://lh3.googleusercontent.com/")) {
        return res.status(400).json({ message: "Wrong url" })
    }
    const user = await User.findById(req.body.id)
    const NFT = {
        url: req.body.url,
        name: req.body.name,
        description: req.body.description
    }
    if (!user)
        return res.status(400).json({ message: "No user with this id" })
    try {
        await user.NFTs.push(NFT);
        await user.save()
    } catch (error) {
        return res.status(500).json({ message: error })
    }
    user.password = "hidden"
    return res.status(200).json({
        message: user
    })
}
