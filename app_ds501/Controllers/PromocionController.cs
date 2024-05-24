using app_ds501.Data;
using app_ds501.Models;
using Microsoft.AspNetCore.Mvc;

namespace app_ds501.Controllers
{
    public class PromocionController : Controller
    {
        private readonly ApplicationDbContext _context;

        public PromocionController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            IEnumerable<Promocion> ListarPromocion = _context.Promocion;
            return View(ListarPromocion);
        }
    }
}
