//
//  MainAssembly.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class MainAssembly: Assembly, RoutableContainer {
  private(set) weak var router: MainRouter?
  
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
    
    self.router = router
    
    return viewController
  }
}
