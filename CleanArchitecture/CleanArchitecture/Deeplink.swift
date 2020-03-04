//
//  Deeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

public protocol StepProtocol {
  associatedtype RouterType: Router
  init(router: RouterType?)
}

public protocol Deeplink {
  associatedtype CombinedStep: StepProtocol  
  typealias RouterType = CombinedStep.RouterType
  typealias InitialStepType = InitialStep<CombinedStep>
  
  func createInitialState(router: RouterType?) -> InitialStepType
  func run(router: RouterType?)
}

extension Deeplink {
  public func createInitialState(router: RouterType?) -> InitialStepType {
    InitialStepType(router: router)
  }
}

public struct EmptyStep: StepProtocol {
  public init(router: EmptyRouter?) {}
  
  public func finish() {
    PresentebleSettings.forceWithoutAnimation = false
  }
}

public struct InitialStep<StepType: StepProtocol>: StepProtocol {
  let router: StepType.RouterType?
  
  public init(router: StepType.RouterType?) {
    self.router = router
  }
  
  public func start() -> StepType {
    PresentebleSettings.forceWithoutAnimation = true
    return StepType(router: router)
  }
}

public struct Step<RouterType: Router, StepType: StepProtocol>: StepProtocol {
  let router: RouterType?
  
  public init(router: RouterType?) {
    self.router = router
  }
  
  public func step(routing: (_ router: RouterType) -> StepType.RouterType?) -> StepType {
    guard let router = router else { return StepType(router: nil) }
    let nextRouter = routing(router)
    return StepType(router: nextRouter)
  }
}
