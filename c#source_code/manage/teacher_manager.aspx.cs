using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_teacher_manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["type"]==null||Session["type"].ToString() != "0")
        {
            Response.Redirect("./error_login.aspx");
        }
    }
}