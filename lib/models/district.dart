class District{
  District(this.data,this.name);
  int data;
  String name;
  District.fromJson(Map<String, dynamic> data)
  {
    this.name = data['district'];
    this.data = data['confirmed'];
  }

}