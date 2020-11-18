using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        
        public ActionResult RegisterForm()
        {           
            return View();
        }
        public ActionResult LoginForm()
        {
            return View();
        }
        public ActionResult registerAdmin(string name, string mail, string pass)
        {
            var admin = new WebApplication1.Models.Admin() { accountName = name, passWord = pass, Mail = mail };
            if (func.RegisterAdmin(admin))
                return Content("success");
            else
                return Content("fail");
        }
        public ActionResult loginAdmin(string acc,string pass)
        {
            if (func.LoginAdmin(acc, pass))
                return Content("success");
            else
                return Content("fail");
        }
        public ActionResult SendMail(string mail)
        {
            //kiem tra email hop le
            if (func.IsValidEmail(mail) == false)
                return Content("");

            //gui mail
            TempData["code"] = func.sendEmail(mail);
            return Content("");
        }

        public ActionResult ValidCode(string code)
        {

            if (TempData["code"] != null)
            {
                if (code == TempData["code"].ToString())
                    return Content("Valid");
                else
                    return Content("Invalid");
            }
            else
                return Content("Invalid");
        }
    }
}