//
//  Dismissable.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

protocol Dismissable: AnyObject {
  func dismiss(animated: Bool)
//  var onDismiss: (() -> Void) { get set }
}

extension Dismissable where Self: UIViewController {
  var onDismiss: (() -> Void) {
    dismiss(animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
  }
}
