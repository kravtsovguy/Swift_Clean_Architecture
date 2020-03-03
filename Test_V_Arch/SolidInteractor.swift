//
//  SolidInteractor.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class SolidInteractor: SolidInteractorProtocol {
  var router: SolidRouterProtocol!
  weak var view: SolidViewProtocol!
  
  let title: String
  
  init(title: String) {
    self.title = title
  }
  
  func activate() {
    view.setTitle(title: title)
  }
}
