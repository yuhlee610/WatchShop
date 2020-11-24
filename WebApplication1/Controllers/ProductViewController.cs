using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ProductViewController : Controller
    {
        // GET: ProductView
        public ActionResult Index()
        {
            List<Category> myList = func.getAllCategories();
            ViewBag.MyList = myList;
            List<Product> myProduct = func.getAllProducts();
            ViewBag.myProduct = myProduct;
            return View();
        }
    }
}