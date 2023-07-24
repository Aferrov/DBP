using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.IO;
using Base_Datos.DAO;

namespace Servicio
{
    public class Service1 : IService1
    {
        public IList<String> getCiudades()
        {
            BD b = new BD();
            IList<String> ciudades = b.SelectCiudad();
            return ciudades;
        }

        public void InsertarAlumno(string nom, string ape, string sex, string ema, string dir, string ciu, string req)
        {
            BD b = new BD();
            int id = b.SelectIdCiudad(ciu);
            b.InsertAlumno(nom, ape, sex, ema, dir, id, req);

        }

        public bool VerificarNombre(string nom, string ape)
        {
            BD b = new BD();
            return b.NombreRegistrado(nom,ape);

        }

    }
}

