<%@ WebHandler Language="C#" Class="get_switch" %>

using System;
using System.Web;
using xingwenshengTableAdapters;
using System.Data;
using System.IO;

public class get_switch : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string msg = "{{\"teacher\":\"{0}\",\"student\":\"{1}\"}}";
        context.Response.ContentType = "text/plain";
        sysTableAdapter st = new sysTableAdapter();
        DataTable dt = st.GetSwitch();
        string student_switch = dt.Rows[0]["学生选课开关"].ToString();
        string teacher_switch = dt.Rows[0]["教师打分开关"].ToString();
        
        context.Response.Write(string.Format(msg,teacher_switch , student_switch));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}