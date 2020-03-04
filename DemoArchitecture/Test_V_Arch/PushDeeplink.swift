//
//  PushDeeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct PushDeeplink: Deeplink {
  typealias CombinedStep = Step<MainRouter, Step1>
  typealias Step1 = Step<SolidRouter, Step2>
  typealias Step2 = Step<SolidRouter, EmptyStep>
  
  func run(router: MainRouter?) {
    createInitialState(router: router)
      .start()
      .step { router in
        router.routeToSolid()
        
        return router.solidAssembly.router
      }
      .step(routing: { router in
        router.routeToSolid(title: "1")
        
        return router.solidAssembly.router
      })
      .step { router in
        router.routeToSolid(title: "2")
        
        return nil
      }
      .finish()
  }
}
