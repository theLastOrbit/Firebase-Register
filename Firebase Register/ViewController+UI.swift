//
//  ViewController+UI.swift
//  Firebase Register
//
//  Created by MD RUBEL on 31/7/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setupHeaderTitle() {
        
        let title = "Create a new account"
        let subTitle = "\n\nBy creating a new account you can bla bla bla."
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
        let attributedSubtitle = NSMutableAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)])
        
        attributedText.append(attributedSubtitle)
        
        //        Setup Line Spacing...
        //        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.lineSpacing = 5
        //
        //        attributedText.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSMakeRange(0, attributedText.length))
        
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
    }
    
    func setupOrLabel() {
        
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
    }
    
    func setupTermsLabel() {
        
        let attributedTermsText = NSMutableAttributedString(string: "By clicking \"Create a new account\" you agree to our ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        let attributedSubTermText = NSMutableAttributedString(string: "Terms and Service.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        attributedTermsText.append(attributedSubTermText)
        
        termsOfServiceLabel.numberOfLines = 0
        termsOfServiceLabel.attributedText = attributedTermsText
    }
    
    func setupFacebookButton() {
        
        signInFacebookButton.setTitle("Sign in with Facebook", for: UIControl.State.normal)
        signInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInFacebookButton.backgroundColor = UIColor(displayP3Red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInFacebookButton.layer.cornerRadius = 10
        signInFacebookButton.clipsToBounds = true
        signInFacebookButton.setImage(UIImage(named: "facebook-icon"), for: UIControl.State.normal)
        signInFacebookButton.imageView?.contentMode = .scaleAspectFit
        signInFacebookButton.tintColor = .white
        signInFacebookButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
    }
    
    func setupGoogleButton() {
        
        signInGoogleButton.setTitle("Sign in with Google", for: UIControl.State.normal)
        signInGoogleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInGoogleButton.backgroundColor = UIColor(displayP3Red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInGoogleButton.layer.cornerRadius = 10
        signInGoogleButton.clipsToBounds = true
        signInGoogleButton.setImage(UIImage(named: "google-icon"), for: UIControl.State.normal)
        signInGoogleButton.imageView?.contentMode = .scaleAspectFit
        signInGoogleButton.tintColor = .white
        signInGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 40)
    }
    
    func setupCreateAccountButton() {
        
        createAccountButton.setTitle("Create a new account", for: UIControl.State.normal)
        createAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        createAccountButton.backgroundColor = UIColor.black
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.clipsToBounds = true
    }
    
}
