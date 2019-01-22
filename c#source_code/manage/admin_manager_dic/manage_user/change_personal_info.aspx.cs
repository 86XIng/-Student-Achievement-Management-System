using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DevExpress.Web;
using System.Security.Cryptography;
using System.Text;

public partial class manage_admin_manager_change_personal_info : System.Web.UI.Page
{
    int index = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "1")
        {
            Response.Redirect("../../error_login.aspx");
        }
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        index = Convert.ToInt32(e.CommandArgument);
        gvManager.StartEdit(index);
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        index = Convert.ToInt32(e.CommandArgument);
        Response.Write("<script language=javascript>alert('删除后将无法恢复！')" + "</script>");
        gvManager.DeleteRow(index);
    }


    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        TextBox txtPassword = gvManager.FindEditFormTemplateControl("txtPassword") as TextBox;
        string password = txtPassword.Text;
        if (password.Length < 6)
        {
            Response.Write("<script>alert('密码不得少于6位')</script>");
            return;
        }
        else { gvManager.UpdateEdit(); }
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvManager.CancelEdit();
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
    protected void gvManager_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        TextBox txtPassword = gvManager.FindEditFormTemplateControl("txtPassword") as TextBox;
        string password = txtPassword.Text;
        //if (password.Length < 6)
        //{
        //    Response.Write("<script>alert('密码不得少于6位')</script>");
        //    return ;
        //}
        password=Md5Hash(password);
        e.NewValues["密码"] = password;
    }
}