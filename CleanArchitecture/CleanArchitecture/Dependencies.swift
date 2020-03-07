//
//  Dependencies.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 07.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

public protocol DependencyName: CustomStringConvertible {}

public enum Dependencies {
  final public class Container {
    private var dependencies: [String: Any] = [:]
      
    public static let `default` = Container()
    
    public func register<DependencyType>(name: DependencyName, _ dependency: DependencyType) {
      dependencies[name.description] = dependency
    }
    
    public func resolve<DependencyType>(_ name: DependencyName) -> DependencyType {
      dependencies[name.description] as! DependencyType
    }
  }
  
  @propertyWrapper
  public struct Inject<DependencyType> {
    public let wrappedValue: DependencyType
    
    public init(container: Container = .default, name: DependencyName) {
      wrappedValue = container.resolve(name)
    }
  }

}
