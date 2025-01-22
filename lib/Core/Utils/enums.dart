enum ErrorType { socketException, formatException, networkException }

enum ConnectionStatus {
  online,
  offline,
}

enum ApiStatus{
  non,
  waiting,
  finishWithSuccess,
  finishWithError
}