//
//  SoloidAssembly.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class SolidAssembly: Assembly {
  private(set) weak var router: SolidRouter?

  func assemble(title: String) -> SolidViewController {
    let viewController = SolidViewController()
    let interactor = SolidInteractor(title: title)
    let router = SolidRouter()
    
    interactor.router = router
    interactor.view = viewController
    router.context  = viewController
    viewController.interactor = interactor
    
    interactor.activate()
    
    self.router = router
    
    return viewController
  }
}