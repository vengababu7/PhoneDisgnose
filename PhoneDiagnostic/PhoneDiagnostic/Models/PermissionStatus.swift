//
//  Permission.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation

    
public enum PermissionStatus: String {
    case authorized    = "Authorized"
    case denied        = "Denied"
    case disabled      = "Disabled"
    case notDetermined = "Not Determined"
    
    internal init?(string: String?) {
        guard let string = string else { return nil }
        self.init(rawValue: string)
    }
}
