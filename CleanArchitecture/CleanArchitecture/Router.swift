//
//  Router.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import Foundation

public protocol Router: AnyObject {
//  var context: Presentable! { get }
}

public final class EmptyRouter: Router {}
