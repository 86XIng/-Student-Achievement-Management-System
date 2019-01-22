<%@ WebHandler Language="C#" Class="switch_change" %>

using System;
using System.Web;
using xingwenshengTableAdapters;
using System.Data;
using System.IO;

public class switch_change : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string type = context.Request.Form["type"];
        context.Response.ContentType = "text/plain";
        if (type == "student")
        {
            sysTableAdapter st = new sysTableAdapter();
            DataTable dt = st.GetSwitch();
            string student_switch = dt.Rows[0]["学生选课开关"].ToString();
            if (student_switch == "0")
            {
                st.update_student("1");
                context.Response.Write("1"+type);
            }
            else
            {
                st.update_student("0");
                context.Response.Write("0"+type);
            }

        }else if (type == "teacher")
        {
            sysTableAdapter st = new sysTableAdapter();
            DataTable dt = st.GetSwitch();
            string teacher_switch = dt.Rows[0]["教师打分开关"].ToString();
            if (teacher_switch == "0")
            {
                st.update_teacher("1");
                context.Response.Write("1"+type);
            }
            else
            {
                st.update_teacher("0");
                context.Response.Write("0"+type);
            }
        }


        

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}