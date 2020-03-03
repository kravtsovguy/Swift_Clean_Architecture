//
//  SolidProtocols.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol SolidRouterProtocol: Router {
  var context: SolidViewController! { get }
  
  func routeToSolid(title: String)
}

protocol SolidInteractorProtocol: Interactor {
  var router: SolidRouterProtocol! { get }
  var view: SolidViewProtocol! { get }
  
  func activate()
}

protocol SolidViewProtocol: View {
  var interactor: SolidInteractorProtocol! { get }
  
  func setTitle(title: String)
}
