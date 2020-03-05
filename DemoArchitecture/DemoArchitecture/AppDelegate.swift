//
//  AppDelegate.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  let mainAssembly = MainAssembly()
  let solidDeeplink = PushDeeplink()
  let modalDeeplink = ModalDeeplink()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    window?.rootViewController = UINavigationController(rootViewController: mainAssembly.assemble())
    window?.makeKeyAndVisible()
    
    DispatchQueue.main.async {
//      self.modalDeeplink.run(container: self.mainAssembly)
//      self.solidDeeplink.run(container: self.mainAssembly)
    }
    
    return true
  }
}

