import SwiftUI

struct Task: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Button(action: {
                            task.isCompleted.toggle()
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                                .foregroundColor(.black)
                        }
                        TextField("Task Title Goes Here", text: $task.title)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func addTask() {
        let newTask = Task(title: newTaskTitle, isCompleted: false)
        tasks.append(newTask)
        newTaskTitle = ""
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
