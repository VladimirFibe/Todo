import SwiftUI
import SwiftData

struct TodoRow: View {
    let todo: Todo
    var body: some View {
        HStack {
            Image(systemName: todo.isDone ? "checkmark.circle.fill": "circle")
                .foregroundStyle(todo.isDone ? .green : .gray)
            VStack(alignment: .leading) {
                Text(todo.name)
                Text(todo.creationDate, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    do {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Todo.self, configurations: configuration)
        let example = Todo(name: "Name")
        return  NavigationStack {
            TodoRow(todo: example)
                .modelContainer(container)
        }
    } catch {
        fatalError()
    }
}
