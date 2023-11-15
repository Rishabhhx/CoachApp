//
//  COChooseRoleVC.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 23/11/22.
//

import UIKit

enum Role {
    case athlete
    case coach
}

class COChooseRoleVC: COBaseVC {
    
    // MARK: Outlets
    @IBOutlet weak var coachView: UIView!
    @IBOutlet weak var athleteView: UIView!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var coachTick: UIImageView!
    @IBOutlet weak var athleteTick: UIImageView!
    
    // MARK: Properties
    private var role : Role = .coach
    
    // MARK: Actions
    @IBAction func proceedButton(_ sender: Any) {
        
    }
    
    // MARK: Private Functions
    @objc private func athleteTap() {
        role = .athlete
        athleteTick.isHidden = false
        athleteView.backgroundColor = ColorAssest.yellow.colorAssest
        coachTick.isHidden = true
        coachView.backgroundColor = ColorAssest.greyBlack.colorAssest
        proceedButton.isEnabled = true
        proceedButton.applyGradient(colours: [ColorAssest.yellowGrad.colorAssest, ColorAssest.blackGrad.colorAssest])
        proceedButton.layer.masksToBounds = true
        proceedButton.layer.cornerRadius = 25
    }
    
    @objc private func coachTap() {
        role = .coach
        coachTick.isHidden = false
        coachView.backgroundColor = ColorAssest.yellow.colorAssest
        athleteTick.isHidden = true
        athleteView.backgroundColor = ColorAssest.greyBlack.colorAssest
        proceedButton.isUserInteractionEnabled = true
        proceedButton.applyGradient(colours: [ColorAssest.yellowGrad.colorAssest, ColorAssest.blackGrad.colorAssest])
        proceedButton.layer.masksToBounds = true
        proceedButton.layer.cornerRadius = 25
    }
    
    // MARK: Initial Setup
    override func initialSetup() {
        athleteView.layer.cornerRadius = athleteView.frame.height/2
        coachView.layer.cornerRadius = coachView.frame.height/2
        let athleteTap = UITapGestureRecognizer(target: self, action: #selector(athleteTap))
        athleteView.addGestureRecognizer(athleteTap)
        let coachTap = UITapGestureRecognizer(target: self, action: #selector(coachTap))
        coachView.addGestureRecognizer(coachTap)
        proceedButton.isUserInteractionEnabled = false
        proceedButton.layer.cornerRadius = 25
        proceedButton.backgroundColor = ColorAssest.greyishBrown.colorAssest
    }
}
