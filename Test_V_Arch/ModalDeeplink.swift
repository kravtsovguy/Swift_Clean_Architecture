//
//  ModalDeeplink.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 04.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class ModalDeeplink: Deeplink {
  func run(router: MainRouter?) {
    Step<MainRouter, EmptyStep>(router: router)
      .step { router in
        router.routeToDetails(callbacks: nil)
        return EmptyStep(router: nil)
      }
  }
}
