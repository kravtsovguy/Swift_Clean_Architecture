//
//  Assembly.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

protocol BaseAssembly: AnyObject {}

protocol Assembly: BaseAssembly {
  associatedtype  RouterType: Router
  
  var router: RouterType? { get }
  
//  func assemble() -> Presentable
}
