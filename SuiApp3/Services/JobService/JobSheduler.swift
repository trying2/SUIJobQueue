//
//  JobSheduler.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 14.11.2021.
//

import Foundation
import SwiftUI

class JobScheduler: ObservableObject {
    @Published var jobQueues: [JobQueue] = .init()
    @Published var jobResult: [JobResult] = .init()
    
    
    func addJob(job: JobQueue) {
        let queue = DispatchQueue(label: "JobQueue", qos: .userInteractive, attributes: .concurrent)
        queue.async {
            job.runJob { result in
                self.jobResult.append(result)
            }
        }
    }
}
