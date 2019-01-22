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

public class stu
{
    public static int stuno = 0;
}
public partial class manage_admin_manager_change_student_info : System.Web.UI.Page
{
    liuchuxiongTableAdapters.学生表TableAdapter StuTable = new liuchuxiongTableAdapters.学生表TableAdapter();
    int index =0;
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
        gvStu.StartEdit(index);
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        index = Convert.ToInt32(e.CommandArgument);
        Response.Write("<script language=javascript>alert('删除后将无法恢复！')" + "</script>");
        gvStu.DeleteRow(index);

    }

    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        ASPxTextBox txtName = gvStu.FindEditFormTemplateControl("txtName") as ASPxTextBox;
        string Name = txtName.Text;
        if (Name == "")
        {
            Response.Write("<script>alert('姓名不能为空')</script>");
            return;
        }
        else if (Encoding.Default.GetByteCount(Name) > 10)
        {
            Response.Write("<script>alert('姓名长度太长，大于10')</script>");
        }
        else
        {
            gvStu.UpdateEdit();
        }
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvStu.CancelEdit();
    }
    protected void btnNew_Command(object sender, CommandEventArgs e)
    {
        gvStu.AddNewRow();
    }

    protected void gvStu_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxComboBox sexCbx = gvStu.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox zzmmCbx = gvStu.FindEditFormTemplateControl("zzmmCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvStu.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox majorCbx = gvStu.FindEditFormTemplateControl("majorCbx") as ASPxComboBox;
        ASPxComboBox ClassCbx = gvStu.FindEditFormTemplateControl("ClassCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStu.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxComboBox facultyCbx = gvStu.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        string zzmmNo = Convert.ToString(zzmmCbx.Value);
        string zzmmName = Convert.ToString(zzmmCbx.Text);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string majorNo = Convert.ToString(majorCbx.Value);
        string majorName = Convert.ToString(majorCbx.Text);
        string ClassNo = Convert.ToString(ClassCbx.Value);
        string ClassName = Convert.ToString(ClassCbx.Text);
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
        e.NewValues["专业号"] = majorNo;
        e.NewValues["专业"] = majorName;
        e.NewValues["班级号"] = ClassNo;
        e.NewValues["班级名"] = ClassName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["学院"] = facultyName;
        

    }
    protected void gvStu_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        ASPxComboBox sexCbx = gvStu.FindEditFormTemplateControl("sexCbx") as ASPxComboBox;
        ASPxComboBox zzmmCbx = gvStu.FindEditFormTemplateControl("zzmmCbx") as ASPxComboBox;
        ASPxComboBox ProvinceCbx = gvStu.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox majorCbx = gvStu.FindEditFormTemplateControl("majorCbx") as ASPxComboBox;
        ASPxComboBox ClassCbx = gvStu.FindEditFormTemplateControl("ClassCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStu.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        ASPxComboBox facultyCbx = gvStu.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        string zzmmNo = Convert.ToString(zzmmCbx.Value);
        string zzmmName = Convert.ToString(zzmmCbx.Text);
        string sexNo = Convert.ToString(sexCbx.Value);
        string sexName = Convert.ToString(sexCbx.Text);
        string ProvinceNo = Convert.ToString(ProvinceCbx.Value);
        string ProvinceName = Convert.ToString(ProvinceCbx.Text);
        string majorNo = Convert.ToString(majorCbx.Value);
        string majorName = Convert.ToString(majorCbx.Text);
        string ClassNo = Convert.ToString(ClassCbx.Value);
        string ClassName = Convert.ToString(ClassCbx.Text);
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
        e.NewValues["专业号"] = majorNo;
        e.NewValues["专业"] = majorName;
        e.NewValues["班级号"] = ClassNo;
        e.NewValues["班级名"] = ClassName;
        e.NewValues["城市代码"] = CityNo;
        e.NewValues["城市"] = CityName;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["学院"] = facultyName;
        学生表TableAdapter st = new 学生表TableAdapter();
        int i = st.GetData().Rows.Count;
        String str = Convert.ToString(st.GetData().Rows[i - 1][12]);
        //Response.Write("<script>alert('" + str + "')</script>");
        int n = Convert.ToInt32(str);
        stu.stuno = n + 1;
        e.NewValues["学号"] = Convert.ToString(stu.stuno);
        e.NewValues["密码"] = "202cb962ac59075b964b07152d234b70";
    }
    protected void provinceCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox ProvinceCbx = gvStu.FindEditFormTemplateControl("ProvinceCbx") as ASPxComboBox;
        ASPxComboBox CityCbx = gvStu.FindEditFormTemplateControl("CityCbx") as ASPxComboBox;
        string PValue = Convert.ToString(ProvinceCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.城市代码表TableAdapter CityAdapter = new liuchuxiongTableAdapters.城市代码表TableAdapter();
        DataTable dtCity = CityAdapter.GetDataByProvinceCode  (PValue);
        CityCbx.DataSource = dtCity;
        CityCbx.DataBind();
        CityCbx.SelectedIndex = 0;
    }
    protected void facultyCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox facultyCbx = gvStu.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        ASPxComboBox majorCbx = gvStu.FindEditFormTemplateControl("majorCbx") as ASPxComboBox;
        string facultyValue = Convert.ToString(facultyCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.专业表TableAdapter majorAdapter = new liuchuxiongTableAdapters.专业表TableAdapter();
        DataTable dtMajor = majorAdapter.GetDataByFaculty(facultyValue);
        majorCbx.DataSource = dtMajor;
        majorCbx.DataBind();
        majorCbx.SelectedIndex = 1;
    }
    protected void maojorCbx_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox ClassCbx = gvStu.FindEditFormTemplateControl("ClassCbx") as ASPxComboBox;
        ASPxComboBox majorCbx = gvStu.FindEditFormTemplateControl("majorCbx") as ASPxComboBox;
        string majorValue = Convert.ToString(majorCbx.SelectedItem.Value);
        liuchuxiongTableAdapters.班级表TableAdapter ClassAdapter = new liuchuxiongTableAdapters.班级表TableAdapter();
        DataTable dtClass = ClassAdapter.GetDataBymajor(majorValue);
        ClassCbx.DataSource = dtClass;
        ClassCbx.DataBind();
        ClassCbx.SelectedIndex = 0;
    }
    protected void txtName_TextChanged(object sender, EventArgs e)
    {

    }
}