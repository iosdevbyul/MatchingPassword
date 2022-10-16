//
//  ViewController.swift
//  MatchingPassword
//
//  Created by PNT001 on 2022/10/16.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var myBtn: UIButton!
    
    var viewModel: MyViewModel!
    
    private var mySubscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        viewModel = MyViewModel()
        
        passwordTextField
            .myTextPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.passwordInput, on: viewModel)
            .store(in: &mySubscription)// to manage the memory
        
        passwordConfirmTextField
            .myTextPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.passwordConfirmInput, on: viewModel)
            .store(in: &mySubscription)
    }


}

extension UITextField {
    var myTextPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{ $0.object as? UITextField}
            .map{ $0.text ?? ""}
            .print()
            .eraseToAnyPublisher()
    }
}
