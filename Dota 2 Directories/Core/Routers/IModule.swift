//
//  IModule.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation
import UIKit

protocol IModule {
    var router: IRouter { get set }
    func resolve(using params: [String: Any]) -> UIViewController
}
