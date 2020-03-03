//
//  MainRouter.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

final class MainRouter: MainRouterProtocol, RouteActions {
  weak var context: MainViewController!
  
  func routeToDetails(callbacks: DetailsCallbacks) {
    let presenter = DetailsAssembly().assemble(callbacks: callbacks)
    presenter.onDismiss = { [weak presenter] in
      
    }
    present(presenter, animated: true)
  }
}
