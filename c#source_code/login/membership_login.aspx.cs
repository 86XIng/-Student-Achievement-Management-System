using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using xingwenshengTableAdapters;
using System.Data;

public partial class login_membership_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private static string Md5Hash(string input)
    {
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }
        return sBuilder.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string veri = verify.Value;
        if (veri == "1")
        {
            var username = Request["username"];
            var password = Request["password"];
            password = Md5Hash(password);
            //Response.Write("<script>alert('"+password+"')</script>");
            membershipTableAdapter mt = new membershipTableAdapter();
            DataTable dt = mt.GetUser(username);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["密码"].ToString() == password)
                {
                    Session["username"] = username;
                    string type = dt.Rows[0]["用户类型"].ToString(); // 0教师 1管理员 16学生
                    Session["type"] = type;
                    if (type == "1")
                    {
                        Response.Redirect("../manage/admin_manager.aspx");
                    }else if (type == "0")
                    {
                        Response.Redirect("../manage/teacher_manager.aspx");
                    }
                    else if (type == "16")
                    {
                        Response.Redirect("../manage/student_manager.aspx");
                    }

                }
                else
                {
                    Response.Write("<script>alert('密码错误')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('用户不存在')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('请拖动滑块以完成验证')</script>");
        }

    }
}