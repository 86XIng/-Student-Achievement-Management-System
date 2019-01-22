using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using hjyTableAdapters;
using System.Data;
public partial class manage_admin_manager_dic_manage_course_distribute_course_forTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "1")
        {
            Response.Redirect("../../error_login.aspx");
        }
        if (!IsPostBack)
        {
            this.ddlYear.Items.Insert(0, "--请选择--");
            this.ddlTerm.Items.Insert(0, "--请选择--");
        }

    }
    protected void btnDeleteRow_Click(object sender, EventArgs e)
    {
        try
        {
            Button button = (Button)sender;
            int tcID = Convert.ToInt32(button.CommandArgument);
            选课表TableAdapter ta = new 选课表TableAdapter();
            int n = Convert.ToInt32(ta.ScalarStudentByTCID(tcID));
            if (n > 0)
            {
                Response.Write("<script language=javascript>alert('已有学生选择该授课信息，暂无法删除！')" + "</script>");
            }
            else
            {
                上课表TableAdapter ta1 = new 上课表TableAdapter();
                Response.Write("<script language=javascript>alert('确定删除该授课信息吗？')" + "</script>");
                ta1.DeleteTC(tcID);
                Response.Write("<script language=javascript>alert('删除成功！')" + "</script>");
                gvTeacherCourse.DataBind();
            }

        }
        catch (Exception)
        {
            Response.Write("<script language=javascript>alert('删除失败！')" + "</script>");
        }  
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            Button button = (Button)sender;
            int cID = 0;
            String tID = Request.QueryString["教工号"];
            String yearCode = ddlYear.SelectedValue;
            String termCode = ddlTerm.SelectedValue;
            cID = Convert.ToInt32(button.CommandArgument);
            if (ddlYear.SelectedIndex != 0 && ddlTerm.SelectedIndex != 0)
            {
                v_上课表信息TableAdapter tav = new v_上课表信息TableAdapter();
                int n = Convert.ToInt32(tav.ScalarTCBytidcid(cID, tID, yearCode, termCode));
                if (n == 0)
                {
                    上课表TableAdapter ta = new 上课表TableAdapter();
                    ta.InsertTeacherCourse(cID, tID, yearCode, termCode);
                    Response.Write("<script language=javascript>alert('添加成功')" + "</script>");
                    //agvTC.DataBind();
                    gvTeacherCourse.DataBind();
                }
                else
                {
                    Response.Write("<script language=javascript>alert('添加失败，该学年学期已为该老师分配过该课程')" + "</script>");
                }
            }
            else
            {
                if (ddlYear.SelectedIndex == 0 || ddlTerm.SelectedIndex == 0) lblValidate.Text = "*请选择学年学期";
            }

        }
        catch (System.Data.SqlClient.SqlException sqle)
        {
            lblMessage.Text = sqle.Message.ToString();
            

        }
        catch (Exception)
        {
            Response.Write("<script language=javascript>alert('选课失败！')" + "</script>");
        }

    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblValidate.Text = "";
    }
    protected void ddlTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblValidate.Text = "";
    }
}