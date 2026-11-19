// Dart OOP Bug Hunt Assignment
 // Student: Izabayo Simeon
//Reg:26160/2024
 //d=0
//t=60

class Phone {
  // FIX 1: Initialize fields
  String _brand = '';
  int _battery = 0;

  // Constructor
  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  // Getter for battery
  int get battery {
    return _battery;
  }

  // FIX 4: Setter with validation
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
  }

  // Display phone information
  void showInfo() {
    print('Brand: $_brand');
    print('Battery: $_battery%');
  }
}

// Inheritance
class SmartPhone extends Phone {
  String _system = '';

  // FIX 2: Call parent constructor
  SmartPhone(String brand, int battery, String system)
      : super(brand, battery) {
    _system = system;
  }

  // FIX 3: No @override needed
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  // Create Phone object
  Phone p = Phone('Tecno', 50);

  // FIX 5: Use setter
  p.battery = 100;

  // Read battery using getter
  print('Battery: ${p.battery}%');

  p.showInfo();

  print('-------------------');

  // Create SmartPhone object
  SmartPhone s = SmartPhone('Samsung', 80, 'Android');

  s.showInfo();
  s.restart();

  print('-------------------');

  // Test invalid battery
  p.battery = 150;
  print('Final battery: ${p.battery}%');
}

