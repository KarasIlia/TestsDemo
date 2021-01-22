//
//  FieldValidator.swift
//  TestsDemo
//
//  Created by Илья Карась on 21.01.2021.
//

import UIKit

protocol FieldValidator {
  
  func validateLoginTextField(loginTF: UITextField, passwordTF: UITextField) -> Bool
  func asyncValidateLoginTextField(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void)
}

class FieldValidatorImpl: FieldValidator {
  
  func validateLoginTextField(loginTF: UITextField, passwordTF: UITextField) -> Bool {
    return loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
  }
  
  func asyncValidateLoginTextField(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5) {
      DispatchQueue.main.async {
        let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
        completion(result)
      }
    }
  }
}
