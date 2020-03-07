//
//  NameService.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 07.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

protocol NameService: AnyObject {
  func name(firstname: String, surname: String) -> String
}

final class NameServiceImp: NameService {
  func name(firstname: String, surname: String) -> String {
    "\(firstname) \(surname)"
  }
}
