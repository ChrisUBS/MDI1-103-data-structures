import SwiftUI

struct Student: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var grade: Double
}

struct StudentsListView: View {
    // Array of students so we can bind each row individually
    @State private var students: [Student] = [
        .init(name: "Chris",  grade: 97),
        .init(name: "John",   grade: 89),
        .init(name: "Tom",    grade: 99),
        .init(name: "David",  grade: 92)
    ]

    // UI controls
    @State private var isAscending: Bool = true
    @State private var newName: String = ""
    @State private var newGrade: String = ""   // captured as text, converted to Double later

    // Computed property for the course average (updates whenever grades change)
    private var courseAverage: Double {
        guard !students.isEmpty else { return 0 }
        let sum = students.reduce(0) { $0 + $1.grade }
        return sum / Double(students.count)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // Header
                VStack(spacing: 6) {
                    Text("Student Grades")
                        .font(.title)
                        .foregroundColor(.blue)
                        .bold()
                    Text("Average Grade: \(courseAverage, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                }
                .padding(.top, 8)

                // Editable list (binding each row to student.grade)
                List {
                    ForEach($students) { $student in
                        HStack {
                            Text(student.name)
                            Spacer()
                            // Editable grade field - course average updates automatically
                            TextField("Grade",
                                      value: $student.grade,
                                      format: .number.precision(.fractionLength(1)))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .frame(width: 70)
                        }
                    }
                    .onDelete(perform: delete)
                }

                // Add-student bar
                HStack(spacing: 10) {
                    TextField("Student Name", text: $newName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Grade", text: $newGrade)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)

                    Button {
                        addStudent()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                    .disabled(!canAddStudent)
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        toggleSort()
                    } label: {
                        Label(isAscending ? "Sort ↑" : "Sort ↓",
                              systemImage: isAscending ? "arrow.up.circle" : "arrow.down.circle")
                    }
                    .accessibilityLabel("Sort by average grade")
                }
            }
            .tint(.blue)
        }
    }

    // Validation for add-student button
    private var canAddStudent: Bool {
        guard !newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        return Double(newGrade) != nil
    }

    // Add a new student
    private func addStudent() {
        guard let grade = Double(newGrade) else { return }
        students.append(.init(name: newName.trimmingCharacters(in: .whitespacesAndNewlines),
                              grade: grade))
        newName = ""
        newGrade = ""
        applyCurrentSort()
    }

    // Delete students from the list
    private func delete(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }

    // Toggle sorting order (ascending/descending)
    private func toggleSort() {
        isAscending.toggle()
        applyCurrentSort()
    }

    // Apply the current sort order
    private func applyCurrentSort() {
        students.sort { isAscending ? $0.grade < $1.grade : $0.grade > $1.grade }
    }
}

#Preview {
    StudentsListView()
}
