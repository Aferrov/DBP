<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Segundo_Laboratorio.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Segundo Laboratorio</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/> 
<script type="text/javascript">
    function limpiar_Contenido(){
        var vacio="";
        document.getElementById("TextBoxNombre").value=vacio;
        document.getElementById("TextBoxApellidos").value=vacio;
        document.getElementById("RadioButtonM").checked=false;
        document.getElementById("RadioButtonF").checked=false;
        document.getElementById("TextBoxEmail").value=vacio;
        document.getElementById("TextBoxDireccion").value=vacio;
        document.getElementById("ddlLista").value = "Selecciona una opcion...";
        document.getElementById("TextAreaRequerimiento").value = vacio;
        document.getElementById("TextBoxRpta").style.display = "none";

    return false;
    }
</script>
<script type="text/javascript">
    function mostrarAlert(texto,c1,c2) {
        var div = document.getElementById("myAlerta");
        div.classList.remove(...div.classList);
        div.classList.add(c1, c2);
        div.classList.add("fade", "show", "position-fixed", "top-0", "start-50", "translate-middle-x");
        div.innerHTML = texto + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick="closeAlert(\'myAlerta\')"></button>';
        div.style.display = "block";
    }
    function closeAlert(alerta) {
        var alertElement = document.getElementById(alerta);
        alertElement.style.display = "none";
    }
    function validar_Contenido() {
        var nom, ape, sex1, sex2, ema, ciu;
        nom = document.getElementById("TextBoxNombre").value;
        ape = document.getElementById("TextBoxApellidos").value;
        sex1 = document.getElementById("RadioButtonM").checked;
        sex2 = document.getElementById("RadioButtonF").checked;
        ema = document.getElementById("TextBoxEmail").value;
        ciu = document.getElementById("ddlLista").value;

        if (/^[a-zA-Z]+$/.test(nom) == false) {
            mostrarAlert("Error en Nombres", "alert", "alert-danger");
            document.getElementById("TextBoxNombre").value = "";
        }
        else if (/^[a-zA-ZñÑ\s]+$/.test(ape) == false) {
            mostrarAlert("Error en Apellidos", "alert", "alert-danger");
            document.getElementById("TextBoxApellidos").value = "";
        }
        else if ((sex1 == false & sex2 == false) || (sex1 == true & sex2 == true)) {
            mostrarAlert("Error en Sexo", "alert", "alert-danger");
            document.getElementById("RadioButtonM").checked = false;
            document.getElementById("RadioButtonF").checked = false;
        }
        else if (/^[\w-]+(\.[\w-]+)*@unsa.edu.pe/.test(ema) == false) {
            mostrarAlert("Error en Correo", "alert", "alert-danger");
            document.getElementById("TextBoxEmail").value = "";
        }
        else if (ciu == "Selecciona una opcion...") {
            mostrarAlert("Error en Ciudad", "alert", "alert-danger");
        }
        else {
            var diasSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];
            var meses = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

            var fechaActual = new Date();
            var diaSemana = diasSemana[fechaActual.getDay()];
            var dia = fechaActual.getDate();
            var mes = meses[fechaActual.getMonth()];
            var anio = fechaActual.getFullYear();
            var hora = fechaActual.getHours();
            var minutos = fechaActual.getMinutes();
            var segundos = fechaActual.getSeconds();
            var horacompleta = hora + ":" + minutos + ":" + segundos + " GTM 0500 (hora estandar Perú)";


            mostrarAlert("Registrado a las: " + diaSemana + " " + dia + " " + mes + " " + anio + " " + horacompleta, "alert", "alert-info");
            //limpiar_Contenido();
            return true;
        }
        return false;
    }
</script>
<style>
    .btn-violet{
        background-color:violet;
    }
</style>
</head>
<body class="bg-light">
    <div class="container">
        <div class="fade show position-fixed top-0 start-50 translate-middle-x" role="alert" id="myAlerta" style="display: none;">
        </div>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <div class="mb-3">
                <h1>Registro de Alumnos:</h1>
           </div>
           <div class="mb-3 row">
                <label class="col-sm-1 col-form-label" >Nombre:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="TextBoxNombre" runat="server" class="form-control"></asp:TextBox>
                </div>
           </div>
           <div class="mb-3 row">
                <label class="col-sm-1 col-form-label">Apellidos:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="TextBoxApellidos" runat="server" class="form-control"></asp:TextBox>
                </div>
           </div>
           <div class="row">
                <label class="col-sm-1 col-form-label">Sexo:</label>
                <div class="col-sm-2">
                    <asp:RadioButton ID="RadioButtonM" runat="server" class="form-check-input" BackColor="#f8f9fa" BorderColor="#f8f9fa"/>
                    <label class="form-check-label" for="flexRadioDefault1">Masculino </label>
                </div>
                <div class="col-sm-2">
                    <asp:RadioButton ID="RadioButtonF" runat="server" class="form-check-input" BackColor="#f8f9fa" BorderColor="#f8f9fa" />
                    <label class="form-check-label" for="flexRadioDefault1">Femenino </label>
                </div>
           </div>
           <div class="mb-3 row">
                <label class="col-sm-1 col-form-label">Email:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="TextBoxEmail" runat="server" class="form-control"></asp:TextBox>
                </div>
           </div>
           <div class="mb-3 row">
                <label class="col-sm-1 col-form-label">Dirección:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="TextBoxDireccion" runat="server" class="form-control"></asp:TextBox>
                </div>
                <label class="col-sm-1 col-form-label">Ciudad:</label>
                <div class="col-sm-3">
                    <asp:DropDownList runat="server" ID="ddlLista" class="form-select"/>
                </div>
           </div>
           <div class="mb-5">
                <div class="col-sm-4">
                    <asp:TextBox ID="TextAreaRequerimiento" runat="server" class="form-control" rows="5" TextMode="MultiLine" placeholder="Requerimiento"></asp:TextBox>
                </div>
           </div>
           <div class="mb-3 text-center">
                <asp:Button ID="ButtonLimpiar" runat="server" class="btn btn-violet" Text="Limpiar" OnClientClick="return limpiar_Contenido();"/>
                <asp:Button ID="ButtonEnviar" runat="server" class="btn btn-warning" Text="Enviar" OnClientClick="return validar_Contenido();" OnClick="ButtonEnviar_Click"/>
           </div> 
           <div class="mb-5">
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxRpta" runat="server" class="form-control" rows="5" 
                        TextMode="MultiLine" placeholder="" Visible="false"></asp:TextBox>
                </div>
           </div>
        </form>
    </div>
</body>
</html>
