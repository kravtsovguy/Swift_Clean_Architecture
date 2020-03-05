//
//  Routable.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 05.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

// MARK: Deeplink Support

/// Контейнер для хранения роутинга
public protocol RoutableContainer: AnyObject {
  associatedtype RoutableType: Routable
  
  var router: RoutableType? { get }
}

/// Протокол, нужный для диплинков
public protocol Routable: AnyObject {}

/// Пустой роутинг для диплинков
public final class EmptyRoutable: Routable {}

/// Пустой контейнер для диплинков
public final class EmptyRoutableContainer: RoutableContainer {
  public var router: EmptyRoutable?
  
  public init() {}
}
