//
//  PushDeeplink.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct PushDeeplink: Deeplink {
  typealias CombinedStep = FlowStep<Step1>
  typealias Step1 = Step<MainAssembly, Step2>
  typealias Step2 = Step<SolidAssembly, Step3>
  typealias Step3 = SingleStep<SolidAssembly>
  
  func start(combinedStep: CombinedStep) throws {
    try combinedStep
    .step {
      sleep(1)
    }
    .animatedStep { router in
      router.routeToSolid(title: "Solid")
      
      return router.solidAssembly
    }
    .animatedStep { router in
      router.routeToSolid(title: "1")
      
      return router.solidAssembly
    }
    .animatedStep { router in
      router.routeToSolid(title: "2")
    }
  }
}
