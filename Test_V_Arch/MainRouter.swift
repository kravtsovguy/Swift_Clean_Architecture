//
//  MainRouter.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class MainRouter: MainRouterProtocol, ShowActions {
  weak var context: MainViewController!
  
  func routeToDetails(callbacks: DetailsCallbacks) {
    let presentable = DetailsAssembly().assemble(callbacks: callbacks)
    present(presentable, animated: true)
  }
}
