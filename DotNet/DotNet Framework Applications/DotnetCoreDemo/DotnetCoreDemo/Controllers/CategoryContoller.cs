using Microsoft.AspNetCore.Mvc;

namespace DotnetCoreDemo.Controllers
{
    public class CategoryContoller : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
