const controllers = require('../controllers/userController')
const userMiddleware = require('../middleware/userMiddleware')
const validateMiddleware = require('../middleware/validateMiddleware')

module.exports = function (app) {
    app.route('/user/login',)
        .post(userMiddleware.loginValidation, validateMiddleware.validate, controllers.loginUser)
    app.route('/user/register')
        .post(userMiddleware.registerValidation, validateMiddleware.validate, controllers.registerUser)
    app.route('/user/addNFT')
        .post(userMiddleware.addNFTValidation, validateMiddleware.validate, controllers.addNFT)
}