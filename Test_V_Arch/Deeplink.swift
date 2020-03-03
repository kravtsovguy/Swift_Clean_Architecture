//
//  Deeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol StepProtocol: AnyObject {
  associatedtype RouterType: Router
  init(router: RouterType?)
}

protocol Deeplink: AnyObject {
  associatedtype InitialRouter: Router
  
  func run(router: InitialRouter?)
}

final class EmptyRouter: Router {}

final class EmptyStep: StepProtocol {
  init(router: EmptyRouter?) {}
}

final class Step<RouterType: Router, StepType: StepProtocol>: StepProtocol {
  let router: RouterType?
  
  init(router: RouterType?) {
    self.router = router
  }
  
  @discardableResult
  func step(routing: (_ router: RouterType) -> StepType) -> StepType {
    guard let router = router else { return StepType(router: nil) }
    return routing(router)
  }
}
