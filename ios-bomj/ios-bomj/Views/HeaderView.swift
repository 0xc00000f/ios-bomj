//
//  HeaderView.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 20.04.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите категорию помощи"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 73/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)

        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

}
