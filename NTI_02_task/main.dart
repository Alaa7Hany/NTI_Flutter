import 'dart:io';

void main() {
  print('Welcome To our Theater! 👋\n');

  List<List<Seat>> seats = List.generate(5, (rowIndex) {
    return List.generate(5, (columnIndex) {
      return Seat(row: rowIndex, column: columnIndex, status: 'E');
    });
  });

  List<Customer> customers = [];

  while (true) {
    showMenue();
    int choice;
    try {
      choice = int.parse(stdin.readLineSync() ?? '0');
    } on Exception {
      print('❌ Invalid choice!');
      continue;
    }
    print('---------');
    switch (choice) {
      case 1:
        {
          while (true) {
            stdout.write('Please Enter Row number 1-5: ');
            int row;
            try {
              row = int.parse(stdin.readLineSync() ?? '0');
            } on Exception {
              print('❌ Invalid Row number!');
              continue;
            }
            if (row < 1 || row > seats.length) {
              print('❌ Invalid Row number!');
              continue;
            }
            stdout.write('Please Enter Column number 1-5: ');
            int column;
            try {
              column = int.parse(stdin.readLineSync() ?? '0');
            } on Exception {
              print('❌ Invalid Column number!');
              continue;
            }
            if (column < 1 || column > seats[row - 1].length) {
              print('❌ Invalid Column number!');
              continue;
            }
            if (!seats[row - 1][column - 1].isBooked) {
              stdout.write('Enter your name: ');
              String name = stdin.readLineSync() ?? '';

              stdout.write('Enter your phone number: ');
              String phone = stdin.readLineSync() ?? '';
              seats[row - 1][column - 1].bookSeat();
              customers.add(
                Customer(
                  name: name,
                  phone: phone,
                  seat: seats[row - 1][column - 1],
                ),
              );

              break;
            } else {
              print('❌ This seat is already booked!\n');
              continue;
            }
          }
          break;
        }
      case 2:
        {
          print('\n');
          for (int i = 0; i < seats.length; i++) {
            stdout.write('\t');
            for (int j = 0; j < seats[i].length; j++) {
              stdout.write(seats[i][j].status + ' ');
            }
            print('\n');
          }

          break;
        }
      case 3:
        {
          showCustomersData(customers);
          break;
        }
      case 4:
        {
          print('Goodbye! 👋');
          exit(0);
        }
      default:
        {
          print('❌ Invalid choice!');
          break;
        }
    }
  }
}

void showMenue() {
  print('----------------🎭-----------------');
  print('press 1 to book new seat');
  print('press 2 to show the theater seats');
  print('press 3 to show users data');
  print('press 4 to exit\n');
  stdout.write('👉 Please Enter your choice: ');
}

void showCustomersData(List<Customer> customers) {
  for (int i = 0; i < customers.length; i++) {
    print(
      'Seat: ${customers[i].seat.row + 1}, ${customers[i].seat.column + 1}',
    );
    print('Name: ${customers[i].name}');
    print('Phone: ${customers[i].phone}');

    print('---------------💺------------------');
  }
  if (customers.isEmpty) {
    print('No data found! 😢');
  }
}

class Customer {
  String name;
  String phone;
  Seat seat;

  Customer({required this.name, required this.phone, required this.seat});
}

class Seat {
  int row;
  int column;
  String status;
  bool isBooked = false;

  Seat({required this.row, required this.column, required this.status});

  void bookSeat() {
    this.status = 'O';
    isBooked = true;
    print('✅Seat booked successfully!');
  }
}
