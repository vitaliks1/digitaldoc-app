//
//  CategoryTV.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class CategoryTV: UITableViewCell {
    
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var headerTableLbl: UILabel!
    
    var videoList = [LockUpResponse]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCV.remembersLastFocusedIndexPath = true
        categoryCV.delegate = self
        categoryCV.dataSource = self
        self.categoryCV.register(UINib(nibName:"CategoryResponseCV", bundle: nil), forCellWithReuseIdentifier: "CategoryResponseCV")
        categoryCV.isScrollEnabled = true
        categoryCV.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initiateColllection(videoItemResponse: [LockUpResponse])  {
        self.videoList = videoItemResponse
        DispatchQueue.main.async {
            self.categoryCV.reloadData()
        }
    }
}


extension CategoryTV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        return IndexPath(row: 0, section: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryResponseCV", for: indexPath) as! CategoryResponseCV
        cell.categoryTitle.text = videoList[indexPath.row].title
        cell.categoryImg.setImage(with: (videoList[indexPath.item].img?.attributes?.src)!)
        cell.categoryImg.backgroundColor = UIColor(patternImage: UIImage(named:"defaultImg")!)
        return cell
    }
    
}

extension CategoryTV: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.size.width))
        return CGSize(width: 400, height: 280)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 00.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -50.0, left: 00.0, bottom: 00.0, right: 00.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 125
    }
}





