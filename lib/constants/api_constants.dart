class APIConstants {
  const APIConstants._();

  static const String apiEndpoint = "http://localhost:8080";
  static const String searchMember = "$apiEndpoint/member/payable";
  static const String addMember = "$apiEndpoint/member/add";
  static const String addExpense = "$apiEndpoint/expense/add";
}

enum LocalAppState { TOKEN, IS_LOGGED_IN }
