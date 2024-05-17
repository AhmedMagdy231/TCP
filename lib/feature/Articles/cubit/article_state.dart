part of 'article_cubit.dart';


class ArticleState {

  final Status articleCategoryStatus;
  final Status articleCategoryDetailsStatus;
  final Status articleDetailsStatus;

  ArticleState({
    this.articleCategoryStatus = Status.initial,
    this.articleCategoryDetailsStatus = Status.initial,
    this.articleDetailsStatus = Status.initial,
  });


  ArticleState copyWith({
    Status? articleCategoryStatus,
    Status? articleCategoryDetailsStatus,
    Status? articleDetailsStatus,


  }) => ArticleState(
    articleCategoryStatus: articleCategoryStatus?? this.articleCategoryStatus,
    articleCategoryDetailsStatus: articleCategoryDetailsStatus?? this.articleCategoryDetailsStatus,
    articleDetailsStatus: articleDetailsStatus?? this.articleDetailsStatus,

  );



}

// final class ArticleInitial extends ArticleState {}
//
//
//
// class GetArticleCategoryLoading extends ArticleState{}
// class GetArticleCategorySuccess extends ArticleState{}
// class GetArticleCategoryError extends ArticleState{}
//
// class GetArticleCategoryDetailsLoading extends ArticleState{}
// class GetArticleCategoryDetailsSuccess extends ArticleState{}
// class GetArticleCategoryDetailsError extends ArticleState{}
//
// class GetArticleDetailsLoading extends ArticleState{}
// class GetArticleDetailsSuccess extends ArticleState{}
// class GetArticleDetailsError extends ArticleState{}
//
//
// class NoInternetConnection extends ArticleState{}




