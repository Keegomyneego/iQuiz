//
//  Log.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

public class Log {

    static func error(_ tag: String, _ assertion: (expected: String, actual: String)? = nil) {
        print(tag)

        if let a = assertion {
            print("\tExpected: \(a.expected)")
            print("\tActual: \(a.actual)")
        }
    }

    static func error(_ tag: String, because reason: String) {
        print("\(tag) \(reason)")
    }
}
