import '../../../domain/entities/university_entity.dart';

abstract class DashboardRemoteDataSource {
  Future<List<String>> fetchCountries();
  Future<List<String>> fetchCourses();
  Future<List<UniversityEntity>> fetchTopUniversities();
  Future<List<UniversityEntity>> search(String query);
}
