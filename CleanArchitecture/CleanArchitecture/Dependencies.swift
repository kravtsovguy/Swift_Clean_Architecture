//
//  Dependencies.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 07.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

public enum Dependencies {
  final public class Container {
    private var dependencies: [String: Any] = [:]
      
    public static let `default` = Container()
    
    public func register<DependencyType>(_ type: DependencyType.Type, closure: (Container) -> DependencyType) {
      dependencies[key(type)] = closure(self)
    }
    
    public func resolve<DependencyType>(_ type: DependencyType.Type) -> DependencyType {
      dependencies[key(type)] as! DependencyType
    }
    
    private func key<DependencyType>(_ type: DependencyType.Type) -> String {
      String(describing: type)
    }
  }
  
  @propertyWrapper
  public struct Inject<DependencyType> {
    public let wrappedValue: DependencyType
    
    public init(container: Container) {
      wrappedValue = container.resolve(DependencyType.self)
    }
    
    public init() {
      wrappedValue = Container.default.resolve(DependencyType.self)
    }
  }
}
