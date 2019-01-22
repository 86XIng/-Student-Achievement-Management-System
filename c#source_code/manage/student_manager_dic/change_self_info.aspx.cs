using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DevExpress.Web;
using System.Data;
using System.Security.Cryptography;
using System.Text;

public partial class manage_student_manager_dic_change_self_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "16")
        {
            Response.Redirect("../error_login.aspx");
        }
        if (Request["txtPassword"] != null)
        {
            ASPxTextBox txtPassword = gvStuSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
            txtPassword.Attributes["value"] = Request["txtPassword"].ToString();
        }
    }
   
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        gvStuSelf.StartEdit(0);
    }
    protected void gvStuSelf_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxComboBox sexCbx = gvStuSelf.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvStuSelf.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStuSelf.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxTextBox txtPassword = gvStuSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
        string password=txtPassword.Text;
        password=Md5Hash(password);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string CityNo = Convert.ToString(CityCbx.Value);
        string CityName = Convert.ToString(CityCbx.Text);
        e.NewValues["密码"] = password;
        e.NewValues["性别代码代码"] = sexNo;
        e.NewValues["性别"] = sexName;
        e.NewValues["省份代码"] = ProvinceNo;
        e.NewValues["省份"] = ProvinceName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
    }
    protected void gvStuSelf_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        ASPxComboBox sexCbx = gvStuSelf.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvStuSelf.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStuSelf.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxTextBox txtPassword = gvStuSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
        string password = txtPassword.Text;
        password = Md5Hash(password);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string CityNo = Convert.ToString(CityCbx.Value);
        string CityName = Convert.ToString(CityCbx.Text);
        e.NewValues["密码"] = password;
        e.NewValues["性别代码代码"] = sexNo;
        e.NewValues["性别"] = sexName;
        e.NewValues["省份代码"] = ProvinceNo;
        e.NewValues["省份"] = ProvinceName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
    }
    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        ASPxTextBox txtPassword = gvStuSelf.FindEditFormTemplateControl("txtPassword") as ASPxTextBox;
        string password = txtPassword.Text;
        if (password.Length < 6)
        {
            Response.Write("<script>alert('密码不得少于6位')</script>");
            return;
        }
        else  
            gvStuSelf.UpdateEdit(); 
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvStuSelf.CancelEdit();
    }

    protected void ProvinceCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox ProvinceCbx = gvStuSelf.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStuSelf.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        string PValue = Convert.ToString(ProvinceCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.城市代码表TableAdapter CityAdapter = new liuchuxiongTableAdapters.城市代码表TableAdapter();
        DataTable dtCity = CityAdapter.GetDataByProvinceCode(PValue);
        CityCbx.DataSource = dtCity;
        CityCbx.DataBind();
        CityCbx.SelectedIndex = 0;
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

}