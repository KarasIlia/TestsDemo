//
//  ModulesFactory.swift
//  TestsDemo
//
//  Created by Илья Карась on 21.01.2021.
//

import UIKit

protocol ModulesFactory {
  func getModule(by type: Modules) -> UIViewController
}

enum Modules {
  case main
}

class ModulesFactoryImpl: ModulesFactory {
  
  func getModule(by type: Modules) -> UIViewController {
    switch type {
    case .main:
      return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController")
    }
  }
}
