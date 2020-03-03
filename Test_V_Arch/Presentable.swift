//
//  Presentable.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

protocol Presentable: NSObjectProtocol {}

extension Presentable where Self: UIViewController {
  func present(presentable: UIViewController, animated: Bool) {
    present(presentable, animated: animated)
  }
  
  func push(presentable: UIViewController, animated: Bool) {
    let navigationController = (self as? UINavigationController) ?? self.navigationController
    
    navigationController?.pushViewController(presentable, animated: animated)
  }
  
  func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
    let navigationController = (self as? UINavigationController) ?? self.navigationController
    
    let popVC = navigationController?.popViewController(animated: animated)
    if popVC == nil {
      dismiss(animated: true, completion: completion)
    }
  }
}
