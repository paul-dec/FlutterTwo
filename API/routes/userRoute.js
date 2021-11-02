const controllers = require('../controllers/userController')
const tokenMiddleware = require('../middleware/tokenMiddleware')
const userMiddleware = require('../middleware/userMiddleware')
const validateMiddleware = require('../middleware/validateMiddleware')

module.exports = function (app) {
    app.route('/user/login',)
        .post(controllers.loginUser) // add middleware
    app.route('/user/register')
        .post(userMiddleware.registerValidation, validateMiddleware.validate, controllers.registerUser)
    app.route('/user/confirmation/:id')
        .get(controllers.confirmationUser)
    app.route('/user/:id')
        .get(tokenMiddleware.ensureToken, controllers.getInformationsUser)
    app.route('/user/forgot/:email')
        .get(controllers.forgotPasswordUser)
    app.route('/user/reset/:id')
        .put(userMiddleware.resetValidation, validateMiddleware.validate,controllers.resetPasswordUser) // rajouter middleware pour le password
    app.route('/user/changepassword/:id')
        .put(tokenMiddleware.ensureToken, controllers.changePasswordUser)
    app.route('/user/delete/:id')
        .delete(tokenMiddleware.ensureToken, controllers.deleteAccountUser)
    app.route('/user/changeinfos/:id')
        .put(tokenMiddleware.ensureToken, controllers.changeInformationsUser)
}