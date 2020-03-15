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
  @discardableResult
  func routeToSolid(title: String) -> SolidAssembly
}

extension SolidRouting where Self: Router {
  @discardableResult
  func routeToSolid(title: String) -> SolidAssembly {
    let presentable = assembly.assemble(title: title)
    self.presentable.push(presentable: presentable, animated: true)
    
    return assembly
  }
}
