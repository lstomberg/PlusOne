//
//  with.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation

@discardableResult
public func with<T: AnyObject>(_ this: T, update: (T) throws -> Void) rethrows -> T {
   try update(this)
   return this
}

public func using<T: AnyObject>(_ object: T, call: (T) -> Void) {
   call(object)
}

public func using<T1: AnyObject, T2: AnyObject>(_ object1: T1, _ object2: T2, call: (T1, T2) -> Void) {
   call(object1, object2)
}
