//
//  JobQueue.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 14.11.2021.
//

import Foundation

protocol Job {
    func onRun(completion: @escaping (JobResult) -> Void) -> Void
    func onRemove() -> Void
}
struct JobResult: Hashable {
    var timeResult: Double
    var searchText: String
    var result: [AnyHashable]
    var isMin: Bool = false
    var isMax: Bool = false
}

class JobQueue {
    var job: Job
    
    init(job: Job) {
        self.job = job
    }
    
    func runJob(completion: @escaping (JobResult) -> Void) {
        self.job.onRun { result in
            completion(result)
        }
    }
}
