//
//  DetailsRouting.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 14.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

private let assembly = DetailsAssembly()

protocol DetailsRouting: AnyObject {
  @discardableResult
  func routeToDetails(callbacks: DetailsCallbacks?) -> DetailsAssembly
}

extension DetailsRouting where Self: Router {
  @discardableResult
  func routeToDetails(callbacks: DetailsCallbacks?) -> DetailsAssembly {
    let presentable = assembly.assemble(callbacks: callbacks) { [unowned self] in
      self.presentable.dismissPresentable(animated: true)
    }
    self.presentable.present(presentable: presentable, animated: true)
    
    return assembly
  }
}
