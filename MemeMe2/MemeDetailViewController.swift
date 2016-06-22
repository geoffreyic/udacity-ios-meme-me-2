//
//  MemeDetailViewController.swift
//  MemeMe2
//
//  Created by Geoffrey_Ching on 6/21/16.
//  Copyright © 2016 Geoffrey Ching. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var MemeImage: UIImageView!
    
    var Meme: MemeModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        MemeImage.image = Meme.memeImage
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelAction(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
