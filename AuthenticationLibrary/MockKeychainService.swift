//
//  MockKeychainService.swift
//  iOSAuthLibrary
//
//  Created by Pariveda Solutions.
//

import Foundation

open class MockKeychainService: KeychainService {
    var mockToken = MockToken()
    
    override public func storeToken(_ token: String, _ tokenType: String) {
        if (tokenType == TokenType.id_token.rawValue) {
            mockToken.id_token = token
        }
        else if (tokenType == TokenType.auth_token.rawValue) {
            mockToken.auth_token = token
        }
        else if (tokenType == TokenType.refresh_token.rawValue) {
            mockToken.refresh_token = token
        }
        super.storeToken(token, tokenType)
    }
    
    override public func getToken(_ tokenType: String) -> String {
        if (tokenType == TokenType.id_token.rawValue) {
            return mockToken.id_token
        }
        else if (tokenType == TokenType.auth_token.rawValue) {
            return mockToken.auth_token
        }
        else if (tokenType == TokenType.refresh_token.rawValue) {
            return mockToken.refresh_token
        }
        else {
            return ""
        }
    }
}
