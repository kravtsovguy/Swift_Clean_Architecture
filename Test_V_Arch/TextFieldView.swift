//
//  TextFieldView.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit
import CleanArchitecture

final class TextField: UITextField, TextFieldViewProtocol {
  var interactor: TextFieldInteractorProtocol!
  
  convenience init() {
    self.init(frame: .zero)
    addTarget(self, action: #selector(textChanged), for: .editingChanged)
  }
  
  func set(text: String) {
    self.text = text
  }
  
  @objc private func textChanged() {
    interactor.formatAndValidate(text: text ?? "")
  }
}
