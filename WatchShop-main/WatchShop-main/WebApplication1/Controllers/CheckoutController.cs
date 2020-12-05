using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult Index()
        {
            Customer cus = new Customer();
            cus = Session["customers"] as Customer;
            if(cus != null)
            {
                //Lấy giỏ hàng của user đăng nhập
                List<Cart> listCart = func.GetListCart(cus.idUser);
                ViewBag.listCart = listCart;
                ViewBag.count = listCart.Count();
            }
            else
            {
                //Không đăng nhập thì giỏ hàng rỗng
                List<Cart> listCart = new List<Cart>();
                ViewBag.listCart = listCart;
            }
            return View();
        }
        public ActionResult Delete(string id_pro)
        {
            //Dùng ajax gọi function này
            //Xóa sản phẩm dưới database giỏ hàng
            func.DeleteItemCart(130,Convert.ToInt32(id_pro));
            return Content("");
        }
    }
}