//
//  Binding.swift
//  MasterDetailApp
//
//  Created by Karoly Nyisztor on 6/6/18.
//  Copyright © 2018 Nyisztor, Karoly. All rights reserved.
//

import Foundation

class Observable<T> {
    var bind: (T) -> () = {_ in}
    
    var value: T {
        didSet {
            bind(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}
