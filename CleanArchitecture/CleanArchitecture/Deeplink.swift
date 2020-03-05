//
//  Deeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

public protocol StepProtocol {
  associatedtype RoutableContainerType: RoutableContainer
  init(container: RoutableContainerType)
}

public protocol Deeplink {
  associatedtype CombinedStep: StepProtocol  
  typealias RoutableContainerType = CombinedStep.RoutableContainerType
  typealias InitialStepType = InitialStep<CombinedStep>
  
  func createInitialState(container: RoutableContainerType) -> InitialStepType
  func run(container: RoutableContainerType)
}

extension Deeplink {
  public func createInitialState(container: RoutableContainerType) -> InitialStepType {
    InitialStepType(container: container)
  }
}

public struct EmptyStep: StepProtocol {
  public init(container: EmptyRoutableContainer) {}

  public func finish() {
    PresentebleSettings.forceWithoutAnimation = false
  }
}

public struct InitialStep<StepType: StepProtocol>: StepProtocol {
  let container: StepType.RoutableContainerType
  
  public init(container: StepType.RoutableContainerType) {
    self.container = container
  }
  
  public func start() -> StepType {
    PresentebleSettings.forceWithoutAnimation = true
    return StepType(container: container)
  }
}

public struct Step<RoutableContainerType: RoutableContainer, StepType: StepProtocol>: StepProtocol {
  let container: RoutableContainerType
  
  public init(container: RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: (_ router: RoutableContainerType.RoutableType) -> StepType.RoutableContainerType) throws -> StepType {
    guard let router = container.router else { throw StepError.noRouter }
    let nextContainer = routing(router)
    return StepType(container: nextContainer)
  }
}

extension Step where StepType == EmptyStep {
  public func step(routing: (_ router: RoutableContainerType.RoutableType) -> Void) throws -> StepType {
    guard let router = container.router else { throw StepError.noRouter }
    routing(router)
    return StepType(container: EmptyRoutableContainer())
  }
}

private enum StepError: Error {
  case noRouter
}
