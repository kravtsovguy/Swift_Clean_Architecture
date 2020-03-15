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
  var detailsAssembly: DetailsAssembly { get }
  
  func routeToDetails(callbacks: DetailsCallbacks?)
}

extension DetailsRouting where Self: Router {
  var detailsAssembly: DetailsAssembly { assembly }
  
  func routeToDetails(callbacks: DetailsCallbacks?) {
    let presentable = detailsAssembly.assemble(callbacks: callbacks) { [unowned self] in
      self.presentable.dismissPresentable(animated: true)
    }
    self.presentable.present(presentable: presentable, animated: true)
  }
}
