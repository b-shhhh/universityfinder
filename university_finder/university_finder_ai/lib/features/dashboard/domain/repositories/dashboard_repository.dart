import '../entities/university_entity.dart';

abstract class DashboardRepository {
  Future<List<String>> getCountries();
  Future<List<String>> getCourses();
  Future<List<UniversityEntity>> getTopUniversities();
  Future<List<UniversityEntity>> search(String query);
}
