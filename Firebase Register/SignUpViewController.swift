//
//  SignUpViewController.swift
//  Firebase Register
//
//  Created by MD RUBEL on 31/7/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit
import ProgressHUD

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullNameContainerView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var image: UIImage? = nil 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
        setupTitleTextLabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }
    
    @IBAction func dissmissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        self.signUp(onSuccess: {
            
//            TODO: - Sign up hoile eikhane main window te jabe
            ProgressHUD.showSuccess(SUCCESS_SIGN_UP)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
        
    }
    
}
