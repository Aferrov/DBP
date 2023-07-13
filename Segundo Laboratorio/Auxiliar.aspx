<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auxiliar.aspx.cs" Inherits="Segundo_Laboratorio.Auxiliar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<script type="text/javascript">
    function cookies() {
        var cookie = document.cookie;
        //document.getElementById("TextCookie").style.display = "true";
        document.getElementById("TextCookie").value = "user info desde html:\n"+cookie;

        return false;
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LabelUsuario" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:Label ID="LabelNombre" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:Label ID="LabelApellido" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:Button ID="BtnMostrar" runat="server" OnClientClick="return cookies()" Text="Mostrar cookie" />
        </div>
        <div>
            <asp:TextBox ID="TextCookie" Visible="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
