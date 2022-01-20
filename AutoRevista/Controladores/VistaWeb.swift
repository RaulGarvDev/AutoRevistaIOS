//
//  vistaWeb.swift
//  AutoRevista
//
//  Created by raul gonzalez de la aleja ruiz valdepeñas on 27/12/21.
//

import UIKit
import WebKit

final class VistaWeb: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    
    // MARK: - Outlets
    
    @IBOutlet private var webView: WKWebView!
    @IBOutlet private var backButton: UIBarButtonItem!
    @IBOutlet private var forwardButton: UIBarButtonItem!
    
    private var newWebviewPopupWindow: WKWebView?
    
    private var myURL: URL!
    private var myRequest: URLRequest!
    private var webViewPrefs: WKPreferences!
    private var webConfiguration: WKWebViewConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        // webView
        
       
       
    
            webViewPrefs = WKPreferences()
            webConfiguration = WKWebViewConfiguration()
        
         
            webViewPrefs.javaScriptCanOpenWindowsAutomatically = true
        
      
        
       
            webConfiguration.preferences = webViewPrefs
        
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        
            webView.uiDelegate = self
            view = webView
        
        
    
        
            myURL = URL(string:"https://www.auto-revista.com")
            myRequest = URLRequest(url: myURL!)
            webView.load(myRequest!)
        
        
    }
    
  
    
    // MARK: - Funciones
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            newWebviewPopupWindow = WKWebView(frame: view.bounds, configuration: configuration)
            newWebviewPopupWindow!.navigationDelegate = self
            newWebviewPopupWindow!.uiDelegate = self
            view.addSubview(newWebviewPopupWindow!)
            return newWebviewPopupWindow!
        }

        func webViewDidClose(_ webView: WKWebView) {
            webView.removeFromSuperview()
            newWebviewPopupWindow = nil
        }
    
    
    
   
    
    
    // MARK: - Actions
    @IBAction func backButton(_ sender: Any) {
        
        webView.goBack()
        newWebviewPopupWindow?.goBack()
    
    }
    
    @IBAction func forwardButton(_ sender: Any) {
    
          webView.goForward()
          newWebviewPopupWindow?.goForward()

    }
    
}









