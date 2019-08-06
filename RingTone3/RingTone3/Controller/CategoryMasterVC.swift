//
//  CategoryMasterVC.swift
//  RingTone3
//
//  Created by Cuong on 7/26/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class CategoryMasterVC: UICollectionViewController {
    
    var displayGenres = [String]()
    
    var totalRingTones: [RingToneModel]?
    
    var tempRingTones: [RingToneModel] = []
    
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    let numberOfItems: CGFloat = 3
    let padding: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setDataFromAPI()
    }
    
    func setDataFromAPI() {
        DataService.sharedInstance.getRingTone(completedHandle: { data in
            self.totalRingTones = data
            
            for i in 0..<self.totalRingTones!.count {
                if self.displayGenres.contains(self.totalRingTones![i].genre) == false {
                    self.displayGenres.append(self.totalRingTones![i].genre)
                }
            }
            
            self.collectionView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tempRingTones.removeAll()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if totalRingTones?.count == nil {
            return 0
        } else {
            return displayGenres.count
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryMasterCollectionViewCell
        
        cell?.gennerLabel.text = displayGenres[indexPath.row]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell!)
        if let destination = segue.destination as? DetailCategoryVC {
            
            for i in 0..<totalRingTones!.count {
                if displayGenres[indexPath!.row] == totalRingTones![i].genre {
                    self.tempRingTones.append(totalRingTones![i])
                }
            }
            destination.receivedRingTones = tempRingTones
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension CategoryMasterVC: UICollectionViewDelegateFlowLayout {
    // Size of Item
    
    //set before
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (WIDTH_SCREEN - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        return CGSize(width: itemSize, height: itemSize)
    }
    
    // Spacing Between Each Edge Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
    }
    
    // Spacing Between Rows Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    //    Spacing Between Colums Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
