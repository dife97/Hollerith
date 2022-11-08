//
//  SceneDelegate.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let calculatorNavigationController = UINavigationController(rootViewController: CalculatorViewController())
        
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = calculatorNavigationController
        
        window?.makeKeyAndVisible()
    }
}
