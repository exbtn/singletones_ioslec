//
//  SingletoneExample.swift
//  Singletons
//
//  Created by Yevhenii Veretennikov on 24.05.2023.
//

class ApiClient {
    
    static let shared = ApiClient()
    
    init() {}
    
    func execute(request: String, completion: (Result<String, Error>) -> Void) {
        completion(.success("success"))
    }
}
