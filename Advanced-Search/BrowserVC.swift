//
//  BrowserVCViewController.swift
//  Advanced-Search
//
//  Created by Miguel Valdez on 5/19/16.
//  Copyright © 2016 MexPol. All rights reserved.
//

import UIKit
import WebKit

class BrowserVC: UIViewController {
    
    var mainSearchVC: MainSearchVC!
    @IBOutlet weak var container: UIView!
    var secondLink = ""
    var webView: WKWebView!
    
    
    //xib file creation
    convenience init(secondPartOfLink: String) {
        self.init(nibName: "BrowserVC", bundle: nil)
        secondLink = secondPartOfLink
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //webview
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webview
        webView = WKWebView()
        container.addSubview(webView)
        
        //left swipe to go back
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(BrowserVC.handleSwipes(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        //click outside to close keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BrowserVC.tap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame

        var urlStr = "https://www.google.com/#q=" + secondLink
        urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "+")
        urlStr = urlStr.stringByReplacingOccurrencesOfString("\"", withString: "")

        
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //if swiped left, goes back to main screen
    //swipe method
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        mainSearchVC = MainSearchVC(nibName: "MainSearchVC", bundle: nil)
        self.presentViewController(mainSearchVC, animated: true, completion: nil)
    }
    //tap method
    func tap(gesture: UITapGestureRecognizer) {
        self.resignFirstResponder()
    }

}
