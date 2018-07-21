//
//  NSObjects.swift
//  god
//
//  Created by Yuichiro Abe on 2018/07/22.
//  Copyright © 2018 taiki. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    public static var className: String {
        return String(describing: self)
    }
    public var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
