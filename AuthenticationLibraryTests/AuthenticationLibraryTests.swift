//
//  AuthenticationLibraryTests.swift
//  AuthenticationLibraryTests
//
//  Created by Kirthika Vijayakumar on 21/06/17.
//  Copyright © 2017 Kirthika Vijayakumar. All rights reserved.
//

import XCTest
import AuthenticationLibrary

class AuthenticationLibraryTests: XCTestCase {
    
  var loginViewController: LoginViewController!
  var authLibrary: AuthLibrary!
  var keychainService: MockKeychainService!
  
  override func setUp() {
    super.setUp()
    
    let storyboard = UIStoryboard (name: "Login", bundle: Bundle(for: LoginViewController.self))
    loginViewController = storyboard.instantiateInitialViewController() as! LoginViewController
    
    authLibrary = AuthLibrary("Toyota")
    keychainService = MockKeychainService()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testCorrectMockStoreAndGetToken() {
    let mockToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IklkVG9rZW5TaWduaW5nS2V5Q29udGFpbmVyLnYyIn0.eyJleHAiOjE0ODk2OTY1MTQsIm5iZiI6MTQ4OTY5MjkxNCwidmVyIjoiMS4wIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5taWNyb3NvZnRvbmxpbmUuY29tL2NkNzg2YzQ4LWRhZmItNDFkMS1hY2JmLWQ0ZWU3NzdhZGYwMi92Mi4wLyIsInN1YiI6IjNjZTY2Y2Y3LWI5OTYtNGU1OS1iYzQzLTMwMzNjNzU2MTkyZiIsImF1ZCI6IjY3MmYyMTc2LTM1MmMtNGUwNC1iNDFjLTZhMTg2NGFiYzBmZiIsIm5vbmNlIjoiZGVmYXVsdE5vbmNlIiwiaWF0IjoxNDg5NjkyOTE0LCJhdXRoX3RpbWUiOjE0ODk2OTI5MTQsImdpdmVuX25hbWUiOiJOYXRoYW4iLCJmYW1pbHlfbmFtZSI6IkNsZW1lbnRlIiwibmFtZSI6Ik5hdGhhbiBDbGVtZW50ZSIsImV4dGVuc2lvbl9Jc1Nob3BwZXIiOiJ0cnVlIiwiZXh0ZW5zaW9uX0N1c3RvbWVySUQiOiI0MDg0ODI4MSIsImVtYWlscyI6WyJuYXRoYW5jbGVtZW50ZUBnbWFpbC5jb20iXSwidGZwIjoiQjJDXzFfU2lnbnVwT3JTaWduaW5Ub3lvdGEifQ.X5wkNSSXeeIGRjOoW8zUWeVEwT-OgsNk57a2vddSTF283xhGVgXddPTx1csGCX5Hb9PUPRFq6u-NamwM4D-QO8rOIc-LFeB9futFyD5AYpelSnTNf36DAGwTz7rRf_Ziex4RMUSF0yaDnWSCKCywDEaVFWqRovACYf2glx6VtuYYe7UCVXBL6FUJZW84PoAzqhINpDcFWHH65akiIkjvLs4inhPmU9Q8wiQj7wvyA93b7ed4RI7PW7Z-6Hbqn7JLvcM_BK_ZhWBhLkx77CqaOudEgitm5wrpCDeeoNxd939xw0nBlb90SFVymNVzzZ_fjg_spVzDdhc4oXOxFBpoBw"
    keychainService.storeToken(mockToken, TokenType.id_token.rawValue)
    let token = keychainService.getToken(TokenType.id_token.rawValue)
    XCTAssert(token == mockToken)
  }
  
  func testIncorrectMockStoreAndGetToken() {
    let mockToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IklkVG9rZW5TaWduaW5nS2V5Q29udGFpbmVyLnYyIn0.eyJleHAiOjE0ODk2OTY1MTQsIm5iZiI6MTQ4OTY5MjkxNCwidmVyIjoiMS4wIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5taWNyb3NvZnRvbmxpbmUuY29tL2NkNzg2YzQ4LWRhZmItNDFkMS1hY2JmLWQ0ZWU3NzdhZGYwMi92Mi4wLyIsInN1YiI6IjNjZTY2Y2Y3LWI5OTYtNGU1OS1iYzQzLTMwMzNjNzU2MTkyZiIsImF1ZCI6IjY3MmYyMTc2LTM1MmMtNGUwNC1iNDFjLTZhMTg2NGFiYzBmZiIsIm5vbmNlIjoiZGVmYXVsdE5vbmNlIiwiaWF0IjoxNDg5NjkyOTE0LCJhdXRoX3RpbWUiOjE0ODk2OTI5MTQsImdpdmVuX25hbWUiOiJOYXRoYW4iLCJmYW1pbHlfbmFtZSI6IkNsZW1lbnRlIiwibmFtZSI6Ik5hdGhhbiBDbGVtZW50ZSIsImV4dGVuc2lvbl9Jc1Nob3BwZXIiOiJ0cnVlIiwiZXh0ZW5zaW9uX0N1c3RvbWVySUQiOiI0MDg0ODI4MSIsImVtYWlscyI6WyJuYXRoYW5jbGVtZW50ZUBnbWFpbC5jb20iXSwidGZwIjoiQjJDXzFfU2lnbnVwT3JTaWduaW5Ub3lvdGEifQ.X5wkNSSXeeIGRjOoW8zUWeVEwT-OgsNk57a2vddSTF283xhGVgXddPTx1csGCX5Hb9PUPRFq6u-NamwM4D-QO8rOIc-LFeB9futFyD5AYpelSnTNf36DAGwTz7rRf_Ziex4RMUSF0yaDnWSCKCywDEaVFWqRovACYf2glx6VtuYYe7UCVXBL6FUJZW84PoAzqhINpDcFWHH65akiIkjvLs4inhPmU9Q8wiQj7wvyA93b7ed4RI7PW7Z-6Hbqn7JLvcM_BK_ZhWBhLkx77CqaOudEgitm5wrpCDeeoNxd939xw0nBlb90SFVymNVzzZ_fjg_spVzDdhc4oXOxFBpoBw"
    keychainService.storeToken(mockToken, TokenType.id_token.rawValue)
    let token = keychainService.getToken(TokenType.auth_token.rawValue)
    XCTAssert(token != mockToken)
  }
  
  func testPerformanceIsAuthenticated() {
    self.measure {
      self.authLibrary.isAuthenticated(completion: { (data) -> Void in
        print(data)
        })
    }
  }
  
  
}
