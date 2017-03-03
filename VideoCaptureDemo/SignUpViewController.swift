//
//  SignUpViewController.swift
//  VideoCaptureDemo
//
//  Created by Elon Rubin on 3/2/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import UIKit
import Parse
import SwiftSpinner

class SignUpViewController: UIViewController, UITextFieldDelegate {

    var didTapSignIn = false
    
    @IBOutlet weak var signUpStackView: UIStackView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var secondSignInButton: UIButton!
    
    @IBOutlet weak var mainAirLogoImage: UIImageView!
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  // MARK: - Methods
    
    func shouldHideFirstGroup(signInPressed:Bool) {
        joinButton.isHidden = true
        signInButton.isHidden = true
        mainAirLogoImage.isHidden = true
        signUpStackView.isHidden = false
        
        if (!signInPressed) {
            secondSignInButton.setTitle("Join", for: .normal)
            didTapSignIn = false
        } else {
             secondSignInButton.setTitle("Sign In", for: .normal)
            didTapSignIn = true
        }
        usernameTextField.becomeFirstResponder()
    }
    
    func goToHomeScreen () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: "MainVC")
        DispatchQueue.main.async { () -> Void in
             self.present(nc, animated: true, completion: nil)
        }
    }
    

  // MARK: - Actions

    
    
    @IBAction func joinButtonPressed(_ sender: Any) {
        shouldHideFirstGroup(signInPressed: false)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        shouldHideFirstGroup(signInPressed: true)
    }
    
    @IBAction func secondSignInButtonPressed(_ sender: Any) {
      print("pressed")
        
        
        if (!didTapSignIn) {
            SwiftSpinner.show("Signing You Up...")
        ParseMethods.signUpUserWith(username: usernameTextField.text!, password: passwordTextField.text!) { (success, error) in
            if(success) {
                SwiftSpinner.hide({
                    self.goToHomeScreen()
                })
                
            } else {
                guard let error = error else { return }
               SwiftSpinner.hide()
                print(error)
            }
        }
        } else {
            SwiftSpinner.show("Signing You In...")
            ParseMethods.signInUser(username: usernameTextField.text!, password: passwordTextField.text!, completion: { (success, error) in
                if(success) {
                    SwiftSpinner.hide({
                        self.goToHomeScreen()
                    })
                } else {
                    guard let error = error else { return }
                    print(error)
                    SwiftSpinner.hide()
                }
            })
        }
            
        }

    
    
}
