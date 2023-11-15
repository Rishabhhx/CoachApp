//
//  COWelcomeScreenCC.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 21/11/22.
//

import UIKit

class COWelcomeScreenCC: UICollectionViewCell {

    @IBOutlet weak var pageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(text: String)
    {
        pageLabel.text = text
    }
}
