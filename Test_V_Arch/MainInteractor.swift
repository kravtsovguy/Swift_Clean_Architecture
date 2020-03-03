//
//  MainInteractor.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class MainInteractor: MainInteractorProtocol {
  var router: MainRouterProtocol!
  var presenter: MainPresenterProtocol!
  
  func buttonTapped() {
    router.routeToDetails(callbacks: DetailsCallbacks(onAccept: {
      print("accept")
    }, onDecline: {
      print("decline")
    }))
  }
}
