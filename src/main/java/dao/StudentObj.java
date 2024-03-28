package dao;

public class StudentObj {
   private String id, pw, name, num;
   
   public StudentObj(String id, String pw, String name, String num) {
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.num = num;
   }
   
   public String getID() {return this.id;}
   public String getPW() {return this.pw;}
   public String getName() {return this.name;}
   public String getNum() {return this.num;}
}