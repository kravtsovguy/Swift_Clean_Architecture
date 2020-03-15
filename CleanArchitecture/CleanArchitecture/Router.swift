//
//  Router.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

public protocol Router: AnyObject {
  var presentable: PresentableViewController! { get }
}

/// Контейнер для хранения роутера
public protocol RouterContainer: AnyObject {
  associatedtype RouterType: Router
  
  var router: RouterType? { get }
}
