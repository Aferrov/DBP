using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Segundo_Laboratorio
{
    public partial class Auxiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
            deleteSessions();
        }

        private void loadSession()
        {
            String nombre = (String)(Session["Nombre"]);
            String apellido = (String)(Session["Apellido"]);
            // Asignacion de la informacion a los campos HTML respectivos
            LabelUsuario.Text = "Enviado por Sesion: ";
            LabelNombre.Text = "Nombre: " + nombre;
            LabelApellido.Text = " Apellido: " + apellido;
        }
        private void deleteSessions()
        {
            Session.RemoveAll();
            Session.Abandon();
        }
        private void loadCookie()
        {
            String sexo, ciudad;
            if (Request.Cookies["sexo"] == null)
            {
                sexo = "No existe la cookie sexo";
            }
            else
            {
                sexo = this.Request.Cookies["sexo"].Value;
            }
            if (Request.Cookies["ciudad"] == null)
            {
                ciudad = "No existe la cookie ciudad";
            }
            else
            {
                ciudad = this.Request.Cookies["ciudad"].Value;
            }

            TextCookie.Text = "User info:\n sexo="+sexo+"\nciudad="+ciudad;
            TextCookie.Visible = true;
        }

        protected void BtnMostrar_Click(object sender, EventArgs e)
        {
            loadCookie();
        }
    }
}