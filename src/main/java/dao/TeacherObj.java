package dao;

public class TeacherObj {
   private String id, pw, name, num;
   
   public TeacherObj(String id, String pw, String name, String num) {
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