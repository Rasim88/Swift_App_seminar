//
//  ViewController.swift
//  Homework_4_for_AppSwift
//
//  Created by Расим on 18.07.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        webView.frame = view.bounds
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51704299&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
    }

    private func setupViews(){
        view.addSubview(webView)
    }

    private func tap(){
        
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotoViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photo"
        
        let controllers = [tab1, tab2, tab3]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else{
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()){ result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}

