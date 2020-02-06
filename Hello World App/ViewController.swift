//
//  ViewController.swift
//  Hello World App
//
//  Created by Janco Erasmus on 2020/02/04.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var createAccountButtonCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var createAccountButtonTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        orLabel.isHidden = true
        //---Start listening keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        //---
        
        customizeButton()
    }
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      //emailTextFieldCenterConstraint.constant = 0
//      UIView.animate(withDuration: 0.5) { [weak self] in
//        self?.view.layoutIfNeeded()
//      }
      
      //passwordTextFieldCenterConstraint.constant = 0
//      UIView.animate(withDuration: 0.5,
//                     delay: 0.3,
//                     options: [],
//                     animations: { [weak self] in
//                      self?.view.layoutIfNeeded()
//        }, completion: nil)
        
        loginButtonCenterConstraint.constant = 0
        createAccountButtonCenterConstraint.constant = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0.3,
                       options: [],
                       animations: { [weak self] in
                        self?.view.layoutIfNeeded()
          }, completion: nil)
        
        
//        UIView.animate(withDuration: 0.5,
//                       delay: 0.9,
//                       options: [],
//                       animations: { [weak self] in
//                        self?.view.layoutIfNeeded()
//            }, completion: nil)
        orLabel.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        //emailTextFieldCenterConstraint.constant -= view.bounds.width
        //passwordTextFieldCenterConstraint.constant -= view.bounds.width
        loginButtonCenterConstraint.constant -= view.bounds.width
        createAccountButtonCenterConstraint.constant += view.bounds.width
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        //shakeAnimation(button: loginButton)
    }
    
    
    @IBAction func createAccountButtonClicked(_ sender: Any) {
        //shakeAnimation(button: createAccountButton)
        createAccountUIChange()
        createAccountButtonTopConstraint.constant += view.bounds.height
        UIView.animate(withDuration: 2.5,
                   delay: 0.6,
                   options: [],
                   animations: { [weak self] in
                    self?.view.layoutIfNeeded()
        }, completion: nil)
        self.performSegue(withIdentifier: "createAccount", sender: self)
    }
    func customizeButton(){
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        loginButton.layer.masksToBounds = true
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setGradientBackground(colorOne: Colors.csBlue, colorTwo: Colors.csLightBlue)
        
        createAccountButton.layer.cornerRadius = loginButton.frame.size.height/2
        createAccountButton.layer.masksToBounds = true
        createAccountButton.setTitleColor(UIColor.white, for: .normal)
        createAccountButton.setGradientBackground(colorOne: Colors.csBlue, colorTwo: Colors.csLightBlue)
    }
    
    //---Handel Keyboard
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
        }else{
            view.frame.origin.y = 0
        }
    }
    //---
    
    func createAccountUIChange() {
        emailTextField.isHidden = true
        passwordTextField.isHidden = true
        orLabel.isHidden = true
        loginButton.isHidden = true
        
    }
    
    //--- Features
    func shakeAnimation(button: UIButton) {
        let key: String = "position"
        let shake           = CABasicAnimation(keyPath: key)
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint = CGPoint(x: button.center.x - 8, y: button.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: button.center.x + 8, y: button.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue   = toValue
        
        button.layer.add(shake, forKey: key)
    }
    //---
}

    
    
    


    


