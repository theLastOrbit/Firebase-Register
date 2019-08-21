//
//  SignUpViewController+UI.swift
//  Firebase Register
//
//  Created by MD RUBEL on 1/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignUpViewController {
    
    func setupTitleTextLabel() {
        
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
        
        titleTextLabel.attributedText = attributedText
    }
    
    func setupAvatar() {
        
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avatar.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
       // picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func setupFullNameTextField() {
        
        fullNameContainerView.layer.borderWidth = 1
        fullNameContainerView.layer.borderColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1).cgColor
        
        fullNameContainerView.layer.cornerRadius = 10
        fullNameContainerView.clipsToBounds = true
        
        fullNameTextField.borderStyle = .none
        
        let placeHolderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 180/255, green: 180/255, blue: 180/255, alpha: 1)])
        fullNameTextField.attributedPlaceholder = placeHolderAttr
        fullNameTextField.textColor = UIColor(displayP3Red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
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
    
    func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signUpButton.backgroundColor = UIColor.black
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        signUpButton.setTitleColor(.white, for: UIControl.State.normal)
    }
    
    func setupSignInButton() {
        
        let attributedText = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedText.append(attributedSubText)
        
        signInButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true )
    }
    
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        guard let imageSelected = self.image else {
            ProgressHUD.showError(ERROR_EMPTY_PHOTO)
            return
        }
        guard let fullName = self.fullNameTextField.text, !fullName.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_NAME)
            return
        }
        
        ProgressHUD.show()
        
        Api.User.signUp(withName: self.fullNameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: imageSelected, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageEdited = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            avatar.image = imageEdited
            image = imageEdited
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            avatar.image = imageOriginal
            image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
