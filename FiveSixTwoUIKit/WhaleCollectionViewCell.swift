//
//  WhaleCollectionViewCell.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 3/2/21.
//

import Foundation
import UIKit

class WhaleCollectionViewCell: UICollectionViewCell {

    var whaleView = WhaleView()
    var whale: WhaleProtocol?
    var whaleImage: UIImage?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(whaleView)

        whaleView.translatesAutoresizingMaskIntoConstraints = false


        let margins = contentView.layoutMarginsGuide
        whaleView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        whaleView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        whaleView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        whaleView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }

    public func setupCell(with whale: WhaleProtocol, whaleImage: UIImage) {
        self.whale = whale
        self.whaleImage = whaleImage
        self.whaleView.setupView(using: whale, whaleImage: whaleImage)
    }
}
