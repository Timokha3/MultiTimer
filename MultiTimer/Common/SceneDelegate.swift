//
//  SceneDelegate.swift
//  MultiTimer
//
//  Created by Timur on 01.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let rootNavigationController = UINavigationController()
        rootNavigationController.navigationBar.isTranslucent = true
        
        let multiTimers = MultiTimersTableViewController()
        multiTimers.multiTimersViewModel = MultiTimersViewModel()
        rootNavigationController.viewControllers.append(multiTimers)
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = rootNavigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

