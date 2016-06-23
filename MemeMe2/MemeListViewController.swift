//
//  MemeListViewController.swift
//  MemeMe2
//
//  Created by Geoffrey Ching on 6/9/16.
//  Copyright © 2016 Geoffrey Ching. All rights reserved.
//

import Foundation
import UIKit

class MemeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editCancelButton: UIBarButtonItem!
    
    var isEditingTable: Bool = false;
    
    var memeList: [MemeModel] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    @IBAction func EditCancelButtonPressed(sender: AnyObject) {
        if(!isEditingTable){
            beginEditing()
        }else{
            endEditing()
        }
    }
    
    
    
    // Editing functions
    
    func beginEditing(){
        isEditingTable = true
        
        editCancelButton.title = "Cancel"
        
        tableView.editing = true
        
    }
    
    func endEditing(){
        isEditingTable = false
        
        editCancelButton.title = "Edit"
        
        tableView.editing = false
        
    }
    
    func deleteItem(index: Int){
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(index)
    }
    
    
    
    // Table Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        
        cell.tableCellImage.image = memeList[indexPath.row].memeImage
        cell.tableCellText.text = memeList[indexPath.row].topText + "..." + memeList[indexPath.row].bottomText
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        deleteItem(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC: MemeDetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailController") as! MemeDetailViewController

        detailVC.meme = memeList[indexPath.row]
        
        self.navigationController!.pushViewController(detailVC, animated: true)
    
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if self.tableView.editing {
            return .Delete
        }
        return .None
    }
    
}