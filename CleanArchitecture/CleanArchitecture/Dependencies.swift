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
    
    private let queue = DispatchQueue(label: "DIContainerDispatchQueue",
                                      qos: .userInitiated,
                                      attributes: [.concurrent])
      
    public static let `default` = Container()
    
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

extension Dependencies.Container {
  public func register<DependencyType>(_ type: DependencyType.Type,
                                       dependency: @escaping (Dependencies.Container) -> DependencyType) {
    queue.async(flags: .barrier) {
      self.dependencies[self.key(type)] = dependency(self)
    }
  }
  
  public func resolve<DependencyType>(_ type: DependencyType.Type) -> DependencyType {
    queue.sync {
      dependencies[key(type)] as! DependencyType
    }
  }
}
