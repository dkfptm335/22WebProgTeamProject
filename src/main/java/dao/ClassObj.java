package dao;


public class ClassObj {
   private String class_idx, class_name, class_detail, tea_id, tea_name;
   
   public ClassObj(String class_idx, String class_name, String class_detail, String tea_id, String tea_name) {
      this.class_idx=class_idx;
      this.class_name=class_name;
      this.class_detail=class_detail; 
      this.tea_id=tea_id;
      this.tea_name=tea_name;
   }
   public String getClass_idx() { return this.class_idx; }
   public String getClass_name() { return this.class_name; }
   public String getClass_detail() { return this.class_detail; }
   public String getTea_id() { return this.tea_id; }
   public String getTea_name() { return this.tea_name; }   
 }