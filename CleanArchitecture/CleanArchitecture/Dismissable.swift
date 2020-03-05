//
//  Dismissable.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import class UIKit.UIViewController

public protocol Dismissable: Presentable {
  var onDismiss: ((_ presentable: Self, _ completion: (() -> Void)?) -> Void)? { get }
}

protocol CustomDismissable: Dismissable {
  var onDismiss: ((_ presentable: Self, _ completion: (() -> Void)?) -> Void)? { get set }
}

extension Dismissable where Self: UIViewController {
  public var onDismiss: ((_ presentable: Self, _ completion: (() -> Void)?) -> Void)? {
    return { presentable, completion in
      presentable.dismissPresentable(animated: true, completion: completion)
    }
  }
}

