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
    
    let container: UIView = UIView()
    
     var isLoading = false
    
    // FUNCTION TO BE CALLED WHEN THE LOADER IS STARTED
    
    func loaderStarted(view : Any){
        
       if isLoading == false{
        
    isLoading = true
        
    container.frame = (view as AnyObject).frame
    container.center = (view as AnyObject).center
    container.backgroundColor = UIColor.clear
        
    let loadingView: UIView = UIView()
    loadingView.frame = CGRect( x: 0, y : 0, width : 80, height : 80)
    loadingView.center = (view as AnyObject).center
    loadingView.backgroundColor = UIColor.randomColor()
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10

    activityIndicator.frame = CGRect( x : 0.0, y : 0.0, width : 40.0, height : 40.0)
    activityIndicator.hidesWhenStopped = true
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
    activityIndicator.color = UIColor.randomColor()
    activityIndicator.center =  CGPoint( x : loadingView.frame.size.width / 2,
                                             y : loadingView.frame.size.height / 2)

    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    (view as AnyObject).addSubview(container)
        
    activityIndicator.startAnimating()
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
        //self.transparentView.removeFromSuperview()
         self.container.removeFromSuperview()
        isLoading = false
            
        }
            
        else{
            return
        }
    }
}
