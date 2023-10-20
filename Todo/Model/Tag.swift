import Foundation
import SwiftData

@Model
final class Tag {
    var name: String

    var todos: [Todo]?
    
    var color: RGBColor

    init(name: String = "", color: RGBColor) {
        self.name = name
        self.color = color
    }
}
