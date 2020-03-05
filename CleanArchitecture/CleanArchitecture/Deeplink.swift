//
//  Deeplink.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import QuartzCore

private let deeplinkQueue = DispatchQueue(label: "DeeplinkDispatchQueue",
                                          qos: .userInitiated)

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
    deeplinkQueue.async {
      try? self.start(combinedStep: CombinedStep(container: container))
    }
  }
}

public struct SingleStep<RoutableContainerType: RoutableContainer>: StepProtocol {
  private let container: RoutableContainerType
  public typealias RoutingClosure = (_ router: RoutableContainerType.RoutableType) -> Void
  
  public init(container: RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: RoutingClosure) throws {
    guard let router = container.router else { throw StepError.noRouter }
    
    PresentebleSettings.forceWithoutAnimation = true
    DispatchQueue.main.sync { routing(router) }
    PresentebleSettings.forceWithoutAnimation = false
  }
  
  public func animatedStep(routing: RoutingClosure) throws {
    guard let router = container.router else { throw StepError.noRouter }
    
    let group = DispatchGroup()
    group.enter()
    
    DispatchQueue.main.sync {
      CATransaction.begin()
      defer { CATransaction.commit() }
      
      CATransaction.setCompletionBlock { group.leave() }
      routing(router)
    }
    
    group.wait()
  }
}

public struct Step<RoutableContainerType: RoutableContainer, NextStepType: StepProtocol>: StepProtocol {
  private let container: RoutableContainerType
  public typealias RoutingClosure = (_ router: RoutableContainerType.RoutableType) -> NextStepType.RoutableContainerType
  
  public init(container: RoutableContainerType) {
    self.container = container
  }
  
  public func step(routing: RoutingClosure) throws -> NextStepType {
    guard let router = container.router else { throw StepError.noRouter }
    
    PresentebleSettings.forceWithoutAnimation = true
    let nextContainer = DispatchQueue.main.sync { routing(router) }
    PresentebleSettings.forceWithoutAnimation = false
    
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

private enum StepError: Error {
  case noRouter
}
