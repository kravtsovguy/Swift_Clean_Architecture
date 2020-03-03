//
//  DetailsRouter.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol DetailsRouterProtocol: Router {
  var context: DetailsViewController! { get }
  
  func dismiss(comletions: (() -> Void)?)
}

final class DetailsRouter: DetailsRouterProtocol, DismissActions {
  weak var context: DetailsViewController!
  
  func dismiss(comletions: (() -> Void)?) {
    dismiss(animated: true, completion: comletions)
  }
}
