//
//  PushDeeplink.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct PushDeeplink: Deeplink {
  typealias CombinedStep = Step<MainAssembly, Step1>
  typealias Step1 = Step<SolidAssembly, Step2>
  typealias Step2 = SingleStep<SolidAssembly>
  
  func start(combinedStep: CombinedStep) throws {
      try combinedStep
      .animatedStep { router in
        router.routeToSolid()
        
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
