//
// DefaultAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class DefaultAPI {

    /**
     Search for authors
     
     - parameter q: (query) The search query for authors (e.g., author name). 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func searchAuthors(q: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SearchAuthors200Response?, _ error: Error?) -> Void)) -> RequestTask {
        return searchAuthorsWithRequestBuilder(q: q).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Search for authors
     - GET /search/authors.json
     - parameter q: (query) The search query for authors (e.g., author name). 
     - returns: RequestBuilder<SearchAuthors200Response> 
     */
    open class func searchAuthorsWithRequestBuilder(q: String) -> RequestBuilder<SearchAuthors200Response> {
        let localVariablePath = "/search/authors.json"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": (wrappedValue: q.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SearchAuthors200Response>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Search for books
     
     - parameter q: (query) The search query for books (e.g., book title, author, keywords). 
     - parameter fields: (query) The fields to return from the search. Use \&quot;*\&quot; to return all fields. To fetch availability data, use \&quot;availability\&quot;. Example: fields&#x3D;*,availability.  (optional)
     - parameter sort: (query) Sort the results by facets such as \&quot;new\&quot;, \&quot;old\&quot;, or \&quot;random\&quot;. Default is by relevance.  (optional)
     - parameter lang: (query) The two-letter ISO 639-1 language code. Influences the displayed language of results but doesn&#39;t exclude other language matches.  (optional)
     - parameter offset: (query) The offset for pagination (alternative to page). (optional)
     - parameter page: (query) The page number for pagination (starting from 1). (optional)
     - parameter limit: (query) The number of results to return per page. Default is 10. (optional, default to 10)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func searchBooks(q: String, fields: String? = nil, sort: String? = nil, lang: String? = nil, offset: Int? = nil, page: Int? = nil, limit: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SearchBooks200Response?, _ error: Error?) -> Void)) -> RequestTask {
        return searchBooksWithRequestBuilder(q: q, fields: fields, sort: sort, lang: lang, offset: offset, page: page, limit: limit).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Search for books
     - GET /search.json
     - parameter q: (query) The search query for books (e.g., book title, author, keywords). 
     - parameter fields: (query) The fields to return from the search. Use \&quot;*\&quot; to return all fields. To fetch availability data, use \&quot;availability\&quot;. Example: fields&#x3D;*,availability.  (optional)
     - parameter sort: (query) Sort the results by facets such as \&quot;new\&quot;, \&quot;old\&quot;, or \&quot;random\&quot;. Default is by relevance.  (optional)
     - parameter lang: (query) The two-letter ISO 639-1 language code. Influences the displayed language of results but doesn&#39;t exclude other language matches.  (optional)
     - parameter offset: (query) The offset for pagination (alternative to page). (optional)
     - parameter page: (query) The page number for pagination (starting from 1). (optional)
     - parameter limit: (query) The number of results to return per page. Default is 10. (optional, default to 10)
     - returns: RequestBuilder<SearchBooks200Response> 
     */
    open class func searchBooksWithRequestBuilder(q: String, fields: String? = nil, sort: String? = nil, lang: String? = nil, offset: Int? = nil, page: Int? = nil, limit: Int? = nil) -> RequestBuilder<SearchBooks200Response> {
        let localVariablePath = "/search.json"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": (wrappedValue: q.encodeToJSON(), isExplode: true),
            "fields": (wrappedValue: fields?.encodeToJSON(), isExplode: true),
            "sort": (wrappedValue: sort?.encodeToJSON(), isExplode: true),
            "lang": (wrappedValue: lang?.encodeToJSON(), isExplode: true),
            "offset": (wrappedValue: offset?.encodeToJSON(), isExplode: true),
            "page": (wrappedValue: page?.encodeToJSON(), isExplode: true),
            "limit": (wrappedValue: limit?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SearchBooks200Response>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
