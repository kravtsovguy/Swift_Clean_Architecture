//
//  Deeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol StepProtocol {
  associatedtype RouterType: Router
  init(router: RouterType?)
}

protocol Deeplink {
  associatedtype CombinedStep: StepProtocol  
  typealias RouterType = CombinedStep.RouterType
  typealias InitialStepType = InitialStep<CombinedStep>
  
  func createInitialState(router: RouterType?) -> InitialStepType
  func run(router: RouterType?)
}

extension Deeplink {
  func createInitialState(router: RouterType?) -> InitialStepType {
    InitialStepType(router: router)
  }
}

struct EmptyStep: StepProtocol {
  init(router: EmptyRouter?) {}
  
  func finish() {
    PresentebleSettings.forceWithoutAnimation = false
  }
}

struct InitialStep<StepType: StepProtocol>: StepProtocol {
  let router: StepType.RouterType?
  
  func start() -> StepType {
    PresentebleSettings.forceWithoutAnimation = true
    return StepType(router: router)
  }
}

struct Step<RouterType: Router, StepType: StepProtocol>: StepProtocol {
  let router: RouterType?
  
  func step(routing: (_ router: RouterType) -> StepType.RouterType?) -> StepType {
    guard let router = router else { return StepType(router: nil) }
    let nextRouter = routing(router)
    return StepType(router: nextRouter)
  }
}
