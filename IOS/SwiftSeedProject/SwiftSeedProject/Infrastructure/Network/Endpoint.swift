//
//  Endpoint.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 3/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    
    case GetSources(category: SourceCategory?, language: Language?, country: Country?)
    case GetArticles(source: Source, sortBy: String?)
    
    // MARK: - Public Properties
    var method: Alamofire.HTTPMethod {
        switch self {
            case .GetSources:
                return .get
            case .GetArticles:
                return .get
        }
    }
    
    var url: URL {
        let baseUrl = URL.getBaseUrl()
        switch self {
            case .GetSources(let category, let language, let country):
                let url = baseUrl.appendingPathComponent("sources")
                return URL(string: "?category=\(category != nil ? category!.rawValue : "")&language=\(language != nil ? language!.rawValue : "")&country=\(country != nil ? country!.rawValue : "")", relativeTo: url)!
            case .GetArticles(let source, let sortBy):
                let url = baseUrl.appendingPathComponent("articles")
                guard let sortBy = sortBy else {
                    return URL(string: "?source=\(source.identifier)", relativeTo: url)!
                }
                return URL(string: "?source=\(source.identifier)&sortBy=\(sortBy)", relativeTo: url)!
        }
    }
}

private extension URL {
    static func getBaseUrl() -> URL {
        guard let info = Bundle.main.infoDictionary,
            let urlString = info["Base URL"] as? String,
            let url = URL(string: urlString) else {
                fatalError("Cannot get base url from Info.plist")
        }
        
        return url
    }
}
