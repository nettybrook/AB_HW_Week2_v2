//
//  IntroViewController.swift
//  AB_HW_Week2_v2
//
//  Created by Annette Brookman on 5/24/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tileoneImageView: UIImageView!
    @IBOutlet weak var tiletwoImageView: UIImageView!
    @IBOutlet weak var tilethreeImageView: UIImageView!
    @IBOutlet weak var tilefourImageView: UIImageView!
    @IBOutlet weak var tilefiveImageView: UIImageView!
    @IBOutlet weak var tilesixImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        
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
