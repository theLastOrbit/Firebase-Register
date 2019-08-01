//
//  signInViewController+UI.swift
//  Firebase Register
//
//  Created by MD RUBEL on 1/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit

extension SignInViewController {
    
    func setupTitleTextLabel() {
        
        let title = "Sign In"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
        
        titleTextLabel.attributedText = attributedText
    }

    func setupEmailTextField() {
        
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1).cgColor
        
        emailContainerView.layer.cornerRadius = 10
        emailContainerView.clipsToBounds = true
        
        emailTextField.borderStyle = .none
        
        let placeHolderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 180/255, green: 180/255, blue: 180/255, alpha: 1)])
        emailTextField.attributedPlaceholder = placeHolderAttr
        emailTextField.textColor = UIColor(displayP3Red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
    }
    
    func setupPasswordTextField() {
        
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1).cgColor
        
        passwordContainerView.layer.cornerRadius = 10
        passwordContainerView.clipsToBounds = true
        
        passwordTextField.borderStyle = .none
        
        let placeHolderAttr = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 180/255, green: 180/255, blue: 180/255, alpha: 1)])
        passwordTextField.attributedPlaceholder = placeHolderAttr
        passwordTextField.textColor = UIColor(displayP3Red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
    }
    
    func setupSignInButton() {
        signInButton.setTitle("Sign In", for: UIControl.State.normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signInButton.backgroundColor = UIColor.black
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
        signInButton.setTitleColor(.white, for: UIControl.State.normal)
    }
    
    func setupSignUpButton() {
        
        let attributedText = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedText.append(attributedSubText)
        
        signUpButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
}
