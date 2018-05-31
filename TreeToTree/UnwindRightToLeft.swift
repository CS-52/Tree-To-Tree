//
//  UnwindRightToLeft.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/30/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

//NOT CURRENTLY IN USE

class UnwindRightToLeft: UIStoryboardSegue {
    override func perform() {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        //let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        //Trying to get nav bar to animate the same way
//        let nav = appDelegate.window!.rootViewController?.navigationController!.viewControllers.first as! UINavigationController
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        src.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
                //        nav.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)

                        
        },
                       completion: { finished in
                       src.dismiss(animated: false, completion: nil)
                        
                        
        }
        )
    }
}
