package dao;


public class ProjectObj {
   private String project_idx, title, classname, sdate, fdate, content;
   
   public ProjectObj(String project_idx, String title, String classname, String sdate, String fdate, String content) {
      this.project_idx=project_idx;
      this.title=title;
      this.classname=classname;
      this.sdate=sdate;
      this.fdate=fdate;
      this.content=content;     
   }
   public String getProject_idx() {return this.project_idx; }
   public String getTitle() { return this.title; }
   public String getClassname() { return this.classname; }
   public String getSdate() { return this.sdate; }
   public String getFdate() { return this.fdate; }
   public String getContent() { return this.content; }

 }