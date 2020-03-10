//
//  SolidRouter.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class SolidRouter: SolidRouterProtocol {
  weak var presentable: SolidViewController!
  
  let solidAssembly = SolidAssembly()
  
  func routeToSolid(title: String) {
    let pr = solidAssembly.assemble(title: title)
    presentable.push(presentable: pr, animated: true)
  }
}
