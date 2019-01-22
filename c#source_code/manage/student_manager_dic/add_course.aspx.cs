using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using xingwenshengTableAdapters;
using chenxueTableAdapters;

public partial class manage_student_manager_dic_add_course : System.Web.UI.Page
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
    
   

    protected void btnCourse_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        GridViewRow gvr = (GridViewRow)button.Parent.Parent;
        int courseid = Convert.ToInt32(gvCourse.DataKeys[gvr.RowIndex].Value.ToString());
        选课表1TableAdapter xk = new 选课表1TableAdapter();

            int tmp = xk.InsertCourse(Convert.ToString(Session["username"]), courseid);
            if (tmp > 0)
            {
                Response.Write("<script>alert('选课成功!')</script>");
                gvCourse.DataBind();
                gvCourseInfo.DataBind();
            }
            else
            {
                Response.Write("<script>alert('选课失败，请重新选择课程!')</script>");
            }
    }
}