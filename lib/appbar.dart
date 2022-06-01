class search {
  final int num;
  final int id;
  final String name;

  search( {required this.name,required this.num, required this.id});

  factory search.fromJson(Map<String, dynamic> json) {
    return new search(num: json['num'], id: json['id'], name: json['name']);
  }
}
