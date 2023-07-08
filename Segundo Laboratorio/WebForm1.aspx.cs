using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Segundo_Laboratorio.ServiceReference1;

namespace Segundo_Laboratorio
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlLista.Items.Clear();
                TextBoxRpta.Visible = false;

                addDropDownList();
            }
        }
        private String[] service_call()
        {
            Service1Client client = new Service1Client();
            String[] ciudades = client.getCiudades();
            return ciudades;
        }

        protected void addDropDownList()
        {
            String[] ciudades = service_call();
            Array.Sort(ciudades);
            ddlLista.Items.Add("Selecciona una opcion...");
            for(int i=0; i<ciudades.Length;i++)
            {
                string s = ciudades[i];
                ddlLista.Items.Add(s);
            }
        }
        protected List<string> Llenar()
        {
            String line;
            List<string> items = new List<string>();
            try
            {
                StreamReader sr = new StreamReader("D:\\Ciudades.txt");

                line = sr.ReadLine();
                items.Add(line);
                while (line != null)
                {
                    line = sr.ReadLine();
                    if (line != null)
                    {
                        items.Add(line);
                    }
                }
                sr.Close();
            }
            finally { }
            items = items.OrderBy(x => x).ToList();
            items.Insert(0, "Selecciona una opcion...");
            return items;
        }
        protected void Limpiar()
        {
            TextBoxNombre.Text = "";
            TextBoxApellidos.Text = "";
            RadioButtonM.Checked = false;
            RadioButtonF.Checked = false;
            TextBoxEmail.Text = "";
            TextBoxDireccion.Text = "";
            ddlLista.SelectedIndex = 0;
            TextAreaRequerimiento.Text = "";
        }
        
        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string nom=TextBoxNombre.Text;
            string ape = TextBoxApellidos.Text;
            string sex;
            bool sex1 = RadioButtonM.Checked;
            bool sex2=RadioButtonF.Checked;
            if (sex1)
                sex = "M";
            else
                sex = "F";
            string ema=TextBoxEmail.Text;
            string dir=TextBoxDireccion.Text;
            string ciu = ddlLista.SelectedValue;
            string req = TextAreaRequerimiento.Text;
            
            Service1Client client = new Service1Client();
            client.InsertarAlumno(nom,ape,sex,ema,dir,ciu,req);
            Limpiar();
        }
    }
}