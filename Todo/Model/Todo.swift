import Foundation
import SwiftData

@Model
final class Todo {

    var creationDate: Date = Date()
    var name: String = ""
    var isDone: Bool = false
    var priority: Int = 0

    @Attribute(.externalStorage)
    var image: Data?

    var tags: [Tag]?
    
    init(name: String = "", priority: Int = 0) {
        self.name = name
        self.priority = priority
    }
}
