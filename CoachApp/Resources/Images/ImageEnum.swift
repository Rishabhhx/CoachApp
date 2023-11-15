//
//  ImageEnum.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 21/11/22.
//

import Foundation
import UIKit
enum ImageAssest : String , CaseIterable {
    case overviewInactive
    case setupBioInactive

    var imageAssest : UIImage? {
        UIImage(named: self.rawValue) ?? UIImage()
    }
}
