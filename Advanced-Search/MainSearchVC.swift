//
//  ViewController.swift
//  Advanced-Search
//
//  Created by Miguel Valdez on 5/18/16.
//  Copyright © 2016 MexPol. All rights reserved.
//

import UIKit

class MainSearchVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var browserVC: BrowserVC!
    var tableVC: TableVC!
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    enum operators: Int {
        case filetype = 0
        case inurl = 1
        case site = 2
        case intext = 3
        case cache = 4 
        case inposauthor = 5
        case define = 6
        case stocks = 7
        case cover = 8
        case at = 9
        case minus = 10
        case plus = 11
        case price = 12
    }

//button pressing
    //most of the main ones
    @IBAction func preCursorButtonPressed(sender: DefaultButton!) {
        if sender.tag == operators.filetype.rawValue {
            searchBar.text = searchBar.text! + "filetype:"
        } else if sender.tag == operators.inurl.rawValue {
            searchBar.text = searchBar.text! + "inurl:"
        } else if sender.tag == operators.site.rawValue {
            searchBar.text = searchBar.text! + "site:"
        } else if sender.tag == operators.intext.rawValue {
            searchBar.text = searchBar.text! + "intext:"
        } else if sender.tag == operators.cache.rawValue {
            searchBar.text = searchBar.text! + "cache:"
        } else if sender.tag == operators.inposauthor.rawValue {
            searchBar.text = searchBar.text! + "inpostauthor:"
        } else if sender.tag == operators.define.rawValue {
            searchBar.text = searchBar.text! + "define:"
        } else if sender.tag == operators.stocks.rawValue {
            searchBar.text = searchBar.text! + "stocks:"
        } else if sender.tag == operators.minus.rawValue {
            searchBar.text = searchBar.text! + "-"
        } else if sender.tag == operators.plus.rawValue {
            searchBar.text = searchBar.text! + "+"
        } else if sender.tag == operators.at.rawValue {
            searchBar.text = searchBar.text! + "@"
        } else if sender.tag == operators.price.rawValue {
            searchBar.text = searchBar.text! + "$"
        }
        searchBar.becomeFirstResponder()
    }
    
    //only for "   " character
    @IBAction func coverButtonPressed(sender: DefaultButton!) {
        if sender.tag == operators.cover.rawValue {
            searchBar.text = "\"" + searchBar.text! + "\""
        }
    }
    
    //search button is pressed
    @IBAction func searchPressed(sender: UIButton) {
        browserVC = BrowserVC(secondPartOfLink: searchBar.text!)
        self.presentViewController(browserVC, animated: true, completion: nil)
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    //More Info button pressed
    @IBAction func moreInfoPressed(sender: MaterialButtonSettings) {
//        moreInfoVC = MoreInfoVC(nibName: "MoreInfoVC", bundle:  nil)
//        self.presentViewController(moreInfoVC, animated:true, completion: nil)
        tableVC = TableVC(nibName: "TableVC", bundle: nil)
        self.presentViewController(tableVC, animated:true, completion: nil)
        
        searchBar.resignFirstResponder()

    }

    //if return is pressed on keyboard - basically pressed search
    @IBAction func returnKeyboardPressed(sender: AnyObject) {
        searchPressed(searchButton)
    }
    
//swipe to move between pages +delete and tap to close keyboard methods
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func tap(gesture: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
    
    
    //xib init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

//initial methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //left and right swipes to delete text
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainSearchVC.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainSearchVC.handleSwipes(_:)))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        //click outside to close keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainSearchVC.tap(_:)))
        view.addGestureRecognizer(tapGesture)
        
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

