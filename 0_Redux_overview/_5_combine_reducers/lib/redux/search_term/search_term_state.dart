

// class SearchTermState { 

//   final String searchTerm;

//   const SearchTermState({required this.searchTerm});

//   factory SearchTermState.intialState()=> const SearchTermState(searchTerm: '');

//   SearchTermState copyWith({String? searchTerm}){
//     return SearchTermState(searchTerm: searchTerm?? this.searchTerm);
//   }
//   @override
//   String toString() =>"serched Term : $searchTerm";
// }


class SearchTermState { 

  final String searchTerm;


  SearchTermState({required this.searchTerm});

  factory SearchTermState.initialState()=>SearchTermState( searchTerm: '');
  
  @override
  String toString() =>"SerTermState(searchTerm: $searchTerm)";

   SearchTermState copyWith({String? searchTerm})=>SearchTermState( 
    searchTerm: searchTerm ?? this.searchTerm
  ); 
}