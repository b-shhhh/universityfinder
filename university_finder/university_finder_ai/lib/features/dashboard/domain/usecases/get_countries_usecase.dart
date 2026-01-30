import '../repositories/dashboard_repository.dart';

class GetCountriesUseCase {
  final DashboardRepository repository;

  GetCountriesUseCase(this.repository);

  Future<List<String>> call() {
    return repository.getCountries();
  }
}
