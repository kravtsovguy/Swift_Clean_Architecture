//
//  MainInteractor.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class MainInteractor: MainInteractorProtocol {
  var router: MainRouterProtocol!
  var presenter: MainPresenterProtocol!
  
  @Dependencies.Inject private var nameService: NameService
  
  func buttonTapped() {
    router.routeToDetails(callbacks: DetailsCallbacks(onAccept: {
      print("accept")
    }, onDecline: {
      print("decline")
    }))
  }
  
  func testButtonTapped() {
    router.routeToSolid(title: "Solid")
    print(nameService.name(firstname: "A", surname: "B"))
  }
}
