//
//  TextFieldAssembly.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

struct TextFieldCallbacks {
  let onValidate: (Bool) -> Void
}

final class TextFieldAssembly: Assembly {
  func assemble(callbacks: TextFieldCallbacks) -> TextField {
    let textField = TextField()
    let interactor = TextFieldInteractor()
    
    interactor.view = textField
    interactor.callbacks = callbacks
    textField.interactor = interactor
    
    interactor.activate()
    
    return textField
  }
}
