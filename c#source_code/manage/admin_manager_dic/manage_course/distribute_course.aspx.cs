using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using hjyTableAdapters;
using System.Data;
public partial class manage_admin_manager_manage_course_distribute_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "1")
        {
            Response.Redirect("../../error_login.aspx");
        }
        if (!IsPostBack)
        {
            gvTeacher.DataSource = odsAllTeacher;
            gvTeacher.DataBind();
            this.ddlTeacherAcademy.Items.Insert(0, "--请选择--");
        }

    }
    protected void ddlTeacherAcademy_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTeacherAcademy.SelectedIndex != 0)
        {
            gvTeacher.DataSource = odsTeacherByA;
            gvTeacher.DataBind();
        }
        else
        {
            gvTeacher.DataSource = odsAllTeacher;
            gvTeacher.DataBind();
        }
    }
    protected void gvTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (ddlTeacherAcademy.SelectedIndex != 0)
        {
            gvTeacher.DataSource = odsTeacherByA;
            gvTeacher.DataBind();
            gvTeacher.PageIndex = e.NewPageIndex;
        }
        else
        {
            gvTeacher.DataSource = odsAllTeacher;
            gvTeacher.DataBind();
            gvTeacher.PageIndex = e.NewPageIndex;
        }
        
    }
}