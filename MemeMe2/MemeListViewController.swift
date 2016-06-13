//
//  MemeListViewController.swift
//  MemeMe2
//
//  Created by Geoffrey Ching on 6/9/16.
//  Copyright © 2016 Geoffrey Ching. All rights reserved.
//

import Foundation
import UIKit

class MemeListViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var TableView: UITableView!
    
    var MemeList: [MemeModel] = []
    
    override func viewDidLoad() {
        //TableView.dataSource =
        //TableView.dataSource
        
        MemeList = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeListViewController", forIndexPath: indexPath) as! MemeTableViewCell
        
        cell.TableCellImage.image = MemeList[indexPath.row].image
        cell.TableCellTopText.text = MemeList[indexPath.row].topText
        cell.TableCellBottomText.text = MemeList[indexPath.row].bottomText
        
        return cell
    }
    
}