using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class manage_change_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String 课程名 = Request["课程名"].ToString();
        String 课程学分 = Request["课程学分"].ToString();
        String 课程学时 = Request["课程学时"].ToString();
        String 课程类型 = Request["课程类型"].ToString();
        String 学院 = Request["学院"].ToString();
        String 开课时间 = Request["开课时间"].ToString();
        String 备注 = Request["备注"].ToString();
        String connStr = @"Data Source=DELL\SQLEXPRESS;Initial Catalog=deeptech;Integrated Security=True";
        SqlConnection conn = new SqlConnection(connStr);
        //try
        //{
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        String sqlStr = "INSERT INTO 课程表 (课程名,课程学分,课程学时,课程类型,学院,开课时间,备注) VALUES ("+课程名+","+课程学分+","+课程学时+","+课程类型+","+学院+","+开课时间+","+备注;
        cmd.CommandText = sqlStr;
        try{
            int res = Convert.ToInt32(cmd.ExecuteScalar());
        }catch{
            Response.Write("<script>alert('添加失败')</script>");
        }
        if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
        {
            Response.Write("<script>alert('添加成功')</script>");
            Response.Redirect("./Default.aspx");
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
        //}
        //catch
        //{
        //    Response.Redirect("./login.aspx?error=2");
        //}
            
     }
    }