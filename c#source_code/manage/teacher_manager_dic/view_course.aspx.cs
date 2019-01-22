using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using hjyTableAdapters;

public partial class manage_teacher_manager_dic_view_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "0")
        {
            Response.Redirect("../error_login.aspx");
        }
        if (!IsPostBack)
        {
            gvCourse.DataSource = odsAllCourse;
            gvCourse.DataBind();
            this.ddlYear.Items.Insert(0, "--请选择--");
            this.ddlTerm.Items.Insert(0, "--请选择--");
        }

    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (ddlYear.SelectedIndex != 0 && ddlYear.SelectedIndex != 0)
        {
            gvCourse.DataSource = odsCourse;
            gvCourse.DataBind();

        }
        else
        {
            gvCourse.DataSource = odsAllCourse;
            gvCourse.DataBind(); 
        }
    }
}