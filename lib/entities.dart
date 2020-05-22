class Employee {
  int id;
  String name;
  String address;
  String email;

  Employee({
    this.id,
    this.name,
    this.address,
    this.email
  });

  void fromJson(Map<String, dynamic> json) {
    id = json['employeeId'];
    name = json['employeeName'];
    address = json['employeeAddress'];
    email = json['employeeEmail'];
  }

  Map<String, dynamic> toJson() => {
    'employeeId': id,
    'employeeName': name,
    'employeeAddress': address,
    'employeeEmail': email
  };
}
