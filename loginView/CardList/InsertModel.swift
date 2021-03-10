//
//  InsertModel.swift
//  CartList
//
//  Created by Derrick on 2021/03/09.
//

import Foundation

class InsertModel: NSObject {
    
    var urlPath = "http://54.180.159.210:8080/greenmarket/cardList.jsp"
    
    
    // AddView Controller에서 값받는 것들
    func insertItems(cType: String, cNumber: String, cValidDate: String, cBirthday: String) -> Bool {
        var result: Bool = true
        
        // ?code=11&name='name'
        let urlAdd = "?cType=\(cType)&cNumber=\(cNumber)&cValidDate=\(cValidDate)&cBirthday=\(cBirthday)"
        urlPath = urlPath + urlAdd
        
        // 한글 url Encoding
        // EN 써있으면 안바뀐다.
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 실질적인 url
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to insert data")
                result = false
            }
            else{
                print("Data is inserted")
                result = true
            }
        }
        // task 실행
        task.resume()
        return result
    }
}
