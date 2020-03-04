//
//  MainViewController.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit
import CleanArchitecture

final class MainViewController: UIViewController, MainViewProtocol {
  var interactor: MainInteractorProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Main"
    view.backgroundColor = .blue
    
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
    button.setTitle("Show Agreement", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    view.addSubview(button)
    
    let testButton = UIButton(frame: CGRect(x: 100, y: 200, width: 300, height: 50))
    testButton.setTitle("Solid", for: .normal)
    testButton.addTarget(self, action: #selector(testButtonAction), for: .touchUpInside)
    
    view.addSubview(testButton)
  }
  
  @objc private func buttonAction() {
    interactor.buttonTapped()
  }
  
  @objc private func testButtonAction() {
    interactor.testButtonTapped()
  }
}
