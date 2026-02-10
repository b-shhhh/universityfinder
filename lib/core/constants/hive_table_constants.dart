class HiveTableConstants {
  HiveTableConstants._(); // Private constructor to prevent instantiation

  // Database name
  static const String dbName = "university_finder_db";

  // Users
  static const int userTypeId = 0;
  static const String userTable = "user_table";

  // Universities / Colleges
  static const int universityTypeId = 1;
  static const String universityTable = "university_table";

  // Courses / Programs
  static const int courseTypeId = 2;
  static const String courseTable = "course_table";

  // Applications / Results
  static const int applicationTypeId = 3;
  static const String applicationTable = "application_table";
}
