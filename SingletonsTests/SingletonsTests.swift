//
//  SingletonsTests.swift
//  SingletonsTests
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

import XCTest
@testable import Singletons

final class SingletonsTests: XCTestCase {

    func test_composer_withSharedApiClient() {
        let composer = Composer()
        composer.compose()
        // test results
    }
    
    func test_composer_withSuccessApiClient() {
        let apiClient = SuccessApiClient(result: "some_data")
        let composer = Composer(api: apiClient)
        composer.compose()
        // test results
    }
    
    func test_composer_withFailingApiClient() {
        let apiClient = FailureApiClient(error: NSError(domain: "bad_request", code: -1))
        let composer = Composer(api: apiClient)
        composer.compose()
        // test results
    }
}

class SuccessApiClient: ApiClient {
    let result: String
    
    init(result: String = "default_data") {
        self.result = result
    }
    
    override func execute(request: String, completion: (Result<String, Error>) -> Void) {
        completion(.success(result))
    }
}

class FailureApiClient: ApiClient {
    let error: Error
    
    init(error: Error) {
        self.error = error
    }
    
    override func execute(request: String, completion: (Result<String, Error>) -> Void) {
        completion(.failure(error))
    }
}
