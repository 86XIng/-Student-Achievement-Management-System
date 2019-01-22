using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_teacher_manager_dic_period_stat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvCourse.DataSource = odsStat;
            gvCourse.DataBind();
            this.ddlYear.Items.Insert(0, "--请选择--");
            this.ddlYear0.Items.Insert(0, "--请选择--");
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (ddlYear.SelectedIndex != 0 && ddlYear.SelectedIndex != 0)
        {
            if (ddlYear.SelectedIndex > ddlYear0.SelectedIndex)
            {
                lblError.Text = "请选择正确的学年";
            }
            else
            {
                gvCourse.DataSource = odsStat;
                gvCourse.DataBind();
            }
        }
        else
        {
            gvCourse.DataSource = odsStat;
            gvCourse.DataBind();
        }
    }
}