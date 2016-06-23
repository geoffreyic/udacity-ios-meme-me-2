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
    
    @IBOutlet weak var memeCollectionFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var memeList: [MemeModel] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeAndSpaceItems(self.view.frame.size)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    // sizing
    
    func sizeAndSpaceItems(size: CGSize){
        
        let itemsInRow:CGFloat = size.width > size.height ? 5.0 : 3.0
      
        let space: CGFloat = 6.0
        let itemDimension = (size.width - itemsInRow*space-space) / itemsInRow
        
        memeCollectionFlowLayout.sectionInset = UIEdgeInsetsMake(space, space, space, space)
        
        memeCollectionFlowLayout.minimumLineSpacing = space
        memeCollectionFlowLayout.minimumInteritemSpacing = space
        
        memeCollectionFlowLayout.itemSize = CGSizeMake(itemDimension, itemDimension)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        cell.collectionCellImage.image = memeList[indexPath.row].memeImage
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC: MemeDetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailController") as! MemeDetailViewController
        
        detailVC.meme = memeList[indexPath.row]
        
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
    
    // catch device rotations
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        // check if view hasn't been initialized yet. no need to do anything with
        if(collectionView == nil){
            return;
        }
        
        print(size)
        
        coordinator.animateAlongsideTransition(nil) { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.sizeAndSpaceItems(size)
            
        }
        
    }
}