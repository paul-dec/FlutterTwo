const { check } = require('express-validator')

module.exports.registerValidation = [
    check('email').notEmpty(),
    check('email').isEmail(),
    check('pseudo').notEmpty(),
    check('password').notEmpty()
]

module.exports.loginValidation = [
    check('email').notEmpty(),
    check('email').isEmail(),
    check('password').notEmpty()
]

module.exports.getNFTsValidation = [
    check('id').notEmpty()
]

module.exports.getNFTValidation = [
    check('id').notEmpty(),
    check('url').notEmpty()
]

module.exports.addNFTValidation = [
    check('id').notEmpty(),
    check('url').notEmpty(),
    check('name').notEmpty(),
    check('description').notEmpty()
]