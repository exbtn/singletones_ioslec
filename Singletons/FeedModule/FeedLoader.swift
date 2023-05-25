//
//  FeedLoader.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 25.05.2023.
//

import Foundation

protocol FeedLoader {
    func loadFeed(completion: ([FeedItem]) -> Void)
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        // load feed from remote
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        // load feed from local cache
    }
}

struct Reachability {
    static let networkAvailable = false
}

class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: ([FeedItem]) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}
