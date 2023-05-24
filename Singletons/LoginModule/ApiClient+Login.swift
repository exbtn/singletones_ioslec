//
//  ApiClient+Login.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

extension ApiClient: LoginClient {
    func login(completion: (User?) -> Void) {
        execute(request: "login_request") { result in
            switch result {
            case .success:
                completion(User()) // map success data to user
            case .failure:
                completion(nil) // map error
            }
        }
    }
}
