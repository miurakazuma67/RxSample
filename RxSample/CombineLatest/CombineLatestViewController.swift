//
//  ViewController1.swift
//  RxSample
//
//  Created by 三浦　一真 on 2024/03/26.
//
import Foundation
import UIKit
import RxSwift
import RxCocoa

final class CombineLatestViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        let emailValid = emailTextField.rx.text.orEmpty
            .map { $0.contains("@") && $0.contains(".") }
            .share(replay: 1)

        let passwordValid = passwordTextField.rx.text.orEmpty
            .map { $0.count >= 8 }
            .share(replay: 1)

        let passwordsMatch = Observable.combineLatest(passwordTextField.rx.text.orEmpty, confirmPasswordTextField.rx.text.orEmpty)
            .map { $0 == $1 }
            .share(replay: 1)

        Observable.combineLatest(emailValid, passwordValid, passwordsMatch) { $0 && $1 && $2 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

    @IBAction func tappedLogin(_ sender: Any) {
        
    }
}
