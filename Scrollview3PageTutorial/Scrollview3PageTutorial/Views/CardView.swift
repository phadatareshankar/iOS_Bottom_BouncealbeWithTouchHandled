//
//  CardView.swift
//  Scrollview3PageTutorial
//
//  Created by Phadatare, Shankar (Syntel) on 3/6/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

import UIKit

class CardView: UIViewController {

    @IBOutlet weak var labelAddress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.labelAddress.alpha = 0;
        
//        UIView.animate(withDuration: 1.5, delay: 0.5, options: .autoreverse | .repeat, animations: { 
//            
//        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//        [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
//            self.labelAddress.alpha = 1;
//            } completion:nil];
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
