//
//  SolidDeeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class SolidDeeplink: Deeplink {
  func run(router: MainRouter?) {
    forceWithoutAnimation = true
    defer { forceWithoutAnimation = false }
    
    typealias Step0 = Step<MainRouter, Step1>
    typealias Step1 = Step<SolidRouter, Step2>
    typealias Step2 = Step<SolidRouter, EmptyStep>
    
    Step0(router: router)
      .step { router in
        router.routeToSolid()
        return Step1(router: router.solidAssembly.router)
      }
      .step(routing: { router in
        router.routeToSolid(title: "1")
        return Step2(router: router.solidAssembly.router)
      })
      .step { router in
        router.routeToSolid(title: "2")
        return EmptyStep(router: nil)
      }
  }
}
