class KlontongModel {
  int? id;
  int? categoryId;
  String? namaKategori;
  String? sku;
  String? nama;
  String? deskripsi;
  int? berat;
  int? lebar;
  int? panjang;
  int? tinggi;
  String? image;
  int? harga;

  KlontongModel({
    this.id,
    this.categoryId,
    this.namaKategori,
    this.sku,
    this.nama,
    this.deskripsi,
    this.berat,
    this.lebar,
    this.panjang,
    this.tinggi,
    this.image,
    this.harga,
  });

  KlontongModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    categoryId = json["CategoryId"];
    namaKategori = json["namaKategori"];
    sku = json["sku"];
    nama = json["nama"];
    deskripsi = json["deskripsi"];
    berat = json["berat"];
    lebar = json["lebar"];
    panjang = json["panjang"];
    tinggi = json["tinggi"];
    image = json["image"];
    harga = json["harga"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["CategoryId"] = categoryId;
    data["namaKategori"] = namaKategori;
    data["sku"] = sku;
    data["nama"] = nama;
    data["deskripsi"] = deskripsi;
    data["berat"] = berat;
    data["lebar"] = lebar;
    data["panjang"] = panjang;
    data["tinggi"] = tinggi;
    data["image"] = image;
    data["harga"] = harga;
    return data;
  }

  static List<KlontongModel> fromJsonList(List? data) {
    if (data == null || data.isNotEmpty) {
      return [];
    }
    return data.map((e) => KlontongModel.fromJson(e)).toList();
  }
}
