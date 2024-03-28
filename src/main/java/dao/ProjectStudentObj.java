package dao;

public class ProjectStudentObj {
   private String project_idx, title, id, content, sdate, attach, feedback;
   private int point;
   
   public ProjectStudentObj(String project_idx, String title, String id, String content, String sdate, String attach, int point, String feedback) {
      this.project_idx=project_idx;
      this.title=title;
      this.id=id;
      this.sdate=sdate;
      this.attach=attach;
      this.content=content;
      this.point=point;
      this.feedback=feedback;
   }
   public String getProject_idx() { return this.project_idx; }
   public String getTitle() { return this.title; }
   public String getSdate() { return this.sdate; }
   public String getID() { return this.id; }
   public String getContent() { return this.content; }
   public int getPoint() {return this.point;}
   public String getFeedback() { return this.feedback; }
   public String getAttach() { return this.attach; }
}