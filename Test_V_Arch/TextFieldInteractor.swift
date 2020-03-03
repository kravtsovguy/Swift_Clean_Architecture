//
//  TextFieldInteractor.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

final class TextFieldInteractor: TextFieldInteractorProtocol {
  weak var view: TextFieldViewProtocol!
  var callbacks: TextFieldCallbacks!
  
  func formatAndValidate(text: String) {
    let formattedText = format(text: text)
    view.set(text: formattedText)
    
    let isValid = validate(text: formattedText)
    callbacks.onValidate(isValid)
  }
  
  private func format(text: String) -> String {
    let charSet = CharacterSet(charactersIn: "+0123456789")
    var newText = text.removingCharacters(except: charSet)
    
    if newText.first == "8" {
      newText = String(newText.dropFirst())
      newText = "+7" + newText
    }
    
    if newText.first == "7" {
      newText = "+" + newText
    }
    
    if newText.first == "9" {
      newText = "+7" + newText
    }
    
    newText = String(newText.unicodeScalars.prefix(12))
    
    return newText
  }
  
  private func validate(text: String) -> Bool {
    if text.count == 12 {
      return true
    } else {
      return false
    }
  }
}

extension String {
  /// Удалятся все символы (Unicode Scalar'ы) кроме символов из указанного CharacterSet. Например все кроме цифр
  fileprivate func removingCharacters(except characterSet: CharacterSet) -> String {
    let scalars = unicodeScalars.filter(characterSet.contains(_:))
    return String(scalars)
  }
  
  /// Удалятся все символы (Unicode Scalar'ы), которые соответсвуют указанному CharacterSet.
  /// Например все точки и запятые
  fileprivate func removingCharacters(in characterSet: CharacterSet) -> String {
    let scalars = unicodeScalars.filter { !characterSet.contains($0) }
    return String(scalars)
  }
}
