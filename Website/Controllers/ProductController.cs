using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Context;

namespace Website.Controllers
{
    public class ProductController : Controller
    {
        websiteEntities1 obj = new websiteEntities1();
        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = obj.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}