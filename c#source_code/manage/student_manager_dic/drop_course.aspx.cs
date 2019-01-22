using chenxueTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using xingwenshengTableAdapters;
public partial class manage_student_manager_dic_drop_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "16")
        {
            Response.Redirect("../error_login.aspx");
        }
        sysTableAdapter st = new sysTableAdapter();
        DataTable dt = st.GetSwitch();
        string kaiguan = dt.Rows[0]["学生选课开关"].ToString();
        if (kaiguan == "1")
        {

            Response.Redirect("../error_switch_student.aspx");
        }
    }

    protected void btnDelCourse_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        GridViewRow gvr = (GridViewRow)button.Parent.Parent;
        int courseid = Convert.ToInt32(gvDelCourse.DataKeys[gvr.RowIndex]["授课号"].ToString());
        选课表TableAdapter xk = new 选课表TableAdapter();
        int tmp = xk.deleteCourse(Convert.ToString(Session["username"]), courseid);
        if (tmp > 0)
        {
            Response.Write("<script>alert('退课成功!')</script>");
            gvDelCourse.DataBind();
            gvCourseInfo.DataBind();
            return;
        }
        else
        {
            Response.Write("<script>alert('退课失败，请重新选择课程!')</script>");
            return;
        }
    }
   
}