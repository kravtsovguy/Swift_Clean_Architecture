//
//  Presentable.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

enum PresentebleSettings {
  static var forceWithoutAnimation: Bool = false
}

protocol Presentable: NSObjectProtocol {}

extension Presentable where Self: UIViewController {
  func present(presentable: UIViewController, animated: Bool) {
    let animated = animated ? !PresentebleSettings.forceWithoutAnimation : false
    present(presentable, animated: animated)
  }
  
  func push(presentable: UIViewController, animated: Bool) {
    let navigationController = (self as? UINavigationController) ?? self.navigationController
    
    let animated = animated ? !PresentebleSettings.forceWithoutAnimation : false
    navigationController?.pushViewController(presentable, animated: animated)
  }
  
  func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
    let navigationController = (self as? UINavigationController) ?? self.navigationController
    
    let animated = animated ? !PresentebleSettings.forceWithoutAnimation : false
    let popVC = navigationController?.popViewController(animated: animated)
    if popVC == nil {
      dismiss(animated: true, completion: completion)
    }
  }
}
