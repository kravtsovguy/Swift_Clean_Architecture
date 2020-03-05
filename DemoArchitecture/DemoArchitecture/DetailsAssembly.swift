//
//  DetailsAssembly.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct DetailsCallbacks {
  let onAccept: (() -> Void)
  let onDecline: (() -> Void)
}

final class DetailsAssembly: Assembly {
  func assemble(callbacks: DetailsCallbacks?) -> DetailsViewController {
    let viewController = DetailsViewController()
    viewController.callbacks = callbacks
    
    return viewController
  }
}
