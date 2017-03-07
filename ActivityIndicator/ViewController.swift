//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit



 class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let transparentView = UIView()
    
    
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        ActivityIndicator.sharedInstance.loaderStarted(view: self.view)
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        
         activityIndicator.stopAnimating()
       
        }

}





