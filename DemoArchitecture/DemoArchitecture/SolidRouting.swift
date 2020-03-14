//
//  SolidRouting.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 14.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

private let assembly = SolidAssembly()

protocol SolidRouting: AnyObject {
  var solidAssembly: SolidAssembly { get }
  
  func routeToSolid(title: String)
}

extension SolidRouting where Self: PresentableContainer {
  var solidAssembly: SolidAssembly { assembly }
  
  func routeToSolid(title: String) {
    let presentable = solidAssembly.assemble(title: title)
    self.presentable.push(presentable: presentable, animated: true)
  }
}
