//
//  SearchHistoryViewModel.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 14.11.2021.
//

import Foundation

final class SearchHistoryViewModel: ObservableObject {
    @Injected var jobScheduler: JobScheduler?
    
    @Published var results: [JobResult] = .init()
    
    init() {
        getSearchResults()
    }
    
    func getSearchResults() {
        self.results = jobScheduler?.jobResult ?? [JobResult]()
        getMinAndMaxResultTime()
    }
    
    func getMinAndMaxResultTime() {
        var max: Double = 0
        var min: Double = 999999
        
        var minIndex = -1;
        var maxIndex = -1;
        
        for (index, _) in results.enumerated() {
            if results[index].timeResult < min {
                minIndex = index
                min = results[index].timeResult
            }
            
            if results[index].timeResult > max {
                maxIndex = index
                max = results[index].timeResult
            }
        }
        if minIndex != -1 {
            self.results[minIndex].isMin = true
        }
        if maxIndex != -1 {
            self.results[maxIndex].isMax = true
        }
    }
    
    
}
