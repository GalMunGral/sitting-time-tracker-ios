//
//  ViewController.swift
//  SittingTimeTracker
//
//  Created by Wenqi He on 1/13/19.
//  Copyright © 2019 Wenqi He. All rights reserved.
//

import UIKit
import WebKit
import CoreMotion

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {
    
  @IBOutlet weak var displayText: UITextField!
  var webView: WKWebView!

  override func viewDidLoad() {
    super.viewDidLoad()
    (UIApplication.shared.delegate as! AppDelegate).mainVC = self
  }
  
  @IBAction func viewHistory(_ sender: Any) {
    let preferences = WKPreferences()
    preferences.javaScriptEnabled = true
    let configuration = WKWebViewConfiguration()
    configuration.preferences = preferences
    webView = WKWebView(
      frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),
      configuration: configuration
    )
    view.addSubview(webView)
    webView.uiDelegate = self
    webView.navigationDelegate = self
    webView.scrollView.delegate = self
    webView.load(URLRequest(url: URL(string: "http://128.61.29.253:8080")!))
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print(error.localizedDescription)
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("Page loaded")
  }
  
  func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
    scrollView.pinchGestureRecognizer?.isEnabled = false
  }

}
