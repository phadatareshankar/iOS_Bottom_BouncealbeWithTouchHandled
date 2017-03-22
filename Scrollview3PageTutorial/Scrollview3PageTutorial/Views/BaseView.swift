//
//  BaseView.swift
//  Scrollview3PageTutorial
//
//  Created by Phadatare, Shankar (Syntel) on 3/22/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

import UIKit

class BaseView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func hitTest(_ point: CGPoint, with e: UIEvent?) -> UIView? {

        // Find the touched view and compare with the expected view
        let touchedView = super.hitTest(point, with: e)
       
        if let expectedView = touchedView as? LoadingView {
            
            return expectedView
        }
        
        return nil
    }

}
