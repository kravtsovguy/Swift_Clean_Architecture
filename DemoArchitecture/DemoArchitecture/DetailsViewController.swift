//
//  DetailsViewController.swift
//  DemoArchitecture
//
//  Created by Matvey Kravtsov on 02.03.2020.
//  Copyright © 2020 Matvey Kravtsov. All rights reserved.
//

import UIKit
import CleanArchitecture

protocol DetailsView: View {
  var callbacks: DetailsCallbacks? { get set }
}

final class DetailsViewController: UIViewController, DetailsView {
  var callbacks: DetailsCallbacks?
  var onDismiss: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .yellow
    
    let accept = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    accept.setTitle("Accept", for: .normal)
    accept.addTarget(self, action: #selector(acceptAction), for: .touchUpInside)
    accept.setTitleColor(.black, for: .normal)
    view.addSubview(accept)
    
    let decline = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
    decline.setTitle("Decline", for: .normal)
    decline.addTarget(self, action: #selector(declineAction), for: .touchUpInside)
    decline.setTitleColor(.black, for: .normal)
    view.addSubview(decline)
    
    let textField = TextFieldAssembly().assemble(callbacks: TextFieldCallbacks(onValidate: { print($0) }))
    textField.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
    textField.placeholder = "phone"
    view.addSubview(textField)
  }
  
  @objc private func acceptAction() {
    callbacks?.onAccept()
    onDismiss?()
  }
  
  @objc private func declineAction() {
    callbacks?.onDecline()
    onDismiss?()
  }
}
