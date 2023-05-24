//
//  Composer.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

class Composer {
    
    let api: ApiClient
    
    init(api: ApiClient = ApiClient.shared) {
        self.api = api
    }
    
    func compose() {
        let loginViewController = LoginViewController()
        loginViewController.login = { [weak self] completion in
            self?.api.login(completion: completion)
        }
        
        let feedViewController = FeedViewController()
        feedViewController.loadFeed = { [weak self] completion in
            self?.api.loadFeed(completion: completion)
        }
    }
}
