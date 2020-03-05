//
//  Deeplink.swift
//  CleanArchitecture
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
  
  // public interface
  func run(container: RoutableContainerType)
  
  // to implement
  func start(combinedStep: CombinedStep) throws
}

extension Deeplink {
  public func run(container: RoutableContainerType) {
    PresentebleSettings.forceWithoutAnimation = true
    try? start(combinedStep: CombinedStep(container: container))
    PresentebleSettings.forceWithoutAnimation = false
  }
}

public struct SingleStep<RoutableContainerType: RoutableContainer>: StepProtocol {
  let container: RoutableContainerType
  
  public init(container: RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: (_ router: RoutableContainerType.RoutableType) -> Void) throws {
    guard let router = container.router else { throw StepError.noRouter }
    routing(router)
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

private enum StepError: Error {
  case noRouter
}
