//
//  MainProtocols.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

protocol MainRouterProtocol: Router, Routable, DetailsRouting, SolidRouting {
  var presentable: MainViewController! { get }
}

protocol MainInteractorProtocol: Interactor {
  var router: MainRouterProtocol! { get }
  var presenter: MainPresenterProtocol! { get }
  
  func buttonTapped()
  func testButtonTapped()
}

protocol MainPresenterProtocol: Presenter {
  var view: MainViewProtocol! { get }
}

protocol MainViewProtocol: View {
  var interactor: MainInteractorProtocol! { get }
}
