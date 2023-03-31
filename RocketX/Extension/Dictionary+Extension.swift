//
//  Dictionary+Extension.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 24/02/23.
//

import Foundation
extension Dictionary {
    var jsonSerialization: Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return jsonData
        } catch {
            return nil
        }
    }
    
    var prettyString: String {
        guard let data = self.jsonSerialization, let jsonString = String(data: data, encoding: .utf8) else {
            return self.description
        }
        
        return jsonString
    }
}
