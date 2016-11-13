//
//  SegueActionProtocol.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

protocol SegueActionProtocol {
    
    var destinationVCType: UIViewController.Type { get }

    func canSegue(to destination: UIViewController) -> Bool

    func performSegue(to destination: UIViewController)
}
