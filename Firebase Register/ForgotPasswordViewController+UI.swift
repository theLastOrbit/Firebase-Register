//
//  ForgotPasswordViewController+UI.swift
//  Firebase Register
//
//  Created by MD RUBEL on 1/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit

extension ForgotPasswordViewController {
    
    func setupTitleTextLabel() {
        
        let title = "Forgot Password?"
        
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
    
    func setupResetButton() {
        resetPasswordButton.setTitle("Reset my password", for: UIControl.State.normal)
        resetPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        resetPasswordButton.backgroundColor = UIColor.black
        resetPasswordButton.layer.cornerRadius = 10
        resetPasswordButton.clipsToBounds = true
        resetPasswordButton.setTitleColor(.white, for: UIControl.State.normal)
    }
    
}
