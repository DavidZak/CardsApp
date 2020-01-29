//
//  Debouncer.swift
//  CardsApp
//
//  Created by David Zakharyan on 29.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

//Without rx and Combine need use something like that
class Debouncer {
    
    var searchTask: DispatchWorkItem?
    var delay: Double

    init(_ delay: Double = 0.5) {
        self.delay = delay
    }
    
    func executeTask(_ block: @escaping () -> Void) {
        // Cancel previous task if any
        self.searchTask?.cancel()

        // Replace previous task with a new one
        let task = DispatchWorkItem { [weak self] in
            block()
        }
        self.searchTask = task

        // Execute task in delay seconds (if not cancelled !)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: task)
    }
}
