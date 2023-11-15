//
//  COBaseVC.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 21/11/22.
//

import UIKit

class COBaseVC: UIViewController {

    // MARK: - TO hide the keyboard when tap outside
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Instantiate Storyboard
extension UIViewController {

    class func instantiate(fromAppStoryboard appStoryboard: COStoryboard) -> Self {
        return appStoryboard.viewController(self)
    }

    class var storyboardID : String {
        return "\(self)"
    }
}

// MARK: - Life Cycle Functions
extension COBaseVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Setup functions
extension COBaseVC {
    @objc func initialSetup() {
        // Initial setup for the class, is called in view did load
    }

    func push(vc:COBaseVC,animated:Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func pop(animated:Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override var shouldAutorotate: Bool {
        false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
}
