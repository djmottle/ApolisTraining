//
//  WebViewVC.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKNavigationDelegate {

    var url: URL?
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
}
