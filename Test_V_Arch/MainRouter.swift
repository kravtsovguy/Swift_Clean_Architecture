//
//  MainRouter.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class MainRouter: MainRouterProtocol {
  weak var context: MainViewController!
  
  func routeToDetails(callbacks: DetailsCallbacks) {
    let presentable = DetailsAssembly().assemble(callbacks: callbacks)
    context.present(presentable: presentable, animated: true)
    
//    presentable.onDismiss = { presentable, completion in
//      presentable.dismissPresentable(animated: true, completion: completion)
//    }
  }
}
