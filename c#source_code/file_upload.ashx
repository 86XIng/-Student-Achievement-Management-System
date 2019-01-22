<%@ WebHandler Language="C#" Class="file_upload" %>

using System;
using System.Web;

public class file_upload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        HttpPostedFile _upfile = context.Request.Files[0];
        if (_upfile == null)
        {
            ResponseWriteEnd(context, "4");//请选择要上传的文件
        }
        else
        {
            string fileName = _upfile.FileName;/*获取文件名： C:\Documents and Settings\Administrator\桌面\123.jpg*/
            string suffix = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();/*获取后缀名并转为小写： jpg*/
            string msg = "{{\"errno\":\"{0}\",\"data\":{1}}}";
            int bytes = _upfile.ContentLength;//获取文件的字节大小

            if (suffix != "jpg"&&suffix != "png")
                ResponseWriteEnd(context, "2"); //只能上传JPG格式图片
            if (bytes > 1024 * 1024*5)
                ResponseWriteEnd(context, "3"); //图片不能大于5M

            _upfile.SaveAs(HttpContext.Current.Server.MapPath("~/img/upload/" + fileName));//保存图片
            //ResponseWriteEnd(context, "0"); //上传成功
            //string a = [];
            string[] s=new string[1];
            s[0] = "~/img/upload/1.jpg";
            context.Response.Write(string.Format(msg, 0, "[\"/img/upload/"+fileName+"\"]"));
        }
    }

    private void ResponseWriteEnd(HttpContext context, string msg)
    {
        context.Response.Write(msg);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}