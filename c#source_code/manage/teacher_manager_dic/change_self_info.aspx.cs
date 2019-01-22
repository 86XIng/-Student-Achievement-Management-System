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

public partial class manage_teacher_manager_dic_change_self_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "0")
        {
            Response.Redirect("../error_login.aspx");
        }
    }
    protected void gvTSelf_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxComboBox ProvinceCbx = gvTSelf.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvTSelf.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxTextBox txtPassword = gvTSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
        string password = txtPassword.Text;
        password = Md5Hash(password);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string CityNo = Convert.ToString(CityCbx.Value);
        string CityName = Convert.ToString(CityCbx.Text); 
        e.NewValues["密码"] = password;
        e.NewValues["省份代码"] = ProvinceNo;
        e.NewValues["省份"] = ProvinceName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
    }
    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        ASPxTextBox txtPassword = gvTSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
        ASPxTextBox txtName = gvTSelf.FindEditFormTemplateControl("txtName") as ASPxTextBox;
        string password = txtPassword.Text;
        if (password.Length < 6)
        {
            Response.Write("<script>alert('密码不得少于6位')</script>");
            return;
        } else  gvTSelf.UpdateEdit();
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvTSelf.CancelEdit();
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
    protected void ProvinceCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox ProvinceCbx = gvTSelf.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvTSelf.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        string PValue = Convert.ToString(ProvinceCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.城市代码表TableAdapter CityAdapter = new liuchuxiongTableAdapters.城市代码表TableAdapter();
        DataTable dtCity = CityAdapter.GetDataByProvinceCode(PValue);
        CityCbx.DataSource = dtCity;
        CityCbx.DataBind();
        CityCbx.SelectedIndex = 0;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        gvTSelf.StartEdit(0);
    }

}