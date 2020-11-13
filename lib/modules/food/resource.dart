class FoodResource {
  static String get categoriesSection => 'Categorias';

  static String get productsSection => 'Produtos';

  static String get emptyProductList => 'Nenhum produto disponível.';

  static String get warning => 'Aviso';

  //region recipes
  static String get recipesTitle => 'Receitas';

  static String get emptyRecipeList => 'Nenhuma receita disponível.';

  static String get ingredientsSectionTitle => 'Ingredientes';

  static String get directionsSectionTitle => 'Preparo';
  //endregion

  //region games
  static String get gamesTitle => 'Jogos';

  static String get emptyGameList => 'Nenhum jogo disponível.';
  //endregion

  //region search
  static String get search => 'Pesquisar';

  static String get searchPlaceholder => 'Categorias e produtos';

  static String get requiredSearchTextWarning =>
      'Texto da pesquisa não pode ser vazio.';

  static String get searchNoMatchWarning => 'Nenhum item encontrado.';
  //endregion

  //region Actions
  static String get ok => 'OK';
  //endregion
}
