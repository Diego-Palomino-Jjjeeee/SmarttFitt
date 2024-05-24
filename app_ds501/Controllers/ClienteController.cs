using app_ds501.Data;
using app_ds501.Models;
using Microsoft.AspNetCore.Mvc;

namespace app_ds501.Controllers
{
    public class ClienteController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ClienteController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            IEnumerable<Cliente> ListarCliente = _context.Cliente;
            return View(ListarCliente);
        }
    }
}
