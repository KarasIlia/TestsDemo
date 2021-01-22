//
//  ViewController.swift
//  TestsDemo
//
//  Created by Илья Карась on 21.01.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var loginTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var modulesFactory = ModulesFactoryImpl()
  var fieldValidator = FieldValidatorImpl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loginTextField.returnKeyType = .next
    passwordTextField.returnKeyType = .done
    loginTextField.delegate = self
    passwordTextField.delegate = self
    
    loginTextField.accessibilityIdentifier = "LoginTF"
    passwordTextField.accessibilityIdentifier = "PasswordTF"
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case loginTextField:
      passwordTextField.becomeFirstResponder()
    case passwordTextField:
      passwordTextField.resignFirstResponder()
      
      guard fieldValidator.validateLoginTextField(loginTF: loginTextField, passwordTF: passwordTextField) else {
        let alert = UIAlertController(title: "Warning", message: "Invalid Fields", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)

        break
      }
      
      toNextScreen()
    default:
      break
    }
    
    return true
  }

  private func toNextScreen() {
    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
    
    let screen = modulesFactory.getModule(by: .main)
    sceneDelegate.window?.rootViewController = screen
    sceneDelegate.window?.makeKeyAndVisible()
  }
}

