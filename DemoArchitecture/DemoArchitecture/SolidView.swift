//
//  SolidView.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 03.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit
import CleanArchitecture

class SolidViewController: UIViewController, SolidViewProtocol {
  var interactor: SolidInteractorProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
  
  func setTitle(title: String) {
    self.title = title
  }
}
