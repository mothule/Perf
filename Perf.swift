//
//  Perf.swift
//
//  Created by mothule on 2020/05/03.
//  Copyright © 2020 mothule. All rights reserved.
//

import Foundation

class Perf {
    struct Result {
        let label: String
        let numberOfCaptures: Int
        let fastestTime: TimeInterval
        let latestTime: TimeInterval
        let averageTime: TimeInterval
        
        var fastestTimeString: String { stringTimeForDisplay(time: fastestTime) }
        var latestTimeString: String { stringTimeForDisplay(time: latestTime) }
        var averageTimeString: String { stringTimeForDisplay(time: averageTime) }

        let pointThreshold: Double = 1000
        private func stringTimeForDisplay(time: TimeInterval) -> String {
            "\(ceil(time * pointThreshold) / pointThreshold)"
        }
        
        func toCSV() -> String {
            "\"\(label)\", \(fastestTimeString), \(latestTimeString), \(averageTimeString)"
        }
        
        func toDictionary() -> [String: Any] {
            return [
                "label": label,
                "fastest": fastestTimeString,
                "latest": latestTimeString,
                "average": averageTimeString
            ]
        }
    }
    
    typealias Closure = () -> Void
    
    private(set) var processTimes: [TimeInterval] = []
    let numberOfCapture: Int
    
    init(numberOfCapture: Int) {
        self.numberOfCapture = numberOfCapture
    }
    
    static func toCSV(from results: [Result]) -> String {
        results.map { $0.toCSV() }.joined(separator: "\n")
    }
    static func toDictionary(from results: [Result]) -> [[String: Any]] {
        results.map { $0.toDictionary() }
    }
    
    func capture(label: String = "", process: Closure) -> Result {
        (0..<numberOfCapture).forEach({ value in
            let begin = Date()
            process()
            let end = Date()
            let time = end.timeIntervalSince(begin)
            processTimes.append(time)
            
            print(".", terminator: "")
        })
        print("")
        
        var times = processTimes.sorted()
        times.removeFirst()
        times.removeLast()
        
        return .init(label: label,
                     numberOfCaptures: numberOfCapture,
                     fastestTime: times.min()!,
                     latestTime: times.max()!,
                     averageTime: times.reduce(0.0, +) / Double(times.count))
    }
}
