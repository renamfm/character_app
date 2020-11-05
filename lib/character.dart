class Character{
  String name;
  String classe;
  String race;
  int level;

  Character(String name, String classe, String race, int level){
    this.name = name;
    this.classe = classe;
    this.race = race;
    this.level = level;
  }

  @override
  String toString() {
    return 'Name:'+this.name+", class:"+this.classe+", race:"+this.race+", level:"+level.toString();
  }
}