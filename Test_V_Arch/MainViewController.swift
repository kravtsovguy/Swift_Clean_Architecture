//
//  MainViewController.swift
//  Test_V_Arch
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainViewProtocol {
  var interactor: MainInteractorProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .blue
    
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
    button.setTitle("Show Agreement", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    view.addSubview(button)
  }
  
  @objc private func buttonAction() {
    interactor.buttonTapped()
  }
}
