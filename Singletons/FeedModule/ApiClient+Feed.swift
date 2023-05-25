//
//  ApiClient+Feed.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

extension ApiClient: FeedLoader {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        execute(request: "feed_request") { result in
            switch result {
            case .success:
                completion([FeedItem()]) // map success data to user
            case .failure:
                completion([]) // map error
            }
        }
    }
}
