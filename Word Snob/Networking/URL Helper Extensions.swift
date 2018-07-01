//
//  URL Extensions.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

extension URLRequest {
    func add(values: [String: String]) -> URLRequest {
        var requestWithValues = self
        for value in values {
            requestWithValues.addValue(value.key, forHTTPHeaderField: value.value)
        }
        return requestWithValues
    }
}
