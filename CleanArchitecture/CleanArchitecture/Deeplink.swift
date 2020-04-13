//
//  Deeplink.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Dispatch
import class QuartzCore.CATransaction

private let deeplinkQueue = DispatchQueue(label: "DeeplinkDispatchQueue",
                                          qos: .userInitiated)

public protocol StepProtocol {
  associatedtype RoutableContainerType: RouterContainer
  init(container: RoutableContainerType)
}

public protocol Deeplink {
  associatedtype CombinedStep: StepProtocol  
  typealias RoutableContainerType = CombinedStep.RoutableContainerType
  
  // to implement
  func start(combinedStep: CombinedStep) throws
}

extension Deeplink {
  public func run(container: RoutableContainerType, completion: (() -> Void)? = nil) {
    deeplinkQueue.async {
      try? self.start(combinedStep: CombinedStep(container: container))
      completion?()
    }
  }
}

public struct SingleStep<RoutableContainerType: RouterContainer>: StepProtocol {
  private let container: RoutableContainerType
  private let underlyingStep: Step<RoutableContainerType, Self>
  
  public typealias RoutingClosure = (_ router: RoutableContainerType.RouterType) -> Void
  
  public init(container: RoutableContainerType) {
    self.container = container
    self.underlyingStep = Step<RoutableContainerType, Self>(container: container)
  }
  
  public func step(routing: RoutingClosure) throws {
    try _ = underlyingStep.step { router in
      routing(router)
      return container
    }
  }
  
  public func animatedStep(routing: RoutingClosure) throws {
    try _ = underlyingStep.animatedStep { router in
      routing(router)
      return container
    }
  }
}

public struct Step<RoutableContainerType: RouterContainer, NextStepType: StepProtocol>: StepProtocol {
  private let container: RoutableContainerType
  public typealias RoutingClosure = (_ router: RoutableContainerType.RouterType) -> NextStepType.RoutableContainerType
  
  public init(container: RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: RoutingClosure) throws -> NextStepType {
    guard let router = container.router else { throw StepError.noRouter }
    
    let group = DispatchGroup()
    group.enter()
    
    let nextContainer: NextStepType.RoutableContainerType = DispatchQueue.main.sync {
      CATransaction.begin()
      defer { CATransaction.commit() }
      
      CATransaction.setDisableActions(true)
      CATransaction.setCompletionBlock { group.leave() }
      return routing(router)
    }
    
    group.wait()
    
    return NextStepType(container: nextContainer)
  }
  
  public func animatedStep(routing: RoutingClosure) throws -> NextStepType {
    guard let router = container.router else { throw StepError.noRouter }
    
    let group = DispatchGroup()
    group.enter()
    
    let nextContainer: NextStepType.RoutableContainerType = DispatchQueue.main.sync {
      CATransaction.begin()
      defer { CATransaction.commit() }
      
      CATransaction.setCompletionBlock { group.leave() }
      return routing(router)
    }
    
    group.wait()
    
    return NextStepType(container: nextContainer)
  }
}

public struct FlowStep<NextStepType: StepProtocol>: StepProtocol {
  private let container: NextStepType.RoutableContainerType
  
  public init(container: NextStepType.RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: () -> Void) -> NextStepType {
    routing()
    
    return NextStepType(container: container)
  }
}

private enum StepError: Error {
  case noRouter
}
