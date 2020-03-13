//
//  SlideUpMenu.swift
//  DeleteCustomCollection
//
//  Created by Hxtreme on 12/03/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit

class SlideUpMenu: NSObject {
    
    var homeController:ViewController?
    var BlackView=UIView()
    
    var collectionView:UICollectionView{
        let flowLayout=UICollectionViewFlowLayout()
        let cv=UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor=UIColor.red
        return cv
    }
    
    
    
    func showMenu(){
        
        if let views=UIApplication.shared.keyWindow
        {
            
            self.BlackView.backgroundColor=UIColor(white:  0, alpha: 0.5)
            
            //To remove BlackView When user Tap on BlackView
            self.BlackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "blackViewTapped"))
            views.addSubview(BlackView)
            
            views.addSubview(collectionView)
            
            
            let height:CGFloat=200
            let y=views.frame.height-height
            
            collectionView.frame=CGRect(x: 0, y: views.frame.height, width: views.frame.width, height: height)
            self.BlackView.frame=views.frame

            //Initially Hidden using alpha o
            self.BlackView.alpha=0
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.BlackView.alpha=1
                self.collectionView.frame=CGRect(x: 0, y: y, width: views.frame.width, height: height)
                
                
            }, completion: {(completed:Bool) in
                
                //Show other controller using method showDummyViewController which is available in homecontroller
                self.homeController?.showDummyViewController()
            })
            
        }
    }
    @objc private func blackViewTapped(){
        print("Called")
        UIView.animate(withDuration: 0.4) {
            self.BlackView.alpha=0
            let height:CGFloat=200

            if let views=UIApplication.shared.keyWindow
            {
                self.collectionView.frame=CGRect(x: 0, y: views.frame.height, width: views.frame.width, height: height)
                
            }
            
        }
        
        
    }
    
}
