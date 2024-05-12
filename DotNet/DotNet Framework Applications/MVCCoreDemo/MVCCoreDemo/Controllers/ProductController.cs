using Microsoft.AspNetCore.Mvc;

namespace MVCCoreDemo.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
