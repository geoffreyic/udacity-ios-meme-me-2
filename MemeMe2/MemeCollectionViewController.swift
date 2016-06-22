//
//  MemeCollectionViewController.swift
//  MemeMe2
//
//  Created by Geoffrey Ching on 6/9/16.
//  Copyright © 2016 Geoffrey Ching. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var MemeCollectionFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var MemeList: [MemeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMemeList()
        
        sizeAndSpaceItems(self.view.frame.size)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        updateMemeList()
        CollectionView.reloadData()
    }
    
    // sizing
    
    func sizeAndSpaceItems(size: CGSize){
        
        var itemsInRow: CGFloat
        
        if(size.width > size.height){
            itemsInRow = 5.0
        }else{
            itemsInRow = 3.0
        }
        
        let space: CGFloat = 6.0
        let itemDimension = (size.width - itemsInRow*space-space) / itemsInRow
        
        MemeCollectionFlowLayout.sectionInset = UIEdgeInsetsMake(space, space, space, space)
        
        MemeCollectionFlowLayout.minimumLineSpacing = space
        MemeCollectionFlowLayout.minimumInteritemSpacing = space
        
        MemeCollectionFlowLayout.itemSize = CGSizeMake(itemDimension, itemDimension)
    }
    
    
    // Meme List logic
    
    func updateMemeList(){
        MemeList = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MemeList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        cell.CollectionCellImage.image = MemeList[indexPath.row].memeImage
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC: MemeDetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailController") as! MemeDetailViewController
        
        detailVC.Meme = MemeList[indexPath.row]
        
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
    
    // catch device rotations
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        print(size)
        
        coordinator.animateAlongsideTransition(nil) { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.sizeAndSpaceItems(size)
            
        }
        
    }
}