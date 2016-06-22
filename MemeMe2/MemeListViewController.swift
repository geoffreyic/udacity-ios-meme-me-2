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
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var EditCancelButton: UIBarButtonItem!
    
    var IsEditing: Bool = false;
    var MemeList: [MemeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMemeList()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        updateMemeList()
        TableView.reloadData()
    }
    
    
    @IBAction func EditCancelButtonPressed(sender: AnyObject) {
        if(!IsEditing){
            beginEditing()
        }else{
            endEditing()
        }
    }
    
    
    // Meme List logic
    
    func updateMemeList(){
        MemeList = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    
    // Editing functions
    
    func beginEditing(){
        IsEditing = true
        
        EditCancelButton.title = "Cancel"
        
        TableView.editing = true
        
    }
    
    func endEditing(){
        IsEditing = false
        
        EditCancelButton.title = "Edit"
        
        TableView.editing = false
        
    }
    
    func deleteItem(index: Int){
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(index)
        
        updateMemeList()
    }
    
    
    
    // Table Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        
        cell.TableCellImage.image = MemeList[indexPath.row].memeImage
        cell.TableCellText.text = MemeList[indexPath.row].topText + "..." + MemeList[indexPath.row].bottomText
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        deleteItem(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC: MemeDetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailController") as! MemeDetailViewController

        detailVC.Meme = MemeList[indexPath.row]
        
        self.navigationController!.pushViewController(detailVC, animated: true)
    
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if self.TableView.editing {
            return .Delete
        }
        return .None
    }
    
}