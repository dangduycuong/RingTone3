//
//  DataService.swift
//  RingTone3
//
//  Created by Cuong on 7/26/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class DataService {
    static let sharedInstance: DataService = DataService()
    
    func getRingTone(completedHandle: @escaping([RingToneModel]) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/kidanh/ringtones/master/ringtones.json") else { return }
        let urlRequest = URLRequest(url: url)
        
        let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let ringtones = try JSONDecoder().decode([RingToneModel].self, from: data!)
                DispatchQueue.main.async {
                    completedHandle(ringtones.self)
                }
            } catch {}
        })
        downloadTask.resume()
    }
}
