//
//  TableViewController.swift
//  Advanced-Search
//
//  Created by Miguel Valdez on 5/19/16.
//  Copyright © 2016 MexPol. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mainSearchVC: MainSearchVC!
    @IBOutlet var tableView: UITableView!

    
    var objectArray: [String] = ["Ferrari", "BMW", "Mitsubishi", "Lambo"]
    
//    
//    var operData: [String: String] = ["filetype:":"Restrict the results to pages whose names end in suffix. FOR EXAMPLE web page evaluation checklist filetype:pdf will return Adobe Acrobat pdf files that match the terms web, page, evaluation, and checklist.", "inurl:":"Restrict the results to documents containing that word in the URL. For instance, inurl:print site:www.googleguide.com searches for pages on Google Guide in which the URL contains the word “print.” It finds pdf files that are in the directory or folder named print on the Google Guide website. ", "site:":"Restrict your search results to the site or domain you specify. FOR EXAMPLE  admissions site:www.lse.ac.uk will show admissions information from London School of Economics’ site and peace site:gov will find pages about peace within the .gov domain. You can specify a domain with or without a period, e.g., either as .gov or gov.", "intext:":"This operator searches only for sites where the given word(s) are in the text of the page.", "cache:":"The query cache:url will display Google’s cached version of a web page, instead of the current version of the page. FOR EXAMPLE cache:www.eff.org will show Google’s cached version of the Electronic Frontier Foundation home page. ", "inposauthor:":"Exclusive to blog search, this one picks out blog posts that are written by specific individuals. For instance, if you wanted sound advice on how to use Online PR and Social Media to improve your company’s ROI, you could try: ", "define:":"Shows definitions from pages on the web for the term that follows. This advanced search operator is useful for finding definitions of words, phrases, and acronyms. FOR EXAMPLE define: blog will show definitions for “Blog” (weB LOG).","@":"Find social tags Example: @agoogler ", "-":"When you use a dash before a word or site, it excludes sites with that info from your results. This is useful for words with multiple meanings, like Jaguar the car brand and jaguar the animal.Examples: jaguar speed -car or pandas -site:wikipedia.org", "$":"Find prices Example: nikon $400 "]
    
    // 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register custom cell
        let tableCell = UINib(nibName:"TableCell", bundle: nil)
        tableView.registerNib(tableCell, forCellReuseIdentifier: "cell")
        
        //left swipe to go back
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(TableVC.handleSwipes(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objectArray.count
    }
    
    
    // 3
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        let cell: TableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TableCell
        cell.operLbl.text = objectArray[indexPath.row]
        
        return cell
    }
    
    // 4
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
    // 5
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    //xib file creation
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //if swiped left, goes back to main screen
    //swipe method
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        mainSearchVC = MainSearchVC(nibName: "MainSearchVC", bundle: nil)
        self.presentViewController(mainSearchVC, animated: true, completion: nil)
    }
}