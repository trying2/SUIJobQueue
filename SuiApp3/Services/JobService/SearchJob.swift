//
//  SearchJob.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 14.11.2021.
//

import Foundation

struct SearchJob: Job {
    var dataSource: [suffixItem]
    var searchText: String
    
    init(dataSource: [suffixItem], searchText: String) {
        self.dataSource = dataSource
        self.searchText = searchText
    }
    
    func onRun(completion: @escaping (JobResult) -> Void) {
        let starDate = Date()
        var resultArray: [suffixItem] = .init()
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).count != 0 {
            resultArray = dataSource.filter({$0.name.contains(searchText)})
        }
        let endDate = Date()
        let result = JobResult(timeResult: endDate.timeIntervalSince(starDate), searchText: searchText, result: resultArray)
        completion(result)
    }
    
    func onRemove() {
        //
    }
    
    
}
