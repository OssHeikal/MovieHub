abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnexpectedFailure extends Failure {}

class NetworkFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}
