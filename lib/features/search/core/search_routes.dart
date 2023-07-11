enum SearchRoutes {
  search,
}

extension SearchRoutesX on SearchRoutes {
  String get name {
    switch (this) {
      case SearchRoutes.search:
        return 'search';
      default:
        return 'search';
    }
  }

  String get path {
    switch (this) {
      case SearchRoutes.search:
        return '/search';
      default:
        return '/search';
    }
  }
}
