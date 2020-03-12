//
//  MainRouter.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class MainRouter: MainRouterProtocol {
  weak var presentable: MainViewController!
  
  let detailsAssembly = DetailsAssembly()
  let solidAssembly = SolidAssembly()
  
  func routeToDetails(callbacks: DetailsCallbacks?) {
    let presentable = detailsAssembly.assemble(callbacks: callbacks) { [unowned self] in
      self.presentable.dismissPresentable(animated: true)
    }
    self.presentable.present(presentable: presentable, animated: true)
  }
  
  func routeToSolid() {
    let presentable = solidAssembly.assemble(title: "Solid")
    self.presentable.push(presentable: presentable, animated: true)
  }
}
