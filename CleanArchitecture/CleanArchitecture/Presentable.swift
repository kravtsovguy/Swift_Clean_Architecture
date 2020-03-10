//
//  Presentable.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UINavigationController

public protocol Presentable: AnyObject {}

extension Presentable where Self: UIViewController {
  public func present(presentable: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
    present(presentable, animated: animated, completion: completion)
  }
  
  public func push(presentable: UIViewController, animated: Bool) {
    nc?.pushViewController(presentable, animated: animated)
  }
  
  public func show(presentable: UIViewController) {
    show(presentable, sender: self)
  }
  
  public func dismissPresentable(animated: Bool, completion: (() -> Void)? = nil) {
    let isPopped = nc?.popViewController(animated: animated) != nil
    
    if isPopped {
      completion?()
    } else {
      dismiss(animated: animated, completion: completion)
    }
  }
  
  private var nc: UINavigationController? {
    self as? UINavigationController ?? navigationController
  }
}
