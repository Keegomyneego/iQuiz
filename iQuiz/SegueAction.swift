//
//  SegueAction.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class SegueAction<DestinationVC: UIViewController> : SegueActionProtocol {

    // MARK: - Public State

    typealias Action = (_ destinationVC: DestinationVC) -> Void

    let destinationVCType: UIViewController.Type = DestinationVC.self

    // MARK: - Private State

    private let action: Action

    // MARK: - Init

    init(to destinationVCType: DestinationVC.Type, _ action: @escaping Action) {
        self.action = action
    }

    //
    // MARK: - Public Methods
    //

    public func canSegue(to destination: UIViewController) -> Bool {
        return destination is DestinationVC
    }

    public func performSegue(to destination: UIViewController) {
        if let vc = destination as? DestinationVC {
            self.action(vc)
        }
    }
}
