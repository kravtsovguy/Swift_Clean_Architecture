//
//  Dependencies.swift
//  CleanArchitecture
//
//  Created by Matvey Kravtsov on 07.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Dispatch

public protocol DependencyName: CustomStringConvertible {}

public enum Dependencies {
  final public class Container {
    private var dependencies: [String: [String: Any]] = [:]
    
    private let queue = DispatchQueue(label: "DIContainerDispatchQueue",
                                      qos: .userInitiated,
                                      attributes: [.concurrent])
      
    public static let `default` = Container()
    
    private func key<DependencyType>(_ type: DependencyType.Type) -> String {
      String(describing: type)
    }
    
    private func name(_ name: DependencyName?) -> String {
      name.map { String(describing: $0) } ?? "default"
    }
  }
  
  @propertyWrapper
  public struct Inject<DependencyType> {
    public let wrappedValue: DependencyType
    
    public init(container: Container = .default, name: DependencyName? = nil) {
      wrappedValue = container.resolve(DependencyType.self, name: name)
    }
  }
}

extension Dependencies.Container {
  public func register<DependencyType>(_ type: DependencyType.Type,
                                       name: DependencyName? = nil,
                                       dependency: @escaping (Dependencies.Container) -> DependencyType) {
    queue.async(flags: .barrier) {
      if var nameDict = self.dependencies[self.key(type)] {
        nameDict[self.name(name)] = dependency(self)
      } else {
        self.dependencies[self.key(type)] = [self.name(name): dependency(self)]
      }
    }
  }
  
  public func resolve<DependencyType>(_ type: DependencyType.Type, name: DependencyName? = nil) -> DependencyType {
    queue.sync {
      dependencies[self.key(type)]?[self.name(name)] as! DependencyType
    }
  }
}
