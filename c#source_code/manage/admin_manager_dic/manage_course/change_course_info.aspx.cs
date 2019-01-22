using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DevExpress.Web;
using System.Text.RegularExpressions;
using System.Text;

public class PublicValue
{
    public static string relativePath = null;
}
public partial class manage_admin_manager_manage_course_change_course_info : System.Web.UI.Page
{
    liuchuxiongTableAdapters.课程表TableAdapter CourseTable = new liuchuxiongTableAdapters.课程表TableAdapter();
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
        gvCourse.StartEdit(index);
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        index = Convert.ToInt32(e.CommandArgument);
        Response.Write("<script language=javascript>alert('删除后将无法恢复！')" + "</script>");
        gvCourse.DeleteRow(index);
    }
    protected void btnNew_Command(object sender, CommandEventArgs e)
    {
        gvCourse.AddNewRow();
    }
    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        TextBox txtCourseScore = gvCourse.FindEditFormTemplateControl("txtCourseScore") as TextBox;
        TextBox txtCourseTime = gvCourse.FindEditFormTemplateControl("txtCourseTime") as TextBox;
        TextBox txtCourseName = gvCourse.FindEditFormTemplateControl("txtCourseName") as TextBox;
        string name =txtCourseName.Text;

        txtCourseScore.Text = Convert.ToString(Regex.Match(txtCourseScore.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        txtCourseTime.Text = Convert.ToString(Regex.Match(txtCourseTime.Text, @"^[1-9]\d*$"));
        if (Encoding.Default.GetByteCount(name) > 50) 
        {
            Response.Write("<script>alert('课程名称长度过长，应该小于50')</script>");
        }
        else 
        {
                gvCourse.UpdateEdit();
        }
        
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        gvCourse.CancelEdit();
    }
    protected void gvCourse_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxComboBox facultyCbx = gvCourse.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        ASPxComboBox CouTypeCbx = gvCourse.FindEditFormTemplateControl("CouTypeCbx") as ASPxComboBox;
        TextBox txtOpenCourse = gvCourse.FindEditFormTemplateControl("txtOpenCourse") as TextBox;
        string txtCourseOpen = Convert.ToString(txtOpenCourse.Text);
        string facultyNo = Convert.ToString(facultyCbx.Value);
        string facultyName = Convert.ToString(facultyCbx.Text);
        string CouTypeNo = Convert.ToString(CouTypeCbx.Value);
        string CouTypeName = Convert.ToString(CouTypeCbx.Text);
        e.NewValues["开课时间"] = txtCourseOpen;
        e.NewValues["课程封面"] = PublicValue.relativePath;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["课程类型代码"] = CouTypeNo;
        e.NewValues["学院"] = facultyName;
        e.NewValues["课程类型"] = CouTypeName;
    }
    protected void gvCourse_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        ASPxComboBox facultyCbx = gvCourse.FindEditFormTemplateControl("facultyCbx") as ASPxComboBox;
        ASPxComboBox CouTypeCbx = gvCourse.FindEditFormTemplateControl("CouTypeCbx") as ASPxComboBox;
        //TextBox txtOpenCourse = gvCourse.FindEditFormTemplateControl("txtOpenCourse") as TextBox;
        //string txtCourseOpen = Convert.ToString(txtOpenCourse.Text);
        string facultyNo = Convert.ToString(facultyCbx.Value);
        string facultyName = Convert.ToString(facultyCbx.Text);
        string CouTypeNo = Convert.ToString(CouTypeCbx.Value);
        string CouTypeName = Convert.ToString(CouTypeCbx.Text);
        //e.NewValues["开课时间"] = txtCourseOpen;
        e.NewValues["课程封面"] = PublicValue.relativePath;
        e.NewValues["学院号"] = facultyNo;
        e.NewValues["课程类型代码"] = CouTypeNo;
        e.NewValues["学院"] = facultyName;
        e.NewValues["课程类型"] = CouTypeName;
    }
    protected void CourseUC_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        ASPxUploadControl uploadControl = sender as ASPxUploadControl;
        if (uploadControl.UploadedFiles != null || uploadControl.UploadedFiles.Length > 0)
        {
            for (int i = 0; i < uploadControl.UploadedFiles.Length; i++)
            {
                UploadedFile file = uploadControl.UploadedFiles[i];
                PublicValue.relativePath = file.FileName;

                if (file.FileName != "")
                {
                    string fullPath = string.Format("{0}{1}", Server.MapPath("../../../img/"), file.FileName);
                    //参数true用于指明当保存的目录下有同名文件时将其覆盖
                    file.SaveAs(fullPath, true);

                }
            }
        }
    }
    protected void gvCourse_PageIndexChanged(object sender, EventArgs e)
    {
        //gvCourse.DataSource = CourseOds;
        //gvCourse.DataBind();
    }
    protected void gvCourse_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}