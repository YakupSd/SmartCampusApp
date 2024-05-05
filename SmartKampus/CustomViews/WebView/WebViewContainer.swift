//
//  WebViewContainer.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI
import WebKit
enum UrlTypes{
    case web
    case file
}

struct WebViewContainer: UIViewRepresentable {
    let urlString: String
    var type : UrlTypes = .web
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if self.type == .web  {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                    DispatchQueue.main.async {
                        uiView.load(request)
                    }
            }
        }else{
            let url = URL(fileURLWithPath: urlString)
            DispatchQueue.main.async {
                uiView.load(URLRequest(url: url))
            }
        }
    
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewContainer
        
        
        init(_ parent: WebViewContainer) {
            self.parent = parent
            
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
                   if let url = navigationAction.request.url {
                       print("Redirected to: \(url)")
                       // URL yönlendirmesini ele alabilirsiniz
                       // Örneğin, belirli bir URL'e gitmeyi engelleyebilir veya özel işlemler gerçekleştirebilirsiniz
                   }
                   
                   decisionHandler(.allow)
          }
        
        func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
            if let url = webView.url?.absoluteString{
                print("url = \(url)")
            }
        }
        
    }
}
