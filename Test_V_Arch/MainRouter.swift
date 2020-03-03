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
  
  let detailsAssembly = DetailsAssembly()
  let solidAssembly = SolidAssembly()
  
  func routeToDetails(callbacks: DetailsCallbacks?) {
    let presentable = detailsAssembly.assemble(callbacks: callbacks)
    context.present(presentable: presentable, animated: true)
  }
  
  func routeToSolid() {
    let pr = solidAssembly.assemble(title: "Solid")
    context.push(presentable: pr, animated: true)
  }
}
