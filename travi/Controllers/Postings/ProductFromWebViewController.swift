//
//  ProductFromWebViewController.swift
//  travi
//
//  Created by Administrador on 14/05/18.
//

import UIKit
import WebKit

class ProductFromWebViewController: UIViewController,WKNavigationDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        // 1
        let url = URL(string: "https://www.ebay.com")!
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if let text = webView.url?.absoluteString{
            print(text)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        
    }
    


}
