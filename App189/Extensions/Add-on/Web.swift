//
//  Web.swift
//  App189
//
//  Created by Вячеслав on 9/20/23.
//

import SwiftUI
import FirebaseRemoteConfig
import WebKit

struct WebSystem: View {
    
    @State var response: URL = URL(string: "https://")!

    var body: some View {

        ZStack{

            Color("bg")
                .ignoresSafeArea()

            if !response.absoluteString.isEmpty {
                
                WebViewRepresentable(urlString: response.absoluteString)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {

            getFirebaseData(field: "url_link", dataType: .url) { result in
                
                let result = result as? URL ?? URL(string: "nil")!
                
                response = result
            }
        }
    }
}

struct WebPresenter: UIViewRepresentable {

    var link: URL?

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {

        guard let link = link else {

            return
        }

        webView.frame.size.height = 1
        webView.frame.size = webView.sizeThatFits(CGSize.zero)
        webView.load(URLRequest(url: link))
    }
}

func getFirebaseData(field: String, dataType: DataType, completion: @escaping (Any) -> Void) {

    let config = RemoteConfig.remoteConfig()

    config.configSettings.minimumFetchInterval = 300
    config.fetchAndActivate{ _, _ in
        
        if dataType == .bool {
            
            completion(config.configValue(forKey: field).boolValue)
            
        } else if dataType == .url {
            
            guard let url_string = config.configValue(forKey: field).stringValue, let url = URL(string: url_string) else {

                return
            }
            
            completion(url)
        }
    }
}

enum DataType: CaseIterable {
    
    case bool, url
}

struct WebViewRepresentable: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.customUserAgent = "Mozilla/5.0 (Linux; Android 11; AOSP on x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.105 Mobile Safari/537.36"
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = context.coordinator // Устанавливаем координатор для обработки событий навигации

        // Загружаем cookies при первой загрузке
        if let cookieData = UserDefaults.standard.data(forKey: "SavedCookies"),
           let cookies = NSKeyedUnarchiver.unarchiveObject(with: cookieData) as? [HTTPCookie] {
            for cookie in cookies {
                HTTPCookieStorage.shared.setCookie(cookie)
            }
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewRepresentable

        init(_ parent: WebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }

            // Здесь вы можете обрабатывать cookies, если это необходимо

            decisionHandler(.allow)
        }
    }
}
