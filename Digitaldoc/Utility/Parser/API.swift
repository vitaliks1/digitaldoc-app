//
//  API.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import Foundation

class API {
    static func appConfiguration(compeltion:@escaping(StackTemplateConfig?, String?) -> Void){
        let Url = String(format: BASE_URL + homeResponseURL)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 15.0
        let session = URLSession.shared
        
        session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    let jsonDecoder  =  JSONDecoder()
                    let appConfigResponse = try jsonDecoder.decode(AppParser.self, from: data)
                    do{
                        compeltion(appConfigResponse.stackTemplate, nil)
                    }
                }catch{
                    print(error.localizedDescription)
                    compeltion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }
}
