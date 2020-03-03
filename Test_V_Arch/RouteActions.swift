//
//  RouteActions.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit

protocol RouteActions: AnyObject {
  associatedtype ContextType
  
  var context: ContextType! { get }
  
  func present(_ presentable: Presentable, animated: Bool)
  func push(_ presentable: Presentable, animated: Bool)
}

extension RouteActions where ContextType: UIViewController  {
  func present(_ presentable: Presentable, animated: Bool) {
    guard let vc = presentable as? UIViewController else { return }
    context.present(vc, animated: animated)
  }
  
  func push(_ presentable: Presentable, animated: Bool) {
    guard let vc = presentable as? UIViewController else { return }
    let navigationController = (context as? UINavigationController) ?? context.navigationController
    
    navigationController?.pushViewController(vc, animated: animated)
  }
}
