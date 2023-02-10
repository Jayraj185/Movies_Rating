/// d : [{"i":{"height":741,"imageUrl":"https://m.media-amazon.com/images/M/MV5BYWVlMjVhZWYtNWViNC00ODFkLTk1MmItYjU1MDY5ZDdhMTU3XkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg","width":500},"id":"tt2631186","l":"Baahubali: The Beginning","q":"feature","qid":"movie","rank":3322,"s":"Prabhas, Rana Daggubati","y":2015},{"i":{"height":1200,"imageUrl":"https://m.media-amazon.com/images/M/MV5BOGNlNmRkMjctNDgxMC00NzFhLWIzY2YtZDk3ZDE0NWZhZDBlXkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg","width":675},"id":"tt4849438","l":"Baahubali 2: The Conclusion","q":"feature","qid":"movie","rank":6954,"s":"Prabhas, Rana Daggubati","y":2017},{"i":{"height":1100,"imageUrl":"https://m.media-amazon.com/images/M/MV5BMjliZmI3YmMtYWU1NS00MjVlLTkxZTQtYjIzYzFkNWNjOTZkXkEyXkFqcGdeQXVyMjYwMDk5NjE@._V1_.jpg","width":736},"id":"nm1659141","l":"Prabhas","rank":9757,"s":"Actor, Baahubali: The Beginning (2015)"},{"i":{"height":4096,"imageUrl":"https://m.media-amazon.com/images/M/MV5BNGU4NjRiMzAtNDQ4ZS00YmMyLTkzZTMtM2NiMmNiODZmZmUyXkEyXkFqcGdeQXVyMTY3MDU1MTI@._V1_.jpg","width":3276},"id":"tt4549714","l":"Bahubali","q":"TV series","qid":"tvSeries","rank":117753,"s":"Pankaj Tripathi, Mukesh Tiwari","y":2008,"yr":"2008-2009"},{"id":"nm12064020","l":"Bahubali","rank":594933,"s":"Director, MRP (2022)"},{"id":"tt5216536","l":"Hum Bahubali","q":"feature","qid":"movie","rank":589733,"s":"Rinku Ghosh, Brij Gopal","y":2008},{"i":{"height":2164,"imageUrl":"https://m.media-amazon.com/images/M/MV5BODVlOWViZTctZjJmNC00YmUyLTg0ODItYzgxNWRmM2NjNGM4XkEyXkFqcGdeQXVyMjY1NzA0Nzc@._V1_.jpg","width":5120},"id":"tt8093880","l":"Gommateshwara Lord Bahubali","q":"short","qid":"short","rank":2325460,"s":"Kallirroi Tziafeta","y":2018},{"i":{"height":3300,"imageUrl":"https://m.media-amazon.com/images/M/MV5BNjJjMjZlODQtYmUxYi00NzI2LTkzMmEtMzU3MDI3M2I2NzRhXkEyXkFqcGdeQXVyNzkyNTg2NzI@._V1_.jpg","width":2400},"id":"tt5523460","l":"Baahubali: The Lost Legends","q":"TV series","qid":"tvSeries","rank":44954,"s":"Viraj Adhav, Manoj Pandey","y":2017}]
/// q : "bahubali"
/// v : 1

class MoviesModel {
  MoviesModel({
      List<D>? d, 
      String? q, 
      num? v,}){
    _d = d;
    _q = q;
    _v = v;
}

  MoviesModel.fromJson(dynamic json) {
    if (json['d'] != null) {
      _d = [];
      json['d'].forEach((v) {
        _d?.add(D.fromJson(v));
      });
    }
    _q = json['q'];
    _v = json['v'];
  }
  List<D>? _d;
  String? _q;
  num? _v;
MoviesModel copyWith({  List<D>? d,
  String? q,
  num? v,
}) => MoviesModel(  d: d ?? _d,
  q: q ?? _q,
  v: v ?? _v,
);
  List<D>? get d => _d;
  String? get q => _q;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_d != null) {
      map['d'] = _d?.map((v) => v.toJson()).toList();
    }
    map['q'] = _q;
    map['v'] = _v;
    return map;
  }

}

/// i : {"height":741,"imageUrl":"https://m.media-amazon.com/images/M/MV5BYWVlMjVhZWYtNWViNC00ODFkLTk1MmItYjU1MDY5ZDdhMTU3XkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg","width":500}
/// id : "tt2631186"
/// l : "Baahubali: The Beginning"
/// q : "feature"
/// qid : "movie"
/// rank : 3322
/// s : "Prabhas, Rana Daggubati"
/// y : 2015

class D {
  D({
      I? i, 
      String? id, 
      String? l, 
      String? q, 
      String? qid, 
      num? rank, 
      String? s, 
      num? y,}){
    _i = i;
    _id = id;
    _l = l;
    _q = q;
    _qid = qid;
    _rank = rank;
    _s = s;
    _y = y;
}

  D.fromJson(dynamic json) {
    _i = json['i'] != null ? I.fromJson(json['i']) : null;
    _id = json['id'];
    _l = json['l'];
    _q = json['q'];
    _qid = json['qid'];
    _rank = json['rank'];
    _s = json['s'];
    _y = json['y'];
  }
  I? _i;
  String? _id;
  String? _l;
  String? _q;
  String? _qid;
  num? _rank;
  String? _s;
  num? _y;
D copyWith({  I? i,
  String? id,
  String? l,
  String? q,
  String? qid,
  num? rank,
  String? s,
  num? y,
}) => D(  i: i ?? _i,
  id: id ?? _id,
  l: l ?? _l,
  q: q ?? _q,
  qid: qid ?? _qid,
  rank: rank ?? _rank,
  s: s ?? _s,
  y: y ?? _y,
);
  I? get i => _i;
  String? get id => _id;
  String? get l => _l;
  String? get q => _q;
  String? get qid => _qid;
  num? get rank => _rank;
  String? get s => _s;
  num? get y => _y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_i != null) {
      map['i'] = _i?.toJson();
    }
    map['id'] = _id;
    map['l'] = _l;
    map['q'] = _q;
    map['qid'] = _qid;
    map['rank'] = _rank;
    map['s'] = _s;
    map['y'] = _y;
    return map;
  }

}

/// height : 741
/// imageUrl : "https://m.media-amazon.com/images/M/MV5BYWVlMjVhZWYtNWViNC00ODFkLTk1MmItYjU1MDY5ZDdhMTU3XkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg"
/// width : 500

class I {
  I({
      num? height, 
      String? imageUrl, 
      num? width,}){
    _height = height;
    _imageUrl = imageUrl;
    _width = width;
}

  I.fromJson(dynamic json) {
    _height = json['height'];
    _imageUrl = json['imageUrl'];
    _width = json['width'];
  }
  num? _height;
  String? _imageUrl;
  num? _width;
I copyWith({  num? height,
  String? imageUrl,
  num? width,
}) => I(  height: height ?? _height,
  imageUrl: imageUrl ?? _imageUrl,
  width: width ?? _width,
);
  num? get height => _height;
  String? get imageUrl => _imageUrl;
  num? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = _height;
    map['imageUrl'] = _imageUrl;
    map['width'] = _width;
    return map;
  }

}