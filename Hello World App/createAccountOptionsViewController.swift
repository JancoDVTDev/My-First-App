//
//  createAccountOptionsViewController.swift
//  Hello World App
//
//  Created by Janco Erasmus on 2020/02/05.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class createAccountOptionsViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    
    @IBOutlet weak var appNameImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var facebookButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var googleButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailButtonTopConstraint: NSLayoutConstraint!
    
    //CenterContraints
    @IBOutlet weak var headerCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var facebookCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var googleCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customiseButtons()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alreadyHaveAccountButton.isHidden = true
        facebookButtonTopConstraint.constant = 50
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        googleButtonTopConstraint.constant = 20
            UIView.animate(withDuration: 0.5,
                            delay: 0.3,
                            options: [],
                            animations: { [weak self] in
                            self?.view.layoutIfNeeded()
            }, completion: nil)
        
        emailButtonTopConstraint.constant = 20
            UIView.animate(withDuration: 0.5,
                            delay: 0.6,
                            options: [],
                            animations: { [weak self] in
                            self?.view.layoutIfNeeded()
                }, completion: nil)
        
        alreadyHaveAccountButton.isHidden = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        //headerTopConstraint.constant += view.bounds.height
        facebookButtonTopConstraint.constant += view.bounds.height
        googleButtonTopConstraint.constant += view.bounds.height
        emailButtonTopConstraint.constant += view.bounds.height
    }
    
    func customiseButtons() {
        facebookButton.layer.cornerRadius = facebookButton.frame.size.height/2
        facebookButton.layer.masksToBounds = true
        facebookButton.setTitleColor(UIColor.white, for: .normal)
        facebookButton.backgroundColor = Colors.csFacebook
        
        googleButton.layer.cornerRadius = googleButton.frame.size.height/2
        googleButton.layer.masksToBounds = true
        googleButton.setTitleColor(UIColor.white, for: .normal)
        googleButton.backgroundColor = Colors.csGoogle
        
        emailButton.layer.cornerRadius = emailButton.frame.size.height/2
        emailButton.layer.masksToBounds = true
        emailButton.setTitleColor(UIColor.white, for: .normal)
        emailButton.backgroundColor = Colors.csBlack
    }
}
