//
//  SegueActionMap.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class SegueActionMap {

    // MARK: - Public State

    public let actionMap: [String : SegueActionProtocol]

    // MARK: - Init

    init(_ actions: [String : SegueActionProtocol]) {
        self.actionMap = actions
    }

    //
    // MARK: - Public Methods
    //

    // Handles the given storyboard segue using the current map of actions
    func handle(_ segue: UIStoryboardSegue, from sender: Any?) {
        let segueIdentifier = segue.identifier ?? ""

        // Ensure segue identifier is supported
        let allowedIdentifiers = self.actionMap.keys
        guard allowedIdentifiers.contains(segueIdentifier) else {
            return Log.error(self, because: "segueIdentifier \(segueIdentifier) is not supported")
        }

        let action = self.actionMap[segueIdentifier]!

        // Attempt to perform preparation
        guard action.canSegue(to: segue.destination) else {
            return Log.error(self, (
                expected: "destination VC to be a \(action.destinationVCType)",
                actual: "\(type(of: segue.destination))"
            ))
        }

        action.performSegue(to: segue.destination)
    }

    // Handles the given storyboard segue by perferming the relevant action in the given map of actions
    static func handle(_ segue: UIStoryboardSegue, from sender: Any?, withActions actions: [String : SegueActionProtocol]) {
        let actionMap = SegueActionMap(actions)

        actionMap.handle(segue, from: sender)
    }
}

