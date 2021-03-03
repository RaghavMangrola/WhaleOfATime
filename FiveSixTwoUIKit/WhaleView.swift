//
//  WhaleView.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 3/2/21.
//

import Foundation
import UIKit

class WhaleView: UIView {
    let whaleImageView: UIImageView = UIImageView()
    let whaleLabel: UILabel = UILabel()
    let cardView = CardView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public func setupView(using whale: WhaleProtocol, whaleImage: UIImage) {
        self.whaleImageView.image = whaleImage
        self.whaleLabel.text = whale.name

        addSubview(cardView)
        addSubview(whaleImageView)
        addSubview(whaleLabel)

        cardView.translatesAutoresizingMaskIntoConstraints = false
        whaleImageView.translatesAutoresizingMaskIntoConstraints = false
        whaleLabel.translatesAutoresizingMaskIntoConstraints = false

        whaleImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8).isActive = true
        whaleImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        whaleImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        whaleImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.80).isActive = true

        whaleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        whaleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        whaleLabel.topAnchor.constraint(equalTo: whaleImageView.bottomAnchor).isActive = true
        whaleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        cardView.topAnchor.constraint(equalTo: whaleImageView.topAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: whaleImageView.bottomAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: whaleImageView.leadingAnchor).isActive = true
        cardView.trailingAnchor.constraint(equalTo: whaleImageView.trailingAnchor).isActive = true

        whaleLabel.textAlignment = .center
        whaleLabel.adjustsFontSizeToFitWidth = true

        whaleImageView.contentMode = .scaleAspectFit
    }
}
