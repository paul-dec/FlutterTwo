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