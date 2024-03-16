class Ward{
  String? Id;
  String? Name;
  String? Level;
  Ward({
    this.Id,
    this.Name,
    this.Level
});
  Ward.fromMap(Map<String, dynamic> map) {
    Id = map['Id'];
    Name = map['Name'];
    Level = map['Level'];
  }
}