//
//  Log.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

public class Log {

    static func error(_ tag: Any, _ assertion: (expected: String, actual: String)? = nil) {
        print(getName(for: tag))

        if let a = assertion {
            print("\tExpected: \(a.expected)")
            print("\tActual: \(a.actual)")
        }
    }

    static func error(_ tag: Any, because reason: String) {
        print("| ! \(getName(for: tag)) \(reason)")
    }

    static func info(_ tag: Any, _ info: String) {
        print("|   \(getName(for: tag)) \(info)")
    }

    private static func getName(for tag: Any) -> String {
        return "\(type(of: tag))"
    }
}
