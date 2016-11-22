//
//  ViewController.swift
//  ParseHtml
//
//  Created by Pj Nguyen on 11/10/16.
//  Copyright © 2016 Pj Nguyen. All rights reserved.
//

import UIKit
import Kanna
import Foundation

extension String {
    var removeExcessiveSpaces: [String] {
        let components = self.components(separatedBy: NSCharacterSet.whitespaces)
        let filtered = components.filter({!$0.isEmpty})
        return filtered
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "htmlCode", ofType: "html")!) as URL) as URLRequest)
        displayURL()
        

        }

    
    
    func displayURL() {
        var result:String
        
        if let doc = Kanna.HTML(url: (NSURL(string: "http://vietlott.vn")!) as URL, encoding: String.Encoding.utf8) {
            print("body.... \(doc.title!)");
        
            for show in doc.css("ul[class^='result-number']") {
                result = show.text!
                
                let formattedString = result.replacingOccurrences(of: "\r\n", with: "")

                let trimmedString = formattedString.trimmingCharacters(in: .whitespaces)
               
                let str = trimmedString.removeExcessiveSpaces
                
                
                let first = str[0] // First
                let second = str[1] // First

                print(first)
                print(second)
                print(str)
                
            }
          
            for h2 in doc.css("h2") {
                
                let result = h2.text!
                
                let formattedString = result.replacingOccurrences(of: "\r\n", with: "")
                
                let trimmedString = formattedString.trimmingCharacters(in: .whitespaces)
                
                if(trimmedString != ""){
                    print("wingng money.... \(trimmedString)")
                }
            }
                    }
    }
    
}



