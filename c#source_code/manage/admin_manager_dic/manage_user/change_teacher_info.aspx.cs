using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DevExpress.Web;
using liuchuxiongTableAdapters;
using System.Text;

public class obj{
    public static int teano=0;
}
public partial class manage_admin_manager_change_teacher_info : System.Web.UI.Page
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
        gvTeacher.StartEdit(index);
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        index = Convert.ToInt32(e.CommandArgument);
        Response.Write("<script language=javascript>alert('删除后将无法恢复！')" + "</script>");
        gvTeacher.DeleteRow(index);
    }

    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        TextBox txtName = gvTeacher.FindEditFormTemplateControl("txtName") as TextBox;
        string Name = txtName.Text;
        if (Name == "")
        {
            Response.Write("<script>alert('姓名不能为空')</script>");
        }
        else if (Encoding.Default.GetByteCount(Name) > 10)
        {
            Response.Write("<script>alert('姓名长度太长，大于10')</script>");
        }
        else
        gvTeacher.UpdateEdit();

    }

    protected void btnNew_Command(object sender, CommandEventArgs e)
    {
        教师表TableAdapter ta = new 教师表TableAdapter();
        int i = ta.GetData().Rows.Count;
        String str = Convert.ToString(ta.GetData().Rows[i-1][0]);
        int n = Convert.ToInt32(str);
        obj.teano = n+1;
        gvTeacher.AddNewRow();
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvTeacher.CancelEdit();
    }

    protected void gvTeacher_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        ASPxComboBox sexCbx = gvTeacher.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox zzmmCbx = gvTeacher.FindEditFormTemplateControl("zzmmCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvTeacher.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox titleCbx = gvTeacher.FindEditFormTemplateControl("titleCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvTeacher.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxComboBox facultyCbx = gvTeacher.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        string zzmmNo = Convert.ToString(zzmmCbx.Value);
        string zzmmName = Convert.ToString(zzmmCbx.Text);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string titleNo = Convert.ToString(titleCbx.Value);
        string titleName = Convert.ToString(titleCbx.Text);
        string CityNo = Convert.ToString(CityCbx.Value);
        string CityName = Convert.ToString(CityCbx.Text);
        string facultyNo = Convert.ToString(facultyCbx.Value);
        string facultyName = Convert.ToString(facultyCbx.Text);
        e.NewValues["性别代码"] = sexNo;
        e.NewValues["性别"] = sexName;
        e.NewValues["政治面貌代码"] = zzmmNo;
        e.NewValues["政治面貌"] = zzmmName;
        e.NewValues["省份代码"] = ProvinceNo;
        e.NewValues["省份"] = ProvinceName;
        e.NewValues["职称代码"] = titleNo;
        e.NewValues["职称"] = titleName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["学院"] = facultyName;
        if (obj.teano >= 10)
        {
            e.NewValues["教工号"] = ("0000" + (obj.teano).ToString()).Substring(1, 5);
        }
        else
        {
            e.NewValues["教工号"] = ("0000" + (obj.teano).ToString());
        }
        
        e.NewValues["密码"] = "202cb962ac59075b964b07152d234b70";
    }
    protected void gvTeacher_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxComboBox sexCbx = gvTeacher.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox zzmmCbx = gvTeacher.FindEditFormTemplateControl("zzmmCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvTeacher.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox titleCbx = gvTeacher.FindEditFormTemplateControl("titleCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvTeacher.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxComboBox facultyCbx = gvTeacher.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        string zzmmNo = Convert.ToString(zzmmCbx.Value);
        string zzmmName = Convert.ToString(zzmmCbx.Text);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string titleNo = Convert.ToString(titleCbx.Value);
        string titleName = Convert.ToString(titleCbx.Text);
        string CityNo = Convert.ToString(CityCbx.Value);
        string CityName = Convert.ToString(CityCbx.Text);
        string facultyNo = Convert.ToString(facultyCbx.Value);
        string facultyName = Convert.ToString(facultyCbx.Text);
        e.NewValues["性别代码"] = sexNo;
        e.NewValues["性别"] = sexName;
        e.NewValues["政治面貌代码"] = zzmmNo;
        e.NewValues["政治面貌"] = zzmmName;
        e.NewValues["省份代码"] = ProvinceNo;
        e.NewValues["省份"] = ProvinceName;
        e.NewValues["职称代码"] = titleNo;
        e.NewValues["职称"] = titleName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["学院"] = facultyName;
    }
    protected void ProvinceCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox ProvinceCbx = gvTeacher.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvTeacher.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        string PValue = Convert.ToString(ProvinceCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.城市代码表TableAdapter CityAdapter = new liuchuxiongTableAdapters.城市代码表TableAdapter();
        DataTable dtCity = CityAdapter.GetDataByProvinceCode(PValue);
        CityCbx.DataSource = dtCity;
        CityCbx.DataBind();
        CityCbx.SelectedIndex = 0;
    }
}