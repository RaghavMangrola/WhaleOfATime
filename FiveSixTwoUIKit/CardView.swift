//
//  CardView.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 3/2/21.
//

import Foundation
import UIKit

class CardView: UIView {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = 5
        self.backgroundColor = .white
    }

    
}
