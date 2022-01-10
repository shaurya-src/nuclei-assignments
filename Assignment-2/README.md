# ASSIGNMENT 2

### Topics Covered: Dart Serialization, Sorting.

Write a menu driven command line dart program that provides the following menu options:

- Add User details.
- Display User details.
- Delete User details
- Save User details.
- Exit

<br> 

The **option (1)** should ask for the following user details. All the following details are mandatory and the program should perform the required validations (like blank data, integer value for age, roll number etc). Roll Number is a key to identify the uniqueness among the students.

- Full Name
- Age
- Address
- Roll Number

- Set of courses he is interested to enroll. There are a total of 6 courses (Course A, B, C, D, E and F). It is mandatory for each student to choose 4 out of 6 courses. <br>

Once the validations are passed the user details should be added to an in memory data structure. The data structure should always keep the records sorted in ascending order. By default the records should be sorted on full name. If the name is the same for two students then sorting should be based on the roll number.

The **option (2)** should display the user details in the following format. Also the user should be provided with an option to sort the results (either in ascending or descending order) based on name, roll number, age, address.

<hr>
Name &nbsp;&nbsp; Roll Number &nbsp;&nbsp; Age &nbsp;&nbsp; Address &nbsp;&nbsp; Courses
<hr> 
A &nbsp;&nbsp; 43 &nbsp;&nbsp; 1 &nbsp;&nbsp; 22 A, GGn &nbsp;&nbsp; A, C, D, E

<hr>

The **option (3)** should ask for roll number and delete the student details corresponding to that roll number. Throw a proper user friendly message in case the roll number entered by the user does not exist.

The **option (4)** should save the in memory details of all the users to a disk. Use dart’s serialization capabilities to serialize the in memory data to disk. If the user terminates the program after choosing this option the user’s data should be saved to disk and next time the user runs the program the in-memory collection should be pre populated with data already stored on the disk.

The **option (5)** should terminate the program but before termination it should ask the user if he wants to save his latest changes (additions, deletions of users) to disk.

#### Key Points:

- Use dart’s functional programming for sorting.
- Coding conventions should be followed.
- Proper validation / info messages should be thrown on console.
- Student Info, course info, serialization code and command line menu code should be encapsulated in separate independent dart classes.
- Where ever required please write comments in the code to make it more understandable.
- TDD methodology should be used
