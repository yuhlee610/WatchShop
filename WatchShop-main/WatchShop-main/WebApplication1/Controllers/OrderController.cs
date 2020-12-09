﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Function;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order
        private DBDongho db=new DBDongho();
        public ActionResult Index()
        {
            Customer cus = Session["customers"] as Customer;
            List<Order> lstOrder = func.GetListOrder(130);
            ViewBag.lstOrder = lstOrder;
            return View();
        }
        public ActionResult CreateOrder()
        {
            Customer cus = Session["customers"] as Customer;
            func.CreateOrder(cus.idUser);
            return RedirectToAction("Index");
        }
        public ActionResult viewDetail(int id_user, int id_pro)
        {
            Order order = func.GetOrder(id_user, id_pro);
            return View(order);
        }
    }
}