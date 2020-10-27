import 'dart:html';
import 'dart:svg';

// Establish Elements
InputElement usernameInput;
InputElement passwordInput;
ButtonElement loginButton;
ButtonElement signUpButton;
DivElement loginPanel;
TextElement outputText;
TableColElement debtorID;
TableColElement debtorTitle;
TableColElement debtorFirstName;
TableColElement debtorLastName;
TableColElement debtorPhone;
TableColElement debtorEmail;
TableColElement debtorCurrency;

// Define user
class User {
  String username;
  String password;

  User(this.username, this.password);

  getUsername() {
    return username;
  }

  getPassword() {
    return password;
  }
}

// Define Debt
class Debt {
  int amount;
  int owing;
  bool interest;
  int interestPercentage;
  var interestDate;

  Debt(this.amount, this.owing,
      [this.interest, this.interestPercentage, this.interestDate]);

  getDebt() {
    return '\$' '$amount';
  }

  getDate() {
    return interestDate;
  }
}

//Define Debtor
class Debtor {
  int id;
  String title;
  String firstName;
  String lastName;
  String phone;
  String email;
  String currency;
  var debt = Debt(1000, 0, false, 0, DateTime.now());

  Debtor(this.id, this.title, this.firstName, this.lastName, this.phone,
      this.email,
      [this.currency]);

  printInfo() {
    return '''
debtor: $id
  title:        $title
  first name:   $firstName
  last name:    $lastName
  phone:        $phone
  email:        $email
  currency:     $currency
  debt:         ${debt.getDebt()}
  date:         ${debt.getDate()}
''';
  }
}

void main() {
  //querySelector('#output').text = 'Lender App v0.1';
  usernameInput = querySelector('#username');
  passwordInput = querySelector('#password');
  loginButton = querySelector('#loginButton');
  loginButton.onClick.listen(Login);
}

void Login(Event e) {
  var username = usernameInput.value;
  var password = passwordInput.value;
  if(username.length >= 4 && password.length >= 8) {
    var debtor1 = Debtor(
        0, 'mr', 'first name', 'last name', '0123-456-789', 'email@email.com');
    querySelector('#outputText').text = debtor1.printInfo();
    querySelector('#debtorID').innerHtml = debtor1.id.toString();
    querySelector('#debtorTitle').innerHtml = debtor1.title.toString();
    querySelector('#debtorFirstName').innerHtml = debtor1.firstName.toString();
    querySelector('#debtorLastName').innerHtml = debtor1.lastName.toString();
    querySelector('#debtorPhone').innerHtml = debtor1.phone.toString();
    querySelector('#debtorEmail').innerHtml = debtor1.email.toString();
    querySelector('#debtorCurrency').innerHtml = debtor1.currency.toString();

  }
}