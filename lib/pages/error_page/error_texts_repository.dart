class ErrorPageRepository {
  static const _data = <int, ErrorPageData>{
    500: ErrorPageData('Что-то пошло не так', ''),
    404: ErrorPageData(
        'Страница не найдена', 'Мы не смогли найти данную страницу.'),
  };

  static const ErrorPageData networlError = ErrorPageData('Что-то с сетью',
      'Или у нас, или у вас. Пожалуйста, проверье соединение, роутер и попробуйте еще разок');

  ErrorPageData data(int? statusCode) {
    return _data[statusCode] ?? networlError;
  }
}

class ErrorPageData {
  final String title;
  final String description;

  const ErrorPageData(this.title, this.description);
}
