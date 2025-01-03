// Abstract class for Role
abstract class Role {
  void displayRole();
}

// Class Person implementing Role
class Person implements Role {
  String name;
  int age;
  String address;

  Person({required this.name, required this.age, required this.address});

  @override
  void displayRole() {
    // To be overridden by subclasses
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

// Student class extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Teacher class extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Student Management System class
class StudentManagementSystem {
  static void main() {
    // Create a student instance
    Student student = Student(
      name: "John Doe",
      age: 20,
      address: "123 Main St",
      studentID: "S12345",
      grade: "A",
      courseScores: [90, 85, 82],
    );

    // Display student information
    print("Student Information:\n");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}\n");

    // Create a teacher instance
    Teacher teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      teacherID: "T67890",
      coursesTaught: ["Math", "English", "Bangla"],
    );

    // Display teacher information
    print("Teacher Information:\n");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}

// Entry point
void main() {
  StudentManagementSystem.main();
}