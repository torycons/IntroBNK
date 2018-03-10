//
//  ViewController.swift
//  IntroBNK
//
//  Created by Thanapat Sorralump on 2/3/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let mainItems = [
    Main(mainImage: "News"),
    Main(mainImage: "Members"),
    Main(mainImage: "MV")
  ]
  let mainCellIdentifier = "CellID"
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpNavigation()
    setupConllectionView()
    
  }
  
  private func setupConllectionView() {
    collectionView?.backgroundColor = .white
    collectionView?.register(MainCell.self, forCellWithReuseIdentifier: mainCellIdentifier)
  }
  
  private func setUpNavigation() {
    navigationItem.title = "BNK48"
  }
  
}

extension MainVC {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      let layout = UICollectionViewFlowLayout()
      let newsController = NewsVC(collectionViewLayout: layout)
      layout.minimumLineSpacing = 27
      navigationController?.pushViewController(newsController, animated: true)
    case 1:
      let layout = UICollectionViewFlowLayout()
      let membersController = MembersVC(collectionViewLayout: layout)
      layout.minimumLineSpacing = 27
      navigationController?.pushViewController(membersController, animated: true)
    case 2:
      let layout = UICollectionViewFlowLayout()
      let mvController = MVVC(collectionViewLayout: layout)
      layout.minimumLineSpacing = 24
      navigationController?.pushViewController(mvController, animated: true)
    default:
      let aleart = UIAlertController(title: "Error!!", message: "Please try again", preferredStyle: .alert)
      aleart.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(aleart, animated: true, completion: nil)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width-40, height: (view.frame.width-40)/2.105)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 28, left: 20, bottom: 0, right: 20)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mainItems.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCellIdentifier, for: indexPath) as? MainCell else { return UICollectionViewCell() }
    
    let mainItem = mainItems[indexPath.item]
    cell.mainData = mainItem
    
    return cell
  }
  
}
