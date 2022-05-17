using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProagroDemo.Models
{
    public class Coordenadas
    {
        public decimal Latitud { get; }
        public decimal Longitud { get;  }

        public Coordenadas(decimal latitud, decimal longitud)
        {
            Latitud = latitud;
            Longitud = longitud;
        }
    }
}