import 'errors/failures.dart';

String base_url = "https://jsonplaceholder.typicode.com";

String mapFailuresToStrings(Failures failures) {
  switch (failures.runtimeType) {
    case ServiceFailure:
      return "Service Not available";
    default:
      return "Unkown Problem";
  }
}
