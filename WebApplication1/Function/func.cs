using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Function
{
    public class func
    {
        public static string sendEmail(string mail)
        {
            //email của dự án
            string email = "nhomltweb@gmail.com";
            string password = "123456789a@";
            //tao code xac nhan
            string ranCod = RandomString(10, false);

            var loginInfo = new NetworkCredential(email, password);
            var msg = new MailMessage();
            var smtpClient = new SmtpClient("smtp.gmail.com", 25);


            msg.From = new MailAddress(email);
            msg.To.Add(mail);
            msg.Subject = "Hello";
            msg.Body = "Your verification code is: " + ranCod;
            msg.IsBodyHtml = true;

            //gán cho biến TempData để có thể kiểm tra xem user nhập đúng không 


            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = loginInfo;
            smtpClient.Send(msg);

            return ranCod;
        }

        public static List<Category> getAllCategories()
        {
            using (var _context = new DBDongho())
            {
                _context.Configuration.LazyLoadingEnabled = false;
                var dbcat = (from cat in _context.Categories
                             select cat).ToList();
                return dbcat;
            }
        }

        private static string RandomString(int size, bool lowerCase)
        {
            System.Text.StringBuilder sb = new StringBuilder();
            char c;
            Random rand = new Random();
            for (int i = 0; i < size; i++)
            {
                c = Convert.ToChar(Convert.ToInt32(rand.Next(65, 87)));
                sb.Append(c);
            }
            if (lowerCase)
            {
                return sb.ToString().ToLower();
            }
            return sb.ToString();
        }
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            var regex = new System.Text.RegularExpressions.Regex(pattern, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }
        public static bool signIn(string acc, string pass)
        {
            using (var _context = new DBDongho())
            {
                var dbcus = (from cus in _context.Customers
                             where cus.accuontName == acc && cus.passWord == pass
                             select cus).ToList();
                if (dbcus.Count == 1)
                    return true;
                else
                    return false;
            }
        }
        public static bool register(Customer cus)
        {
            if (AccIsExists(cus) == false)
            {
                using (var _context=new DBDongho())
                {
                    _context.Customers.Add(cus);
                    _context.SaveChanges();
                    return true;
                }
            }
            return false;
               
        }
        public static bool AccIsExists(Customer cus)
        {
            using (var _context = new DBDongho())
            {
                var dbcus = (from c in _context.Customers
                             where c.accuontName == cus.accuontName
                             select c).SingleOrDefault();
                if (dbcus != null)
                    return true;
                else
                    return false;
            }
        }
        public static List<Product> getAllProducts()
        {
            using (var _context=new DBDongho())
            {
                _context.Configuration.LazyLoadingEnabled = false;
                var dbpro = (from pro in _context.Products
                             select pro).ToList();
                return dbpro;
            }
        }
        public static bool addPro(Product pro)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    _context.Products.Add(pro);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static Product getProductById(int id)
        {
            using(var _context=new DBDongho())
            {
                var dbpro = (from p in _context.Products
                             where p.ID == id
                             select p).SingleOrDefault();
                return dbpro;
            }
        }
        public static bool delProduct(int id)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    var dbpro = (from pr in _context.Products
                                 where pr.ID == id
                                 select pr).SingleOrDefault();
                    _context.Products.Remove(dbpro);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static Customer GetCustomer(string acc)
        {
            using(var _context=new DBDongho())
            {
                var dbcus = (from c in _context.Customers
                             where c.accuontName == acc
                             select c).SingleOrDefault();
                return dbcus;
            }
        }
        public static bool RegisterAdmin(Admin ad)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    _context.Admins.Add(ad);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch { return false; }
        }
        public static bool LoginAdmin(string acc,string pass)
        {
            using(var _context=new DBDongho())
            {
                var dbadmin = (from a in _context.Admins
                               where a.accountName == acc && a.passWord == pass
                               select a).ToList();
                if (dbadmin.Count() == 1)
                    return true;
                return false;
            }
        }
        public static bool EditProduct(Product prod)
        {           
            try
            {
                using (var _context = new DBDongho())
                {
                    _context.Products.AddOrUpdate(prod);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static bool delCategory(int id)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    var dbcat = (from cat in _context.Categories
                                 where cat.ID == id
                                 select cat).SingleOrDefault();
                    _context.Categories.Remove(dbcat);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static void createCategory(Category cate)
        {
            using (var _context = new DBDongho())
            {
                _context.Categories.Add(cate);
                _context.SaveChanges();
            }
        }
        public static bool EditCategory(Category cate)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    _context.Categories.AddOrUpdate(cate);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static List<Brand> getAllBrands()
        {
            using(var _context=new DBDongho())
            {
                _context.Configuration.LazyLoadingEnabled = false;
                var dbbrand = (from br in _context.Brands
                               select br).ToList();
                return dbbrand;
            }
        }
        public static bool delBrand(int id)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    var dbbr = (from br in _context.Brands
                                 where br.ID == id
                                 select br).SingleOrDefault();
                    _context.Brands.Remove(dbbr);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public static void createBrand(Brand brand)
        {
            using( var _context=new DBDongho())
            {
                _context.Brands.Add(brand);
                _context.SaveChanges();
            }
        }
        public static bool EditBrand(Brand brand)
        {
            try
            {
                using (var _context = new DBDongho())
                {
                    _context.Brands.AddOrUpdate(brand);
                    _context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}