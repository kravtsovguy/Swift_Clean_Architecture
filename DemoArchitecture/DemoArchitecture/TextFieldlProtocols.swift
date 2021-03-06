//
//  TextFieldProtocols.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

protocol TextFieldInteractorProtocol: Interactor {
  var view: TextFieldViewProtocol! { get }
  var callbacks: TextFieldCallbacks! { get }
  
  func formatAndValidate(text: String)
}

protocol TextFieldViewProtocol: View {
  var interactor: TextFieldInteractorProtocol! { get }
  
  func set(text: String)
}
