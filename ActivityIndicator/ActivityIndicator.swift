//
//  ActivityIndicator.swift
//  ActivityIndicator
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import  UIKit

 class ActivityIndicator {
    
     static let sharedInstance : ActivityIndicator = ActivityIndicator()
    
     private init(){ }
    
     var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
     let transparentView = UIView()
    
     var isLoading = false
    
    // FUNCTION TO BE CALLED WHEN THE LOADER IS STARTED
    
    func loaderStarted(view : Any){
        
        if isLoading == false{
        
    isLoading = true
    activityIndicator.center =  (view as AnyObject).center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
    (view as AnyObject).addSubview(activityIndicator)
        
    activityIndicator.startAnimating()
        
    transparentView.frame = CGRect(x: 0, y: 0, width: (view as AnyObject).frame.size.width, height: (view as AnyObject).frame.size.height)
        
    (view as AnyObject).addSubview(transparentView)

    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(stopLoader), userInfo: nil, repeats: false)
        }
        
        else{
            return
        }
    }
    
    // FUNCTION TO BE CALLED WHEN THE LOADER STOPS
    
    @objc func stopLoader()
    {
        
        if isLoading == true{
            
        activityIndicator.stopAnimating()
        self.transparentView.removeFromSuperview()
        isLoading = false
            
        }
            
        else{
            return
        }
    }
    
    
}
