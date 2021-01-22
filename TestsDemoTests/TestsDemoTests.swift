//
//  TestsDemoTests.swift
//  TestsDemoTests
//
//  Created by Илья Карась on 22.01.2021.
//

import XCTest
@testable import TestsDemo

class TestsDemoTests: XCTestCase {
  
  var fieldValidator: FieldValidator!
  
  override func setUpWithError() throws {
    fieldValidator = FieldValidatorImpl()
  }
  
  override func tearDownWithError() throws {
    fieldValidator = nil
  }
  
  func testValidatorCorrectWithEmptyValues() throws {
    
    // Given
    let loginTF = UITextField()
    let passwordTF = UITextField()
    var validateResult: Bool
    
    // When
    validateResult = fieldValidator.validateLoginTextField(loginTF: loginTF, passwordTF: passwordTF)
    
    // Then
    XCTAssertFalse(validateResult)
  }
  
  func testAsyncValidatorCorrectWithEmptyValues() throws {
    
    // Given
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let expectedResult = false
    var validateResult: Bool?
    let validatorExpectation = expectation(description: "Expectation in" + #function)
    
    // When
    fieldValidator.asyncValidateLoginTextField(loginTF: loginTF, passwordTF: passwordTF) { (isValid) in
      validateResult = isValid
      validatorExpectation.fulfill()
    }
    
    // Then
    waitForExpectations(timeout: 2.0) { (error) in
      if error != nil {
        XCTFail()
      }
    }
    XCTAssertEqual(expectedResult, validateResult)
  }
}
