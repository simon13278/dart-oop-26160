class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner (done for you)
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule (done for you)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method (done for you)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  // ": super(owner, balance)" builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo(); // run the parent's showInfo first
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 60, L = 0
  // Starting balance = 1600 RWF, Bus fare = 260 RWF, Discount = 10%

  // EXAMPLE (done for you): create a card and test the setter
  BusCard card = BusCard('Simeon', 1600);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to my full name, then call showInfo()
  card.owner = 'Izabayo Simeon';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay my bus fare 2 times, then call showInfo()
  card.pay(260);
  card.pay(260);
  card.showInfo();

  // TODO 8: create a StudentCard with my name, starting balance and discount
  StudentCard student = StudentCard('Izabayo Simeon', 1600, 10);

  // TODO 9: pay my bus fare with the student card, then call showInfo()
  student.pay(260);
  student.showInfo();
}

