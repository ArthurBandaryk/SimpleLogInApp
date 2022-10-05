//
//  AuthorizationViewController.swift
//  AuthorizationViewController
//
//  Created by Artur Bandaryk on 10/3/22.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    var authorizationView: UIView = UIView()
    
    var logInLabel: UILabel = UILabel()
    
    var userTextField: UITextField = UITextField()
    
    var passwordTextField: UITextField = UITextField()
    
    var authorizeButton: UIButton = UIButton()
    
    var welcomeView: UIViewController?
    
    let serviceModel = SimpleServiceModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: my initialization.
        // Background color of the main view.
        view.backgroundColor =
        UIColor(red: 0.08, green: 1, blue: 1, alpha: 1)
        
        // View's initialization.
        initViews()
        
        // Create constraints.
        createConstraints()
    }
    
    func initViews() -> Void {
        // Initialization of login view.
        logInLabel.text = "LOG IN"
        logInLabel.shadowColor = UIColor.black
        logInLabel.textColor = UIColor.white
        logInLabel.numberOfLines = 1
        logInLabel.font = logInLabel.font.withSize(30)
        logInLabel.textAlignment = NSTextAlignment.center
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialization of authorization view.
        authorizationView.translatesAutoresizingMaskIntoConstraints = false
        authorizationView.backgroundColor = UIColor.lightGray
        authorizationView.layer.cornerRadius = 10
        
        // Initialization of user text field.
        userTextField.placeholder = "Username:"
        userTextField.borderStyle = UITextField.BorderStyle.roundedRect
        userTextField.clearButtonMode = UITextField.ViewMode.always
        userTextField.minimumFontSize = 12.0
        userTextField.adjustsFontSizeToFitWidth = true
        userTextField.textColor = .black
        userTextField.textAlignment = .left
        userTextField.backgroundColor = .white
        userTextField.autocapitalizationType =
        UITextAutocapitalizationType.none
        userTextField.keyboardType = UIKeyboardType.emailAddress
        userTextField.keyboardAppearance = UIKeyboardAppearance.light
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialization of password text field.
        passwordTextField.placeholder = "Password:"
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        passwordTextField.minimumFontSize = 12.0
        passwordTextField.adjustsFontSizeToFitWidth = true
        passwordTextField.textColor = .black
        passwordTextField.textAlignment = .left
        passwordTextField.backgroundColor = .white
        passwordTextField.autocapitalizationType =
        UITextAutocapitalizationType.none
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.keyboardAppearance = UIKeyboardAppearance.light
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        
        // Initialization of authorize button.
        authorizeButton.backgroundColor = UIColor(red: 0.37,
                                                  green: 0.65,
                                                  blue: 0.96,
                                                  alpha: 1)
        authorizeButton.layer.borderWidth = 1
        authorizeButton.layer.borderColor = CGColor(red: 0.67,
                                                    green: 0.97,
                                                    blue: 0.89,
                                                    alpha: 1)
        authorizeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        authorizeButton.setTitle("Authorize", for: UIControl.State.normal)
        authorizeButton.setTitleColor(UIColor.white, for: .normal)
        authorizeButton.layer.cornerRadius = 10
        authorizeButton.translatesAutoresizingMaskIntoConstraints = false
        // Add actions for this button.
        authorizeButton.addTarget(self,
                                  action: #selector(changeColorForAuthorizeButton),
                                  for: UIControl.Event.touchUpInside)
        authorizeButton.addTarget(self,
                                  action: #selector(authorization),
                                  for: UIControl.Event.touchDown)
        
        // Adding all views as subviews to super view.
        view.addSubview(logInLabel)
        view.addSubview(authorizationView)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(authorizeButton)
    }
    
    func createConstraints() -> Void {
        // MARK: constraints for authorization view.
        // Left side of authorization view.
        let leadingAuthorizationView =
        NSLayoutConstraint(item: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           multiplier: 1.0,
                           constant: 50.0)
        
        // Right side of super view.
        let trailingSuperView =
        NSLayoutConstraint(item: view as Any,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           multiplier: 1.0,
                           constant: 50.0)
        
        
        // Top side of authorization view.
        let topIndentAuthorizationView =
        NSLayoutConstraint(item: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.top,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view,
                           attribute: NSLayoutConstraint.Attribute.top,
                           multiplier: 1.0,
                           constant: 100.0)
        
        
        // Bottom side of superview.
        let bottomSuperView =
        NSLayoutConstraint(item: view as Any,
                           attribute: NSLayoutConstraint.Attribute.bottom,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.bottom,
                           multiplier: 1.0,
                           constant: 50.0)
        
        // MARK: constraints for log in text label.
        // Left side of log in label.
        let leadingLogInView =
        NSLayoutConstraint(item: logInLabel,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           multiplier: 1.0,
                           constant: 20)
        
        // Right side of log in label.
        let trailingLogInView =
        NSLayoutConstraint(item: logInLabel,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           multiplier: 1.0,
                           constant: -20)
        
        // Bottom side of log in label.
        let bottomLogInView =
        NSLayoutConstraint(item: logInLabel,
                           attribute: NSLayoutConstraint.Attribute.top,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.top,
                           multiplier: 1.0,
                           constant: -40)
        
        // Height of log in label.
        let heightLogInView =
        NSLayoutConstraint(item: logInLabel,
                           attribute: NSLayoutConstraint.Attribute.height,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil,
                           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                           multiplier: 0.0,
                           constant: 40)
        
        // MARK: user text field constraints.
        // Left side of user text field.
        let leadingUserTextField =
        NSLayoutConstraint(item: userTextField,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           multiplier: 1.0,
                           constant: 40)
        
        // Right side of user text field.
        let trailingUserTextField =
        NSLayoutConstraint(item: userTextField,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           multiplier: 1.0,
                           constant: -40)
        
        // Bottom side of user text field.
        let topUserTextField =
        NSLayoutConstraint(item: userTextField,
                           attribute: NSLayoutConstraint.Attribute.top,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: authorizationView,
                           attribute: NSLayoutConstraint.Attribute.top,
                           multiplier: 1.0,
                           constant: 50)
        
        // Height of user text field.
        let heightUserTextField =
        NSLayoutConstraint(item: userTextField,
                           attribute: NSLayoutConstraint.Attribute.height,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil,
                           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                           multiplier: 0.0,
                           constant: 40)
        
        // MARK: password text field constraints.
        // Left side of password text field.
        let leadingPasswordTextField =
        NSLayoutConstraint(item: passwordTextField,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.leading,
                           multiplier: 1.0,
                           constant: 0)
        
        // Right side of password text field.
        let trailingPasswordTextField =
        NSLayoutConstraint(item: passwordTextField,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           multiplier: 1.0,
                           constant: 0)
        
        // Bottom side of password text field.
        let topUserPasswordField =
        NSLayoutConstraint(item: passwordTextField,
                           attribute: NSLayoutConstraint.Attribute.top,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.bottom,
                           multiplier: 1.0,
                           constant: 20)
        
        // Height of password text field.
        let heightUserPasswordField =
        NSLayoutConstraint(item: passwordTextField,
                           attribute: NSLayoutConstraint.Attribute.height,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.height,
                           multiplier: 1.0,
                           constant: 0)
        
        // MARK: authorize button constraints.
        // Center x of authorize button.
        let centerXPasswordTextField =
        NSLayoutConstraint(item: authorizeButton,
                           attribute: NSLayoutConstraint.Attribute.centerX,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.centerX,
                           multiplier: 1.0,
                           constant: 0)
        
        // Top side of authorize button.
        let topAuthorizeButton =
        NSLayoutConstraint(item: authorizeButton,
                           attribute: NSLayoutConstraint.Attribute.top,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: passwordTextField,
                           attribute: NSLayoutConstraint.Attribute.bottom,
                           multiplier: 1.0,
                           constant: 40)
        
        // Height of authorize button.
        let heightAuthorizeButton =
        NSLayoutConstraint(item: authorizeButton,
                           attribute: NSLayoutConstraint.Attribute.height,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.height,
                           multiplier: 0.5,
                           constant: 0)
        
        // Width of authorize button.
        let widthAuthorizeButton =
        NSLayoutConstraint(item: authorizeButton,
                           attribute: NSLayoutConstraint.Attribute.width,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: userTextField,
                           attribute: NSLayoutConstraint.Attribute.width,
                           multiplier: 0.5,
                           constant: 0)
        
        // Adding constraints.
        view.addConstraints([
            leadingAuthorizationView,
            topIndentAuthorizationView,
            trailingSuperView,
            bottomSuperView,
            leadingLogInView,
            trailingLogInView,
            bottomLogInView,
            heightLogInView,
            leadingPasswordTextField,
            trailingPasswordTextField,
            topUserPasswordField,
            heightUserPasswordField,
            centerXPasswordTextField,
            topAuthorizeButton,
            widthAuthorizeButton,
            heightAuthorizeButton])
        
        // Adding user text field constraints in another way for study purpose.
        view.addConstraint(leadingUserTextField)
        view.addConstraint(trailingUserTextField)
        view.addConstraint(topUserTextField)
        view.addConstraint(heightUserTextField)
    }
    
    @objc func authorization() {
        authorizeButton.backgroundColor = UIColor(red: 0.03,
                                                  green: 0.27,
                                                  blue: 0.54,
                                                  alpha: 1)
        if serviceModel.authorizationSuccess(userTextField.text,
                                             passwordTextField.text) {
            welcomeView = WelcomeViewController()
            present(welcomeView!, animated: true, completion: nil)
        } else {
            let alertIncorrectUsernameOrPassword =
            UIAlertController(title: "Invalid input",
                              message: "Incorrect password or user name!",
                              preferredStyle: UIAlertController.Style.alert)
            
            let okButtonForAlert = UIAlertAction(title: "OK",
                                                 style: UIAlertAction.Style.cancel,
                                                 handler: nil)
            
            alertIncorrectUsernameOrPassword.addAction(okButtonForAlert)
            
            present(alertIncorrectUsernameOrPassword,
                    animated: true, completion: nil)
        }
    }
    
    @objc func changeColorForAuthorizeButton() {
        authorizeButton.backgroundColor = UIColor(red: 0.37,
                                                  green: 0.65,
                                                  blue: 0.96,
                                                  alpha: 1)
    }
    
}
