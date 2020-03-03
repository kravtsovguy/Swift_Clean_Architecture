//
//  Deeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation
import UIKit
/*
protocol Step {
//  associatedtype RouterType: Router
  associatedtype Input
  associatedtype AssembyType: Assembly
  associatedtype NextStep: Step
  
  var assembly: AssembyType { get }
  
  @discardableResult
  func step(input: Input) -> NextStep?
}
 */

//protocol Deeplink {
//  associatedtype InitialStep: Step
//
//  func run(initialStep: InitialStep)
//}

//class DeeplinkImp: Deeplink {
//
//  func run(initialStep: InitialStep) {
//    forceWithoutAnimation = true
//    initialStep.step(input: ())?.step(input: "Wow")
//    forceWithoutAnimation = false
//  }
//}

//struct SolidDeeplink: Deeplink {
//  func run(initialStep: MainStep) {
//    forceWithoutAnimation = true
////    initialStep.step(input: ())?.step(input: "Wow")
//
//
//
//    forceWithoutAnimation = false
//  }
//}

class Deeplink {
  func run(assembly: MainAssembly) {
    forceWithoutAnimation = true
    
    typealias CombinedStep = Step<MainRouter,
                             Step<SolidRouter, EmptyStep>>
    
    
    CombinedStep(router: assembly.router)
      .step { router in
        router.routeToSolid()
        return Step<SolidRouter, EmptyStep>(router: router.solidAssembly.router)
      }
      .step(routing: { router in
        router.routeToSolid(title: "wow")
        return EmptyStep(router: nil)
      })
    
    forceWithoutAnimation = false
  }
}

/*
protocol Step: class {
  associatedtype Input
  associatedtype AssemblyType: Assembly
  associatedtype NextAssemblyType
  
  var assembly: AssemblyType { get }
  
  func step(input: (_ assembly: AssemblyType, _ input: Input) -> NextAssemblyType) -> Step
}
*/

/*
enum EStep<RouterType: Router, StepType> {
  case step(router: RouterType, routing: (_ router: RouterType) -> StepType?)
  case stop
  
//  var router: RouterType {
//    switch self {
//    case let .step(router, _): return router
//    }
//  }
//
  func run() -> StepType? {
    switch self {
    case let .step(router, routing):
      return routing(router)
    case .stop:
      return nil
    }
  }
}
*/

protocol StepProtocol {
  associatedtype RouterType: Router
  init(router: RouterType?)
}

struct EmptyStep: StepProtocol {
  let router: EmptyRouter?
}

final class EmptyRouter: Router {}

struct Step<RouterType: Router, StepType: StepProtocol>: StepProtocol {
  let router: RouterType?
  
  @discardableResult
  func step(routing: (_ router: RouterType) -> StepType) -> StepType {
    guard let router = router else { return StepType(router: nil) }
    return routing(router)
  }
}
/*
class Step<AssemblyType: Assembly, RouterType: Router, StepType> {
  let assembly: AssemblyType
  
  init(assembly: AssemblyType) {
    self.assembly = assembly
  }
  
  func step(routing: (_ router: RouterType) -> StepType?) -> StepType? {
    guard let router = assembly.router as? RouterType else { return nil }
    return routing(router)
  }
}
*/
//struct Step<AssemblyType: Assembly, RouterType: Router> {
//  let assembly: AssemblyType
//
//  func step(routing: (_ router: RouterType) -> Step?) -> Step? {
//    guard let router = assembly.router as? RouterType else { return nil }
//    return routing(router)
//  }
//}

/*
struct MainStep: Step {
  let assembly: MainAssembly
  
  func step(input: Void) -> SolidStep? {
    guard let router = assembly.router else { return nil }
    
//    UIView.performWithoutAnimation {
//      router.routeToSolid()
//    }
    
    router.routeToSolid()
    
    let step = SolidStep(assembly: router.solidAssembly)
    return step
  }
}

struct SolidStep: Step {
  let assembly: SolidAssembly
  
  func step(input: String) -> SolidStep? {
    guard let router = assembly.router else { return nil }

    router.routeToSolid(title: input)
    return nil
  }
}
*/
