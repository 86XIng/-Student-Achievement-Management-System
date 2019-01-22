using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using xingwenshengTableAdapters;
using System.Data;
using System.IO;
using xingwenshengTableAdapters;
using System.Data;


public partial class manage_admin_manager_release_news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null || Session["type"].ToString() != "1")
        {
            Response.Redirect("../../error_login.aspx");
        }
        
        //int count = Request.Files.Count;
        //string res = string.Empty;
        //string error = string.Empty;
        //string imgurl = string.Empty; ;
        //if (count > 0)
        //{
        //    try
        //    {
        //        HttpPostedFile File1 = Request.Files[0];
        //        string suffix = Path.GetExtension(File1.FileName).ToLower();
        //        string path = Server.MapPath("UpLoadImg/HeadImage");  //用来生成文件夹
 
        //        if (File1.ContentLength / 4096 > 4096)
        //        {
        //            error = "单张头像不能超过4096K(4M)，请重新选择头像上传。";
        //        }
        //        else
        //        {
 
        //            if (!Directory.Exists(path))
        //                Directory.CreateDirectory(path);
        //            var savepath = "UpLoadImg/HeadImage/" + Guid.NewGuid() + suffix;
        //            if (suffix.Equals(".jpg") || suffix.Equals(".png") || suffix.Equals(".gif") || suffix.Equals(".jpeg"))
        //            {
        //                File1.SaveAs(Server.MapPath(savepath));
        //            }
 
						
        //            error = "上传成功";
        //            res = "{\"info\":\"" + error + "\",\"data\":\"1\",\"imgurl\":\"" + savepath + "\"}";
        //        }
        //        if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
        //        {
						
        //        }
        //        else
        //        {
 
        //        }
        //    }
        //    catch (Exception ex)
        //    {
					
        //        res = "{\"info\":\"" + ex.Message + "\",\"data\":\"0\",\"imgurl\":\"\"}";
        //        if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
        //        {
						
        //        }
        //        else
        //        {
						
        //        }
 
        //    }
        //    Response.Write(res);
        //    Response.End();
        //}
        //else
        //{
				
        //}
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //
        
        ////var desc = div1.InnerHtml;
        ////var title = newstitle.Value;
        //
        //Response.Write("<script>alert('123')</script>");
        
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string title = Hiddennewstitle.Value;
        string desc = Hiddennewsdesc.Value;
        string newstime = Hiddennewstime.Value.ToString();
        newsTableAdapter nt = new newsTableAdapter();
        nt.AddNews(title, desc, newstime);
        Response.Write("<script>alert('添加成功')</script>");
    }
}