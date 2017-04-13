//
//  Api.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 4/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class RestClient {
    // MARK: - Private Properties
    private let manager: ApiManagerProtocol
    private let persistence: Persistence
    private let processSources: (Persistence, Result<JSON>, (ApiResult<Array<Source>>) -> Void) -> Void = { persistence, result, completion in
        switch result {
            case .success(let json):
                let sources = json["sources"].arrayValue.map { (json: JSON) -> Source in
                    let id = json["id"].stringValue
                    let source = persistence.getBy(entityIdentifier: id, entityName: Source.EntityName) as Source? ?? persistence.add(attributes: nil, entityName: Source.EntityName) as! Source
                    source.updateWithJSON(json: json)
                    return source
                }
                persistence.save()
                completion(ApiResult{ return sources })
            case .failure(let error):
                completion(ApiResult{ throw error })
        }
    }
    private let processArticles: (Persistence, Result<JSON>, (ApiResult<Array<Article>>) -> Void) -> Void = { persistence, result, completion in
        switch result {
            case .success(let json):
                let articles = json["articles"].arrayValue.map { (json: JSON) -> Article in
                    let article = persistence.add(attributes: nil, entityName: Source.EntityName) as! Article
                    article.updateWithJSON(json: json)
                    return article
                }
                persistence.save()
                completion(ApiResult{ return articles })
            case .failure(let error):
                completion(ApiResult{ throw error })
        }
    }
    
    // MARK: - Designated Initializer
    init(manager: ApiManagerProtocol = RestClientConfiguration.manager, persistence: Persistence) {
        self.manager = manager
        self.persistence = persistence
    }
    
    // MARK: - Public Methods
    func getSources(category: SourceCategory? = nil, language: Language? = nil, country: Country? = nil, completion: @escaping (ApiResult<Array<Source>>) -> Void) {
        let _ = manager.apiRequest(endpoint: .GetSources(category: category, language: language, country: country)).apiResponse { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.processSources(strongSelf.persistence, response.result, completion)
        }
    }
    
    func getArticles(source: Source, sortBy: String? = nil, completion: @escaping (ApiResult<Array<Article>>) -> Void) {
        let _ = manager.apiRequest(endpoint: .GetArticles(source: source, sortBy: sortBy)).apiResponse { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.processArticles(strongSelf.persistence, response.result, completion)
        }
    }
    
}
