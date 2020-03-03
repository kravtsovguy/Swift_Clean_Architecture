//
//  MainProtocols.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol MainRouterProtocol: Router {
  var context: MainViewController! { get }
  
  func routeToDetails(callbacks: DetailsCallbacks)
}

protocol MainInteractorProtocol: Interactor {
  var router: MainRouterProtocol! { get }
  var presenter: MainPresenterProtocol! { get }
  
  func buttonTapped()
}

protocol MainPresenterProtocol: Presenter {
  var view: MainViewProtocol! { get }
}

protocol MainViewProtocol: View {
  var interactor: MainInteractorProtocol! { get }
}
