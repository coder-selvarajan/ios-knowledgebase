//
//  Model.swift
//  WeatherApp
//
//  Created by Nyisztor, Karoly on 5/24/18.
//  Copyright © 2018 Nyisztor, Karoly. All rights reserved.
//

import Foundation

struct Model<T> {
    private var objects = [T]()
    
    mutating func insert(_ element: T) {
        objects.insert(element, at: 0)        
    }

    mutating func remove(at index: Int) {
        guard objects.indices.contains(index) else {
            return
        }
        objects.remove(at: index)
    }

    var count: Int {
        return objects.count
    }
    
    subscript(index: Int) -> T? {
        return objects.indices.contains(index) ? objects[index] : nil
    }
}
