//
//  vistaWeb.swift
//  AutoRevista
//
//  Created by raul gonzalez de la aleja ruiz valdepeñas on 27/12/21.
//

import UIKit
import WebKit

final class vistaWeb: UIViewController, WKUIDelegate {
    
    
    // MARK: - Outlets
    
    @IBOutlet private var webView: WKWebView!
    @IBOutlet private var backButton: UIBarButtonItem!
    @IBOutlet private var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        // webView
        
       
       
    
        
        let webViewPrefs = WKPreferences()
         
            webViewPrefs.javaScriptCanOpenWindowsAutomatically = true
      
        
        let webConfiguration = WKWebViewConfiguration()
            webConfiguration.preferences = webViewPrefs
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        
            webView.uiDelegate = self
            view = webView
        
        
    
        
        let myURL = URL(string:"https://www.auto-revista.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
    }
    
  
    
    
    
    
    
    
    
    
    
    // MARK: - Actions
    @IBAction func backButton(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        webView.goForward()
    }
    
}









