using DBAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProagroDemo.Models;
using System.Web.Security;

namespace ProagroDemo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string message = "")
        {
            ViewBag.Title = "Home Page";
            ViewBag.Message = message;
            return View();
        }

        [HttpPost]
        public ActionResult Login()
        {
            ProagroCStr db = null;
            USUARIO user = null;


            string username = Request.Form["username"];
            string password = Request.Form["password"];

            if ( !String.IsNullOrEmpty(username) && !String.IsNullOrEmpty(password) )
            {
                db = new ProagroCStr();
                user = db.USUARIO.FirstOrDefault(u => u.RFC == username && u.CONTRASENIA == password);

                if (user != null)
                {
                    FormsAuthentication.SetAuthCookie(user.RFC, false);
                    return RedirectToAction("MapasDelUsuario", "Home", routeValues: new { idUsuario = user.ID_USUARIO });
                } else
                {
                    return RedirectToAction("Index", "Home", routeValues: new { message = "Los datos del usuario no coinciden. Valide los datos e intente nuevamente." } );
                }
            } else
            {
                return RedirectToAction("Index", "Home", routeValues: new { message = "Los campos Usuario y Contraseña deben tener información. Valide los datos e intente nuevamente." } );
            }
        }

        [Authorize]
        public ActionResult MapasDelUsuario(int idUsuario=0)
        {
            List<Coordenadas> grdu;
            var controller = new GeorreferenciasController();
            grdu = controller.GetGRByUsuario(idUsuario);
            return View(grdu);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home", routeValues: new { message = "Ha cerrado su sesión correctamente." });
        }
    }

}
