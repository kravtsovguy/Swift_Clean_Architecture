//
//  RouteActions.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit

protocol RouteActions: ShowActions, DismissActions {}

protocol Contextable: AnyObject {
  associatedtype ContextType
  var context: ContextType! { get }
}

protocol ShowActions: Contextable {
  typealias Presentable = UIViewController
  
  func present(_ presentable: Presentable, animated: Bool)
  func push(_ presentable: Presentable, animated: Bool)
}

protocol DismissActions: Contextable {
  func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension ShowActions where ContextType: UIViewController {
  func present(_ presentable: Presentable, animated: Bool) {
    context.present(presentable, animated: animated)
  }
  
  func push(_ presentable: Presentable, animated: Bool) {
    let navigationController = (context as? UINavigationController) ?? context.navigationController
    
    navigationController?.pushViewController(presentable, animated: animated)
  }
}

extension DismissActions where ContextType: UIViewController  {
  func dismiss(animated: Bool, completion: (() -> Void)?) {
    context.dismiss(animated: true, completion: completion)
  }
}
