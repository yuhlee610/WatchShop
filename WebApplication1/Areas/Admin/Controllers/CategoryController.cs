using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetData()
        {
            List<Category> lstcat = new List<Category>();
            lstcat = func.getAllCategories();
            var data = new List<Category>(lstcat);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DelCategory(string id)
        {
            if (func.delCategory(Convert.ToInt32(id)))
                return Content("success");
            else
                return Content("fail");
        }
        [HttpPost]
        public ActionResult CreateCategory(FormCollection formData)
        {
            Category cate = new Category();
            cate.cateDescription = formData["cateDescription"];
            cate.cateName = formData["cateName"];
            cate.catePicture = formData["catePicture"];
            func.createCategory(cate);
            return Content("");
        }
        [HttpPost]
        public ActionResult EditCategory(FormCollection formData)
        {
            Category cate = new Category();
            cate.ID=Convert.ToInt32(formData["ID"]);
            cate.cateDescription = formData["cateDescription"];
            cate.cateName = formData["cateName"];
            cate.catePicture = formData["catePicture"];
            if (func.EditCategory(cate))
                return Content("success");
            else
                return Content("fail");
        }
    }
}