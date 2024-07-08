class ResultModel {}

class ErrorModel extends ResultModel {}

class ExceptionModel extends ResultModel {}

class ListOf<T extends ResultModel> extends ResultModel {
  List<T> data;
  ListOf({
    required this.data,
  });
}

class SuccessModel extends ResultModel {}
