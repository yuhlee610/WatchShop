using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        public ActionResult Index()
        {
            List<Product> lstpro = new List<Product>();
            lstpro = func.getAllProducts();
            return View(lstpro);
        }
        public ActionResult GetData()
        {
            List<Product> lstpro = new List<Product>();
            lstpro = func.getAllProducts();
            var data = new List<Product>(lstpro);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult InsertPro()
        {
            return View();
        }
        public ActionResult AddPro(Product pro)
        {
            if (func.addPro(pro) == false)
                return Content("error");
            return Content("success");
        }
        public ActionResult GetProductById(string id)
        {
            var pro = func.getProductById(Convert.ToInt32(id));
            var data = new
            {
                id = pro.ID,
                name = pro.productName,
                descript = pro.productDescription,
                price = pro.Price,
                promo = pro.promotionPrice,
                picture = pro.productPicture,
                proStt = pro.productStatus,
                catID = pro.categoryID,
                brand = pro.BrandID,
                viewC = pro.viewCount
            };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DelProduct(string id)
        {
            if (func.delProduct(Convert.ToInt32(id)) == true)
                return Content("success");
            else
                return Content("fail");
        }
        [HttpPost]
        public ActionResult EditProduct(FormCollection formData)
        {
            Product prod = new Product();
            prod.ID = Convert.ToInt32(formData["ID"]);
            prod.productName = formData["productName"];
            prod.productDescription = formData["productDescription"];
            if (formData["Price"] != "")
            {
                prod.Price = Convert.ToDecimal(formData["Price"]);
            }
            if (formData["promotionPrice"] != "")
            {
                prod.promotionPrice = Convert.ToDecimal(formData["promotionPrice"]);
            }
            if (formData["productPicture"] != "")
            {
                prod.productPicture = formData["productPicture"];
            }
            string x = formData["categoryID"];
            if (formData["categoryID"] != "")
            {
                prod.categoryID = Convert.ToInt32(formData["categoryID"]);
            }
            if (formData["viewCount"] != "")
            {
                prod.viewCount = Convert.ToInt32(formData["viewCount"]);
            }
            if (formData["BrandID"] != "")
            {
                prod.BrandID = Convert.ToInt32(formData["BrandID"]);
            }
            if (formData["productStatus"] == "True")
                prod.productStatus = true;
            else
                prod.productStatus = false;

            if (func.EditProduct(prod))
                return Content("success");
            else
                return Content("fail");

        }

    }
}