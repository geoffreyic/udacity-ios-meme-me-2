//
//  MemeDetailViewController.swift
//  MemeMe2
//
//  Created by Geoffrey_Ching on 6/21/16.
//  Copyright © 2016 Geoffrey Ching. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeImage: UIImageView!
    
    var meme: MemeModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        memeImage.image = meme.memeImage
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
