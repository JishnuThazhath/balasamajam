class APIConstants {
  const APIConstants._();

  //static const String apiEndpoint = "http://65.2.34.94:8080";
  static const String apiEndpoint = "http://localhost:8080";

  static const String fetchMembers = "$apiEndpoint/fetchMembers";
  static const String addMember = "$apiEndpoint/addMember";

  static const String fetchPayment = "$apiEndpoint/fetchPayments";
  static const String addPayment = "$apiEndpoint/addPayment";

  static const String fetchExpenses = "$apiEndpoint/fetchExpenses";
  static const String addExpense = "$apiEndpoint/addExpense";

  static const String getAllMembers = "$apiEndpoint/getAllMembers";

  static const String getAllAdmins = "$apiEndpoint/getAllAdmins";
}

enum LocalAppState { TOKEN, IS_LOGGED_IN, ADMIN_ID }
