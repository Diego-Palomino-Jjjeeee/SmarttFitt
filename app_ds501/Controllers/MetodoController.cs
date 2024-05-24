using app_ds501.Data;
using app_ds501.Models;
using Microsoft.AspNetCore.Mvc;

namespace app_ds501.Controllers
{
    public class MetodoController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MetodoController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            IEnumerable<Metodo> ListarMetodo = _context.Metodo;
            return View(ListarMetodo);
        }
    }
}
