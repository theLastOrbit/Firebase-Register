//
//  ForgotPasswordViewController.swift
//  Firebase Register
//
//  Created by MD RUBEL on 1/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        setupTitleTextLabel()
        setupEmailTextField()
        setupResetButton()
        
    }
    
}
