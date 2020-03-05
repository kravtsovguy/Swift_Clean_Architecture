//
//  ModalDeeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct ModalDeeplink: Deeplink {
  typealias CombinedStep = Step<MainAssembly, EmptyStep>
  
  func run(container: MainAssembly) {
    try?
    createInitialState(container: container)
      .start()
      .step { router in
        router.routeToDetails(callbacks: nil)
      }
      .finish()
  }
}
