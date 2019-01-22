using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using loginTableAdapters;
using System.Data;
using System.Security.Cryptography;
using System.Text;
public partial class login_studentLogin : System.Web.UI.Page
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
            stuTableAdapter st = new stuTableAdapter();
            DataTable dt = st.StuLogin(username);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["密码"].ToString() == password)
                {
                    Session["username"] = username;
                    Response.Redirect("../manage/student_manager.aspx?");
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