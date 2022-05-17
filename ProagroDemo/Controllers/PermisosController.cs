using DBAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProagroDemo.Controllers
{
    public class PermisosController : ApiController
    {

        private ProagroCStr context = new ProagroCStr();

        //SELECT
        [HttpGet]
        public IEnumerable<PERMISOS> Get()
        {
            using (context)
            {
                return context.PERMISOS.ToList();
            }
        }

        [HttpGet]
        public PERMISOS Get(int id)
        {
            using (context)
            {
                return context.PERMISOS.FirstOrDefault(x => x.ID_PERMISO == id);
            }
        }

        //INSERT
        [HttpPost]
        public IHttpActionResult agregarPermiso([FromBody] PERMISOS permiso)
        {
            if (ModelState.IsValid)
            {
                context.PERMISOS.Add(permiso);
                context.SaveChanges();
                return Ok(permiso);
            }
            else
            {
                return BadRequest();
            }
        }

        //UPDATE
        [HttpPut]
        public IHttpActionResult actualizarPermiso(int id, [FromBody] PERMISOS permiso)
        {
            if (ModelState.IsValid)
            {
                bool permisoExiste = context.PERMISOS.Count(e => e.ID_PERMISO == id) > 0;
                if (permisoExiste)
                {
                    context.Entry(permiso).State = EntityState.Modified;
                    context.SaveChanges();
                    return Ok(permiso);
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
        public IHttpActionResult eliminarPermiso(int id)
        {
            var permiso = context.PERMISOS.Find(id);
            if (permiso != null)
            {
                context.PERMISOS.Remove(permiso);
                context.SaveChanges();
                return Ok(permiso);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
