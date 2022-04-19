//
//  HelpCell.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 19.04.2022.
//

import UIKit

class HelpCell: UICollectionViewCell {

    var help: Help? {
        didSet {
            guard let help = help else { return }

            categoryImage.image = UIImage(named: help.imageName)
            categoryLabel.text = help.headerText
        }
    }

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    let categoryImage: UIImageView = {
        let image = UIImage(named: "adult-image")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 234/255, green: 237/255, blue: 232/255, alpha: 1)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        addSubview(categoryImage)
        addSubview(categoryLabel)

        NSLayoutConstraint.activate([
            categoryImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 1/4 * self.bounds.width),
            categoryImage.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 2/3),
            //(equalToConstant: self.bounds.width - 80),
            categoryImage.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 3/5)
            //(equalToConstant: self.bounds.height - 80),
        ])

        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])


    }

}
