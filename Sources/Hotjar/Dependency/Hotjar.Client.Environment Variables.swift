//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 15/12/2024.
//

import Foundation

extension Hotjar.Client {
    public struct EnvVars: Codable {
        public var id: String
        
        public init(id: String) {
            self.id = id
        }
    }
}
