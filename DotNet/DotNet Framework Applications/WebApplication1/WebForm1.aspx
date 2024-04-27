<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
</script>


<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 294px;
        }
        #form2 {
            height: 294px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div style="margin-left: 80px">
        </div>
        <div style="margin-left: 80px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Customer Details" Height="27px" Width="144px" />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Insert" />
            &nbsp;<asp:Button ID="Button3" runat="server" Text="Update" />
            &nbsp;<asp:Button ID="Button4" runat="server" Text="Delete" />
        </div>
    </form>
</body>
</html>
