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
  let solidDeeplink = Deeplink()
  
//  override init() {
////    solidDeeplink = Deeplink(initialStep: MainStep(assembly: mainAssembly))
//    super.init()
//  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    window?.rootViewController = UINavigationController(rootViewController: mainAssembly.assemble())
    window?.makeKeyAndVisible()
    
    solidDeeplink.run(assembly: mainAssembly)
    
    return true
  }
}

