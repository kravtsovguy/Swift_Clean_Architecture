//
//  MainAssembly.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class MainAssembly: Assembly {
  func assemble() -> MainViewController {
    let viewController = MainViewController()
    let router = MainRouter()
    let presenter = MainPresenter()
    let interactor = MainInteractor()
    
    router.context = viewController
    presenter.view = viewController
    interactor.router = router
    interactor.presenter = presenter
    viewController.interactor = interactor
    
    return viewController
  }
}
