//
//  HelpViewController.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 18.04.2022.
//

import UIKit

class HelpViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {

    private let helpCellIdentifier = "cell"

    private let help = [
        Help(headerText: "Дети", imageName: "child-image"),
        Help(headerText: "Взрослые", imageName: "adult-image"),
        Help(headerText: "Пожилые", imageName: "elderling-image"),
        Help(headerText: "Животные", imageName: "pets-image"),
        Help(headerText: "Мероприятия", imageName: "events-image"),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        collectionView.register(HelpCell.self, forCellWithReuseIdentifier: helpCellIdentifier)
        collectionView.isPagingEnabled = true

        

    }

    private func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 102/255, green: 166/255, blue: 54/255, alpha: 1)


        let titleAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white,
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

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let helpCell = collectionView.dequeueReusableCell(withReuseIdentifier: helpCellIdentifier, for: indexPath) as! HelpCell
        helpCell.help = help[indexPath.item]
        return helpCell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return help.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width / 2 - 9, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }


}
