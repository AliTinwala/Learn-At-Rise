using Microsoft.AspNetCore.Mvc;

namespace DotnetCoreDemo.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
