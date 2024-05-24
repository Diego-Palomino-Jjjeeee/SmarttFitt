using app_ds501.Data;
using app_ds501.Models;
using Microsoft.AspNetCore.Mvc;

namespace app_ds501.Controllers
{
    public class ServicioController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ServicioController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            IEnumerable<Servicio> ListarServicio = _context.Servicio;
            return View(ListarServicio);
        }
    }
}
