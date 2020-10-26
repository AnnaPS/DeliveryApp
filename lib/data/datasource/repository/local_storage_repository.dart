abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<void> clearInformation();
}
