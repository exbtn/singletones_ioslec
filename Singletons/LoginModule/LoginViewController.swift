//
//  LoginViewController.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

import UIKit

struct User {}

protocol LoginClient {
    func login(completion: (User?) -> Void)
}

class LoginViewController: UIViewController {
    var login: (((User?) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login?() { user in
            print(String(describing: user))
        }
    }
}
