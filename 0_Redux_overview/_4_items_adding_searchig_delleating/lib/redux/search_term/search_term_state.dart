

class SearchTermState { 

  final String searchTerm;

  const SearchTermState({required this.searchTerm});

  factory SearchTermState.intialState()=> const SearchTermState(searchTerm: '');

  SearchTermState copyWith({String? searchTerm}){
    return SearchTermState(searchTerm: searchTerm?? this.searchTerm);
  }
  @override
  String toString() =>"serched Term : $searchTerm";
}