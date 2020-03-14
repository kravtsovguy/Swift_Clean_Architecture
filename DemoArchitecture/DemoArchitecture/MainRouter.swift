//
//  MainRouter.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import CleanArchitecture

final class MainRouter: MainRouterProtocol, PresentableContainer {
  weak var presentable: MainViewController!
}
