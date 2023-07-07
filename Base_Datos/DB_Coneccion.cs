using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Base_Datos.DAO;

namespace Base_Datos
{
    class Datos
    {
        public static void Main(String[] args)
        {
            Datos d= new Datos();
            d.query2();
            Console.ReadKey();
        }
        private void query()
        {
            BD b = new BD();
            IList<String> ciudades = b.SelectCiudad();
            if(ciudades==null)
            {
                Console.WriteLine("No data");
                return;
            }
            for(int i=0;i<ciudades.Count;i++)
            {
                Console.WriteLine(ciudades[i]);
            }
        }
        private void query2()
        {
            BD b = new BD();
            int c = b.SelectIdCiudad("Arequipa");
            Console.WriteLine(c);
            
        }
    }
    
}
