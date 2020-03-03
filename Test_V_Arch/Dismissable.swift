//
//  Dismissable.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

protocol Dismissable: Presentable {
  var onDismiss: ((_ presentable: Self, _ completion: (() -> Void)?) -> Void)? { get set }
}

extension Dismissable where Self: UIViewController {
  var onDismiss: ((_ presentable: Self, _ completion: (() -> Void)?) -> Void)? {
    return { presentable, completion in
      presentable.dismissPresentable(animated: true, completion: completion)
    }
  }
}

