//
//  Entry.swift
//  Advanced-Search
//
//  Created by Miguel Valdez on 5/19/16.
//  Copyright © 2016 MexPol. All rights reserved.
//

import Foundation

class Entry {
    private var _searchEntry: String!
    
    init(emptySearchEntry: String){
        self._searchEntry = emptySearchEntry
    }
    
    var searchEntry: String {
        get {
            return _searchEntry
        }
        
        set {
            _searchEntry = newValue
        }
    }
    
    func addButtonText(newText:String) {
        if (_searchEntry == "") {
            _searchEntry = newText
        }
        else {
            _searchEntry = (_searchEntry + " " + newText)
        }
    }
    
    func coverText() {
        if (_searchEntry == "") {
            _searchEntry = ""
        }
        else {
            _searchEntry = ("\"" + _searchEntry + "\"")
        }
    }
    
    func addCurrentString() {
        
    }
    
    //I think creating a model for this app overcomplicated the deal, so I decided not to use a model, maybe later?
}