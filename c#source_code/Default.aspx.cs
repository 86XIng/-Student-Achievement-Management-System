using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;
public partial class _Default : Page
{

    
    string connStr = @"Database=testss;Data Source=172.168.0.234;User Id=root;Password=shinevod";
    System.Data.DataSet ds = new System.Data.DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        
    }
    protected void ASPxDataView1_PageIndexChanged(object sender, EventArgs e)
    {

    }
}