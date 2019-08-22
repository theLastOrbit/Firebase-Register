//
//  SignInViewController.swift
//  Firebase Register
//
//  Created by MD RUBEL on 1/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        setupTitleTextLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignInButton()
        setupSignUpButton()
        
    }
    
    @IBAction func dissmissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        signIn(onSuccess: {
//            TODO: - Sign up hoile eikhane main window te jabe
            
            ProgressHUD.showSuccess(SUCCESS_SIGN_IN)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
    
}
