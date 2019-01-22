using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using chenxueTableAdapters;
using hjyTableAdapters;
using System.Data;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;
using Insus.NET;
using System.Data.OleDb;
using xingwenshengTableAdapters;
public partial class manage_teacher_manager_dic_marking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["type"] == null || Session["type"].ToString() != "0")
        {
            Response.Redirect("../error_login.aspx");
        }
        if (!IsPostBack)
        {
            gvCourse.Visible = false;
            gvCourse.DataSource = objCourseInfo;
            gvCourse.DataBind();
            this.ddlTCID.Items.Insert(0, "--请选择--");
        }
        sysTableAdapter st = new sysTableAdapter();
        DataTable dt = st.GetSwitch();
        string kaiguan = dt.Rows[0]["教师打分开关"].ToString();
        if (kaiguan == "1")
        {

            Response.Redirect("../error_switch_teacher.aspx");
        }

    }
    protected void txtPac_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)tb.NamingContainer;
        TextBox tbPac = (TextBox)gvr.FindControl("txtPac");
        TextBox tbMid = (TextBox)gvr.FindControl("txtMid");
        TextBox tbEnd = (TextBox)gvr.FindControl("txtEnd");
        Label lblScore = (Label)gvr.FindControl("lblScore");
        Label lblPac = (Label)gvr.FindControl("lblPac");
        Label lblMid = (Label)gvr.FindControl("lblMid");
        Label lblEnd = (Label)gvr.FindControl("lblEnd");

        lblPac.Text = "";
        bool flag100 = false;

        tbPac.Text =Convert.ToString(Regex.Match(tbPac.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbMid.Text = Convert.ToString(Regex.Match(tbMid.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbEnd.Text = Convert.ToString(Regex.Match(tbEnd.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));

        
            if (tbPac.Text == "")
            {
                tbPac.Text = "0";
            }
            if (tbMid.Text == "")
            {
                tbMid.Text = "0";
            }
            if (tbEnd.Text == "")
            {
                tbEnd.Text = "0";
            }

            if ((Convert.ToDouble(tbPac.Text) <= 100 && Convert.ToDouble(tbPac.Text) >= 0) && (Convert.ToDouble(tbMid.Text) <= 100 && Convert.ToDouble(tbMid.Text) >= 0) && Convert.ToDouble(tbEnd.Text) <= 100 && Convert.ToDouble(tbEnd.Text) >= 0)
            {
                flag100 = true;
            }

            if (txtPacPro.Text == "" || txtMidPro.Text == "" || txtEndPro.Text == "")
            {
                Response.Write("<script>alert('请输入比例')</script>");
            }
            else
            {
                if (flag100)
                {
                    double tmp = Convert.ToDouble(tbPac.Text) * Convert.ToDouble(txtPacPro.Text) * 0.01 + Convert.ToDouble(tbMid.Text) * Convert.ToDouble(txtMidPro.Text) * 0.01 +
               Convert.ToDouble(tbEnd.Text) * Convert.ToDouble(txtEndPro.Text) * 0.01;
                    lblScore.Text = tmp.ToString();

                    int courseid = Convert.ToInt32(gvr.Cells[1].Text);
                    String id = Convert.ToString(gvr.Cells[2].Text);
                    选课临时表1TableAdapter add = new 选课临时表1TableAdapter();
                    int tmp1 = add.UpdateCourse(Convert.ToDouble(lblScore.Text), Convert.ToDouble(tbPac.Text), Convert.ToDouble(tbMid.Text), Convert.ToDouble(tbEnd.Text), id, courseid);
                    if (tmp1 > 0)
                    {
                        //Response.Write("<script>alert('打分成功!')</script>");
                    }
                }
                else
                {
                    if (!(Convert.ToDouble(tbPac.Text) <= 100 && Convert.ToDouble(tbPac.Text) >= 0))
                    {
                        lblPac.Text = "请输入0~100的分数";
                    }
                }     
            }       
    }

    protected void txtMid_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)tb.NamingContainer;
        TextBox tbPac = (TextBox)gvr.FindControl("txtPac");
        TextBox tbMid = (TextBox)gvr.FindControl("txtMid");
        TextBox tbEnd = (TextBox)gvr.FindControl("txtEnd");
        Label lblScore = (Label)gvr.FindControl("lblScore");
        tbPac.Text = Convert.ToString(Regex.Match(tbPac.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbMid.Text = Convert.ToString(Regex.Match(tbMid.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbEnd.Text = Convert.ToString(Regex.Match(tbEnd.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        bool flag100 = false;
        Label lblPac = (Label)gvr.FindControl("lblPac");
        Label lblMid = (Label)gvr.FindControl("lblMid");
        Label lblEnd = (Label)gvr.FindControl("lblEnd");
        lblMid.Text = "";

        if (tbPac.Text == "")
        {
            tbPac.Text = "0";
        }
        if (tbMid.Text == "")
        {
            tbMid.Text = "0";
        }
        if (tbEnd.Text == "")
        {
            tbEnd.Text = "0";
        }

        if ((Convert.ToDouble(tbPac.Text) <= 100 && Convert.ToDouble(tbPac.Text) >= 0) && (Convert.ToDouble(tbMid.Text) <= 100 && Convert.ToDouble(tbMid.Text) >= 0) && Convert.ToDouble(tbEnd.Text) <= 100 && Convert.ToDouble(tbEnd.Text) >= 0)
        {
            flag100 = true;
        }

        if (txtPacPro.Text == "" || txtMidPro.Text == "" || txtEndPro.Text == "")
        {
            Response.Write("<script>alert('请输入比例')</script>");
        }
        else
        {
            if (flag100)
            {
                double tmp = Convert.ToDouble(tbPac.Text) * Convert.ToDouble(txtPacPro.Text) * 0.01 + Convert.ToDouble(tbMid.Text) * Convert.ToDouble(txtMidPro.Text) * 0.01 +
           Convert.ToDouble(tbEnd.Text) * Convert.ToDouble(txtEndPro.Text) * 0.01;
                lblScore.Text = tmp.ToString();

                int courseid = Convert.ToInt32(gvr.Cells[1].Text);
                String id = Convert.ToString(gvr.Cells[2].Text);
                选课临时表1TableAdapter add = new 选课临时表1TableAdapter();
                int tmp1 = add.UpdateCourse(Convert.ToDouble(lblScore.Text), Convert.ToDouble(tbPac.Text), Convert.ToDouble(tbMid.Text), Convert.ToDouble(tbEnd.Text), id, courseid);
                if (tmp1 > 0)
                {
                    //Response.Write("<script>alert('打分成功!')</script>");
                }
            }
            else
            {
                if (!(Convert.ToDouble(tbMid.Text) <= 100 && Convert.ToDouble(tbMid.Text) >= 0))
                {
                    lblMid.Text = "请输入0~100的分数";
                }
            }
 
        }  
    }

    protected void txtEnd_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)tb.NamingContainer;
        TextBox tbPac = (TextBox)gvr.FindControl("txtPac");
        TextBox tbMid = (TextBox)gvr.FindControl("txtMid");
        TextBox tbEnd = (TextBox)gvr.FindControl("txtEnd");
        Label lblScore = (Label)gvr.FindControl("lblScore");
        tbPac.Text = Convert.ToString(Regex.Match(tbPac.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbMid.Text = Convert.ToString(Regex.Match(tbMid.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));
        tbEnd.Text = Convert.ToString(Regex.Match(tbEnd.Text, @"^[1-9]\d*\.?\d*|0\.?\d*[1-9]\d*$"));

        Label lblPac = (Label)gvr.FindControl("lblPac");
        Label lblMid = (Label)gvr.FindControl("lblMid");
        Label lblEnd = (Label)gvr.FindControl("lblEnd");

        lblEnd.Text = "";

        lblPac.Text = "";
        bool flag100 = false;

        if (tbPac.Text == "")
        {
            tbPac.Text = "0";
        }
        if (tbMid.Text == "")
        {
            tbMid.Text = "0";
        }
        if (tbEnd.Text == "")
        {
            tbEnd.Text = "0";
        }

        if ((Convert.ToDouble(tbPac.Text) <= 100 && Convert.ToDouble(tbPac.Text) >= 0) && (Convert.ToDouble(tbMid.Text) <= 100 && Convert.ToDouble(tbMid.Text) >= 0) && Convert.ToDouble(tbEnd.Text) <= 100 && Convert.ToDouble(tbEnd.Text) >= 0)
        {
            flag100 = true;
        }

        if (txtPacPro.Text == "" || txtMidPro.Text == "" || txtEndPro.Text == "")
        {
            Response.Write("<script>alert('请输入比例')</script>");
        }
        else
        {
            if (flag100)
            {
                double tmp = Convert.ToDouble(tbPac.Text) * Convert.ToDouble(txtPacPro.Text) * 0.01 + Convert.ToDouble(tbMid.Text) * Convert.ToDouble(txtMidPro.Text) * 0.01 +
           Convert.ToDouble(tbEnd.Text) * Convert.ToDouble(txtEndPro.Text) * 0.01;
                lblScore.Text = tmp.ToString();

                int courseid = Convert.ToInt32(gvr.Cells[1].Text);
                String id = Convert.ToString(gvr.Cells[2].Text);
                选课临时表1TableAdapter add = new 选课临时表1TableAdapter();
                int tmp1 = add.UpdateCourse(Convert.ToDouble(lblScore.Text), Convert.ToDouble(tbPac.Text), Convert.ToDouble(tbMid.Text), Convert.ToDouble(tbEnd.Text), id, courseid);
                if (tmp1 > 0)
                {
                    //Response.Write("<script>alert('打分成功!')</script>");
                }
            }
            else
            {
                if (!(Convert.ToDouble(tbEnd.Text) <= 100 && Convert.ToDouble(tbEnd.Text) >= 0))
                {
                    lblEnd.Text = "请输入0~100的分数";
                }
                
            }
        }

        
    }
    protected void txtEndPro_TextChanged(object sender, EventArgs e)
    {
        if (Convert.ToString( txtPacPro.Text) == "")
        {
            txtPacPro.Text =Convert.ToString( 0);
        }
        if (Convert.ToString(txtMidPro.Text) == "")
        {
            txtMidPro.Text = Convert.ToString(0);
        }
        double tmp = Convert.ToDouble(txtPacPro.Text) + Convert.ToDouble(txtMidPro.Text) + Convert.ToDouble(txtEndPro.Text);
        if (tmp != 100)
        {
            Response.Write("<script>alert('请输入正确的比例')</script>");
            gvCourse.Visible = false;
            btnSave.Visible = false;
            btnSubmit.Visible = false;
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        

        if (ddlTCID.SelectedIndex == 0)
        {
            Response.Write("<script>alert('请选择课程！')</script>");

        }
        else
        {
            gvCourse.Visible = true;
            if (txtPacPro.Text == "" || txtMidPro.Text == "" || txtEndPro.Text == "")
            {
                Response.Write("<script>alert('请输入比例')</script>");
                gvCourse.Visible = false;
                btnSave.Visible = false;
                btnSubmit.Visible = false;
            }
            else
            {
                bool flag = true;
                hjyTableAdapters.选课表TableAdapter ta = new hjyTableAdapters.选课表TableAdapter();
                int n = ta.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows.Count;

                for (int i = 0; i < n; i++)
                {
                    if (Convert.ToString((ta.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows[i][2])) != "")
                    {
                        flag = false;  //有成绩，即提交过
                    }
                }
                if (flag)
                {
                    double tmp = Convert.ToDouble(txtPacPro.Text) + Convert.ToDouble(txtMidPro.Text) + Convert.ToDouble(txtEndPro.Text);
                    if (tmp != 100)
                    {
                        Response.Write("<script>alert('请输入正确的比例')</script>");
                        gvCourse.Visible = false;
                        btnSave.Visible = false;
                        btnSubmit.Visible = false;
                    }
                    else
                    {
                        Label1.Visible = false;
                        Label2.Visible = false;
                        Label3.Visible = false;
                        txtPacPro.Visible = false;
                        txtMidPro.Visible = false;
                        txtEndPro.Visible = false;
                        gvCourse.DataSource = odsCourseDDL;
                        gvCourse.DataBind();
                        btnSave.Visible = true;
                        btnSubmit.Visible = true;
                        btnDc.Visible = true;
                    }

                }
                else
                {
                    Response.Write("<script>alert('该门课程已经提交过，无法再次提交！')</script>");
                    gvCourse.Visible = false;
                    btnSave.Visible = false;
                    btnSubmit.Visible = false;
                    btnDc.Visible = false;
                }
            } 
        }
        
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool flag1 = true;
        if (txtPacPro.Text == "" || txtMidPro.Text == "" || txtEndPro.Text == "")
        {
            Response.Write("<script>alert('请输入比例')</script>");
        }
        else
        {
            V_打分表TableAdapter ta = new V_打分表TableAdapter();
            int n = ta.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows.Count;

            for (int i = 0; i < n; i++)
            {
                if (Convert.ToString((ta.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows[i][6])) == "")
                {
                    flag1 = false;                   
                }
            }

            if (flag1)
            {

                bool flag = true;
                hjyTableAdapters.选课表TableAdapter ta2 = new hjyTableAdapters.选课表TableAdapter();
                int n2 = ta.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows.Count;

                for (int i = 0; i < n2; i++)
                {
                    if (Convert.ToString((ta2.GetGradeByTCID(Convert.ToInt32(lblCourse.Text)).Rows[i][2])) != "")
                    {
                        flag = false;  //有成绩，即提交过
                    }
                }
                if (flag)
                {
                    QueriesTableAdapter qs = new QueriesTableAdapter();
                    qs.insertGrade(Convert.ToInt32(lblCourse.Text));
                    Response.Write("<script>alert('提交成功!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('该门课程已经提交过，无法再次提交！')</script>");
                }

                
            }
            else
            {
                Response.Write("<script>alert('打分未完成暂无法提交，请继续打分！')</script>");
            }
        }
    }
    protected void ddlTCID_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblCourse.Text = ddlTCID.SelectedValue;
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        txtPacPro.Visible = true;
        txtMidPro.Visible = true;
        txtEndPro.Visible = true;
        gvCourse.Visible = false;
        btnSave.Visible = false;
        btnSubmit.Visible = false;
        btnDc.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('保存成功!')</script>");
    }

    private void Export(string FileType, string FileName)
    {
        Response.Charset = "utf8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileName, Encoding.UTF8).ToString());
        Response.ContentType = FileType;
        this.EnableViewState = false;
        StringWriter tw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(tw);
        gvCourse.RenderControl(hw);
        Response.Write(tw.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void btnDc_Click(object sender, EventArgs e)
    {
        if (gvCourse.Rows.Count > 0)
        {
            //ExportToFile ex = new ExportToFile();
            // ex.ToExcel(gvCourse, "asd");
            //调用导出方法  
            //ExportGridViewForUTF8(gvCourse, DateTime.Now.ToShortDateString() + ".xls");
            Export("application/ms-excel", DateTime.Now.ToShortDateString() + ".xls");
        }
        else
        {
            // obo.Common.MessageBox.Show(this, "没有数据可导出，请先查询数据!");
        }
    }
}