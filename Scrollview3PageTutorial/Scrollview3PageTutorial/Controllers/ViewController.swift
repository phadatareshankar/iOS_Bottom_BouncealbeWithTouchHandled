//
//  ViewController.swift
//  Scrollview3PageTutorial
//
//  Created by Phadatare, Shankar (Syntel) on 3/6/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

import UIKit

enum PageOrder {
    case Current, Previous, Next
}

class BaseScrollView: UIScrollView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let view = self.subviews[0];
        
        let subScrollview = view.subviews[0];
        
        let hitView = super.hitTest(point, with: event)
        
        if point.y>0 && point.y<subScrollview.frame.origin.y {
            return nil
        }
        
        return hitView
        
    }
    
}

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var streachableScrollView: UIScrollView!
    @IBOutlet weak var scrollView: UIScrollView!
    var cardViewCurrent = CardView()
    var cardViewNext = CardView()
    var cardViewPrevious = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize.init(width: self.view.frame.size.width*3, height: self.scrollView.frame.size.height);
        
        self.addPagesByOrder(pageOrder:.Previous)
        self.addPagesByOrder(pageOrder:.Current)
        self.addPagesByOrder(pageOrder:.Next)
        
        self.scrollView.scrollRectToVisible(CGRect.init(x: self.scrollView.frame.size.width, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height), animated: false)
        
        self.scrollView.layoutIfNeeded()
        
        //self.streachableScrollView.delegate = self
        self.streachableScrollView.contentSize = CGSize.init(width: self.view.frame.size.width, height: self.view.frame.size.height);
        
        self.streachableScrollView.layoutIfNeeded()
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        
        print("Clicked Button");
    }
    
    @IBAction func bottomButtonClicked(_ sender: Any) {
        
        print("Clicked Bottom Button");
        
    }
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        self.makeCardCenter()
    }
    
    func makeCardCenter() {
        let pageWidth = scrollView.frame.size.width
        let page : Int = Int(floor((scrollView.contentOffset.x - (pageWidth/2)) / pageWidth) + 1)
        
        if page == 0 {
            scrollView.contentOffset = CGPoint(x: pageWidth*(CGFloat(1)), y: 0)
        } else if page == 2 {
            scrollView.contentOffset = CGPoint(x: pageWidth, y: 0)
        }else if page == 1
        {
            scrollView.contentOffset = CGPoint(x: pageWidth, y: 0)
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        self.addPagesByOrder(pageOrder:.Previous)
        self.addPagesByOrder(pageOrder:.Current)
        self.addPagesByOrder(pageOrder:.Next)
        
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.scrollView.setContentOffset(CGPoint.init(x: self.scrollView.frame.width*2, y: 0), animated: false)
            
        }) { (Bool) in
            self.scrollView.scrollRectToVisible(CGRect.init(x: self.view.frame.size.width, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height), animated: false)
            self.makeCardCenter()
        }
        
    }
    
    @IBAction func previousButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        }) { (Bool) in
            
            self.scrollView.scrollRectToVisible(CGRect.init(x: self.view.frame.size.width, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height), animated: false)
            self.makeCardCenter()
        }
        
    }
    
    func addPagesByOrder(pageOrder: PageOrder) {
        
        
        switch pageOrder {
        case .Current:
            cardViewCurrent.view.frame = CGRect.init(x: self.scrollView.frame.size.width*1, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
            self.addCard(card: cardViewCurrent)
            
        case .Next:
            cardViewNext.view.frame = CGRect.init(x: self.scrollView.frame.size.width*2, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
            self.addCard(card: cardViewNext)
            
        case .Previous:
            cardViewPrevious.view.frame = CGRect.init(x: self.scrollView.frame.size.width*0, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
            self.addCard(card: cardViewPrevious)
            
        }
        
        self.scrollView.layoutIfNeeded()
    }
    
    

    
    
    func addCard(card: CardView) {
        
        self.scrollView.addSubview(card.view);
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

