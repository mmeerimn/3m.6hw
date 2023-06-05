//
//  SceneDelegate.swift
//  3m.6hw
//
//  Created by Meerim Mamatkadyrova on 5/6/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScence)
        
        let mainVC = MainViewController()
        
        let mainNC = UINavigationController(rootViewController: mainVC)
        
        let registerVC = RegisterViewController()
        
        let fgtPwdVC = FgtPwdViewController()
        
        window.rootViewController = mainNC
        
        self.window = window
        self.window?.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}
