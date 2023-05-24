//
//  FeedViewController.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

import UIKit

struct FeedItem {}

protocol FeedClient {
    func loadFeed(completion: ([FeedItem]) -> Void)
}

class FeedViewController: UIViewController {
    
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed?() { feed in
            print(String(describing: feed))
        }
    }
}
