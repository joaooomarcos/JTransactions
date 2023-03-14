// https://gist.github.com/jonahaung/ed4c2f83bc8a650538b0f74421b042b8

import Foundation

extension DispatchQueue {
    func safeAsync(_ block: @escaping () -> Void) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async {
                block()
            }
        }
    }
}
