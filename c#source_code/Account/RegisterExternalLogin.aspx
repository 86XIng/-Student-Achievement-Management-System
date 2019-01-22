<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RegisterExternalLogin.aspx.cs" Inherits="Account_RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>使用 <%: ProviderName %> 帐户注册</h3>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <div class="form-horizontal">
            <h4>关联表单</h4>
            <hr />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                你已使用 <strong><%: ProviderName %></strong> 进行身份验证。请在下面输入当前站点的用户名，
                然后单击“登录”按钮。
            </p>

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label">用户名</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="userName" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="必须填写用户名" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-danger" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="Button1" runat="server" Text="登录" CssClass="btn btn-default" OnClick="LogIn_Click" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
