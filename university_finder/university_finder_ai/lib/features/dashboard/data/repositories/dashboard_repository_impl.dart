import '../../domain/entities/university_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/remote/dashboard_remote_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl(this.remote);

  @override
  Future<List<String>> getCountries() => remote.fetchCountries();

  @override
  Future<List<String>> getCourses() => remote.fetchCourses();

  @override
  Future<List<UniversityEntity>> getTopUniversities() =>
      remote.fetchTopUniversities();

  @override
  Future<List<UniversityEntity>> search(String query) =>
      remote.search(query);
}
