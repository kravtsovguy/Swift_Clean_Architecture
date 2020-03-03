//
//  AppDelegate.swift
//  Test_V_Arch
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
//      self.modalDeeplink.run(router: self.mainAssembly.router)
      self.solidDeeplink.run(router: self.mainAssembly.router)
    }
    
    return true
  }
}

