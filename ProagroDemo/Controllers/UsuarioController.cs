using DBAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;

namespace ProagroDemo.Controllers
{
    public class UsuarioController : ApiController
    {

        private ProagroCStr context = new ProagroCStr();

        //SELECT
        [HttpGet]
        public IEnumerable<USUARIO> Get()
        {
            using (context)
            {
                return context.USUARIO.ToList();
            }
        }

        [HttpGet]
        public USUARIO Get(int id)
        {
            using (context)
            {
                return context.USUARIO.FirstOrDefault(x => x.ID_USUARIO == id);
            }
        }

        //INSERT
        [HttpPost]
        public IHttpActionResult agregarUsuario([FromBody] USUARIO usuario)
        {
            if (ModelState.IsValid)
            {
                context.USUARIO.Add(usuario);
                context.SaveChanges();
                return Ok(usuario);
            }
            else
            {
                return BadRequest();
            }
        }

        //UPDATE
        [HttpPut]
        public IHttpActionResult actualizarUsuario(int id, [FromBody] USUARIO usuario)
        {
            if (ModelState.IsValid)
            {
                bool usuarioExiste = context.USUARIO.Count(e => e.ID_USUARIO == id) > 0;
                if (usuarioExiste)
                {
                    context.Entry(usuario).State = EntityState.Modified;
                    context.SaveChanges();
                    return Ok(usuario);
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
        public IHttpActionResult eliminarUsuario(int id)
        {
            var usuario = context.USUARIO.Find(id);
            if (usuario != null)
            {
                context.USUARIO.Remove(usuario);
                context.SaveChanges();
                return Ok(usuario);
            }
            else
            {
                return NotFound();
            }
        }

    }
}
