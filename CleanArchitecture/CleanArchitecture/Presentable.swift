//
//  Presentable.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UINavigationController

enum PresentebleSettings {
  static var forceWithoutAnimation: Bool = false
}

extension PresentebleSettings {
  fileprivate static func shouldAnimate(animated: Bool) -> Bool {
    animated ? !PresentebleSettings.forceWithoutAnimation : false
  }
}

public protocol Presentable: AnyObject {}

extension Presentable where Self: UIViewController {
  public func present(presentable: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
    let animated = PresentebleSettings.shouldAnimate(animated: animated)
    present(presentable, animated: animated, completion: completion)
  }
  
  public func push(presentable: UIViewController, animated: Bool) {
    let animated = PresentebleSettings.shouldAnimate(animated: animated)
    nc?.pushViewController(presentable, animated: animated)
  }
  
  public func dismissPresentable(animated: Bool, completion: (() -> Void)? = nil) {
    let animated = PresentebleSettings.shouldAnimate(animated: animated)
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
