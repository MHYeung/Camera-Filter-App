class FilterModel {
  static List<double> getFilter(String filterName) {
    switch (filterName) {
      case 'landscape':
        return [3, -0.7, -0.7, -0.3, 0.2, -0.7, 3, -0.7, -0.3, 0.2, -0.7, -0.7, 3, -0.3, 0.2, 0, 0, 0, 1, 0];
      case'human':
        return [1.6, 0, 0,0, 0, 0, 1.6, 0, 0, 0, 0, 0, 1.6, 0, 0, 0, 0, 0, 1, 0];
      case'others':
        return [2, 0, 0,0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0];
      default:
        return [1, 0, 0,0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    }
  }
}
