using DBAccess;
using ProagroDemo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
//using System.Net.Http;
using System.Web.Http;

namespace ProagroDemo.Controllers
{
    public class GeorreferenciasController : ApiController
    {
        private ProagroCStr context = new ProagroCStr();

        //SELECT
        [HttpGet]
        public IEnumerable<GEORREFERENCIAS> Get()
        {
            using (context)
            {
                return context.GEORREFERENCIAS.ToList();
            }
        }
        
        [HttpGet]
        public GEORREFERENCIAS Get(int id)
        {
            using (context)
            {
                return context.GEORREFERENCIAS.FirstOrDefault(x => x.ID_GEORREFERENCIA == id);
            }
        }

        //INSERT
        [HttpPost]
        public IHttpActionResult agregarGeorreferencia([FromBody] GEORREFERENCIAS georreferencia)
        {
            if (ModelState.IsValid)
            {
                context.GEORREFERENCIAS.Add(georreferencia);
                context.SaveChanges();
                return Ok(georreferencia);
            }
            else
            {
                return BadRequest();
            }
        }

        //UPDATE
        [HttpPut]
        public IHttpActionResult actualizarGeorreferencia(int id, [FromBody] GEORREFERENCIAS georreferencia)
        {
            if (ModelState.IsValid)
            {
                bool georreferenciaExiste = context.GEORREFERENCIAS.Count(e => e.ID_GEORREFERENCIA == id) > 0;
                if (georreferenciaExiste)
                {
                    context.Entry(georreferencia).State = EntityState.Modified;
                    context.SaveChanges();
                    return Ok(georreferencia);
                }
                else
                {
                    return NotFound();
                }
            }
            else
            {
                return BadRequest();
            }
        }

        //DELETE
        [HttpDelete]
        public IHttpActionResult eliminarGeorreferencia(int id)
        {
            var georreferencia = context.GEORREFERENCIAS.Find(id);
            if (georreferencia != null)
            {
                context.GEORREFERENCIAS.Remove(georreferencia);
                context.SaveChanges();
                return Ok(georreferencia);
            }
            else
            {
                return NotFound();
            }
        }


        /*
            SELECT g.*
            FROM georreferencias g
            INNER JOIN estado e ON e.id_estado = g.id_estado
            INNER JOIN permisos p ON p.id_estado = e.id_estado
            WHERE p.id_usuario = 2
        */
        
        //Custom
        
        public List<Coordenadas> GetGRByUsuario(int idUsuarioParam)
        {
            IEnumerable<GEORREFERENCIAS> georreferencias = context.GEORREFERENCIAS;
            IEnumerable<ESTADO> estado = context.ESTADO;
            IEnumerable<PERMISOS> permisos = context.PERMISOS;
            List<Coordenadas> rs = new List<Coordenadas>();

            using (context)
            {
                var query =
                    from g in georreferencias
                    join e in estado on g.ID_ESTADO equals e.ID_ESTADO
                    join p in permisos on e.ID_ESTADO equals p.ID_ESTADO
                    where p.ID_USUARIO == idUsuarioParam
                    select new
                    {
                        LATITUD = g.LATITUD,
                        LONGITUD = g.LONGITUD
                    };
                    //join p in PERMISOS on prop.ID_ESTADO equals e.ID_ESTADO
                    //where p.ID_USUARIO equals idUsuarioParam
                    
                foreach(var v in query)
                {
                    rs.Add( new Coordenadas(v.LATITUD, v.LONGITUD) );
                }


                return rs;
            }
        }
    }
}
