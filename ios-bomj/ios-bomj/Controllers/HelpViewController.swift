//
//  HelpViewController.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 18.04.2022.
//

import UIKit

class HelpViewController: UICollectionViewController, UIGestureRecognizerDelegate {

    private let helpCellIdentifier = "cell"
    private let headerIdentifier = "header"

    private let help = [
        Help(headerText: "Дети", imageName: "child-image"),
        Help(headerText: "Взрослые", imageName: "adult-image"),
        Help(headerText: "Пожилые", imageName: "elderling-image"),
        Help(headerText: "Животные", imageName: "pets-image"),
        Help(headerText: "Мероприятия", imageName: "events-image")

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        collectionView.register(HelpCell.self, forCellWithReuseIdentifier: helpCellIdentifier)
        collectionView.isPagingEnabled = true

        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)

    }

    private func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 102/255, green: 166/255, blue: 54/255, alpha: 1)

        let titleAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = titleAttribute
        self.title = "Помочь"

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // настройка кнопки назад с кастомным поведением
        let backBTN = UIBarButtonItem(image: UIImage(named: "icon-back"),
                                      style: .plain,
                                      target: nil,
                                      action: nil)
        navigationItem.leftBarButtonItem = backBTN
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }

}

// MARK: - UICollectionViewDelegateFlowLayout realisation

extension HelpViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 27 - 1) / 2, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
    }
}

// MARK: - UICollectionViewDataSource realisation

extension HelpViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let helpCellNonCasted = collectionView.dequeueReusableCell(withReuseIdentifier: helpCellIdentifier, for: indexPath)
        guard let helpCell = helpCellNonCasted as? HelpCell else {
            return helpCellNonCasted
        }
        helpCell.help = help[indexPath.item]
        return helpCell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return help.count
    }
}
