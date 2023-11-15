//
//  ColourEnum.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 21/11/22.
//

import Foundation
import UIKit

enum ColorAssest : String , CaseIterable {
    case yellow
    case greyBlack
    case yellowGrad
    case blackGrad
    case greyishBrown
    var colorAssest : UIColor {
        UIColor(named: self.rawValue) ?? UIColor()
    }
}
