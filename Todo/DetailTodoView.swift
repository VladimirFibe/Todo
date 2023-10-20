import SwiftUI
import SwiftData

struct DetailTodoView: View {
    @Bindable var todo: Todo
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $todo.name)
                .textFieldStyle(.roundedBorder)
            Toggle(todo.isDone ? "Done" : "Open", isOn: $todo.isDone)

            if let tags = todo.tags {
                HStack {
                    Text("Tags:")
                    ForEach(tags.sorted(by: { $0.name < $1.name })) { tag in
                        Text(tag.name)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).stroke(tag.color.color, lineWidth: 4))
                            .onTapGesture {
                                if let index = todo.tags?.firstIndex(where: { $0 == tag }) {
                                    todo.tags?.remove(at: index)
                                }
                            }
                    }
                }
            }
            Button(action: {
                let tag = Tag(name: "Tag", color: RGBColor(Color.blue))
                todo.tags?.append(tag)
            }) {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}

#Preview {
    do {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Todo.self, configurations: configuration)
        let example = Todo(name: "Name")
        return  NavigationStack {
            DetailTodoView(todo: example)
                .modelContainer(container)
        }
    } catch {
        fatalError()
    }
}
