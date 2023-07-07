﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.IO;
using Base_Datos.DAO;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
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

    }
}
