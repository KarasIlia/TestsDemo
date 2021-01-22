//
//  TestsDemoUITests.swift
//  TestsDemoUITests
//
//  Created by Илья Карась on 21.01.2021.
//

import XCTest
@testable import TestsDemo

class TestsDemoUITests: XCTestCase {
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    let app = XCUIApplication()
    app.launch()
    
    app.textFields["LoginTF"].tap()
    app.textFields["LoginTF"].typeText("Wrong Login")
    
    app.buttons["Next:"].tap()
    
    app.textFields["PasswordTF"].typeText("Wrong password")
    
    app.buttons["Done"].tap()

    XCTAssert(app.alerts["Warning"].descendants(matching: .staticText)["Invalid Fields"].waitForExistence(timeout: 1.0))
  }
  
  func testNextScreenExistsAfterLogin() throws {
    let app = XCUIApplication()
    app.launch()
    
    app.textFields["LoginTF"].tap()
    app.textFields["LoginTF"].typeText("Login")
    
    app.buttons["Next:"].tap()
    
    app.textFields["PasswordTF"].typeText("password123")
    
    app.buttons["Done"].tap()
    
    XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
  }
}
