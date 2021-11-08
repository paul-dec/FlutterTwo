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
    return res.status(200).json({ 
        message: user
    })
}
