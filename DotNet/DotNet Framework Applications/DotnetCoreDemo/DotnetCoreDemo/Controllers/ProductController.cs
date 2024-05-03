using Microsoft.AspNetCore.Mvc;

namespace DotnetCoreDemo.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
