//
//  DetailsAssembly.swift
//  DemoArchitecture
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
  func assemble(callbacks: DetailsCallbacks?, onDismiss: @escaping () -> Void) -> DetailsViewController {
    let viewController = DetailsViewController()
    viewController.callbacks = callbacks
    viewController.onDismiss = onDismiss
    
    return viewController
  }
}
