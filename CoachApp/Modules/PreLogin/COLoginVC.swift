//
//  COLoginVC.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 23/11/22.
//

import UIKit
import MotionToastView
import GoogleSignIn

class COLoginVC: COBaseVC {
    
    // MARK: Outlets
    @IBOutlet weak var mobileOrEmailView: UIView!
    @IBOutlet weak var signUpText: UILabel!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var mobileOrEmailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Properties
    var text : String = ""
    var text1 : String = ""
    var email : String = "rishabh@gmail.com"
    var phone : String = "8882194082"
    var password : String = "Dev@1234"
    
    // MARK: Actions
    @IBAction func loginButton(_ sender: Any) {
        
        if mobileOrEmailTextfield.text!.isValidEmail || mobileOrEmailTextfield.text!.numberValidation {
            if (mobileOrEmailTextfield.text == email || mobileOrEmailTextfield.text == phone) && passwordTextfield.text == password {
                MotionToast(message: "Login", toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .bottom, toastCornerRadius: 22, pulseEffect: true)

            } else {
                MotionToast(message: "Please enter correct login details", toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .bottom, toastCornerRadius: 22, pulseEffect: true)

            }
        } else {
            MotionToast(message: "Please enter valid email or phone number", toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .bottom, toastCornerRadius: 22, pulseEffect: true)
        }
    }
    
    @IBAction func showButton(_ sender: Any) {
        passwordTextfield.isSecureTextEntry.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.passwordTextfield.isSecureTextEntry.toggle()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.pop()
    }
    
    @IBAction func forgotButton(_ sender: Any) {
    }
    
    // MARK: Initial Setup
    override func initialSetup() {
        hideKeyboardWhenTappedAround()
        mobileOrEmailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = ColorAssest.greyishBrown.colorAssest
        appleView.layer.cornerRadius = appleView.frame.width/2
        googleView.layer.cornerRadius = googleView.frame.width/2
        mobileOrEmailTextfield.delegate = self
        passwordTextfield.delegate = self
        loginButton.isUserInteractionEnabled = false
        let google = UITapGestureRecognizer(target: self, action: #selector(google))
        googleView.addGestureRecognizer(google)
        let apple = UITapGestureRecognizer(target: self, action: #selector(apple))
        appleView.addGestureRecognizer(apple)
    }
    
    @objc private func google() {
        let signInConfig = GIDConfiguration.init(clientID: "494198451565-llaqoo50qlok8h55ukmves1d3mtiq4g4.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            print(error)
        }
    }
    @objc private func apple() {
        
    }
}

extension COLoginVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == mobileOrEmailTextfield {
            text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        } else {
            text1 = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        }
        if text  != "" && text1 !=  "" {
            if loginButton.layer.sublayers!.count == 2 {
                loginButton.applyGradient(colours: [ColorAssest.yellowGrad.colorAssest, ColorAssest.blackGrad.colorAssest])
                loginButton.layer.masksToBounds = true
                loginButton.layer.cornerRadius = 25
                loginButton.isUserInteractionEnabled = true
            }
        } else {
            if loginButton.layer.sublayers!.count == 3 {
                loginButton.layer.sublayers!.remove(at: 0)
            }
            loginButton.backgroundColor = ColorAssest.greyishBrown.colorAssest
            loginButton.layer.masksToBounds = true
            loginButton.layer.cornerRadius = 25
            loginButton.isUserInteractionEnabled = false
        }
        return true
    }
}

extension String {
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}").evaluate(with: self)
    }
    
    var numberValidation: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{10}$").evaluate(with: self)
    }
}
