using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Context;
using Website.Models;

namespace Website.Controllers
{
    public class PaymentController : Controller
    {
        websiteEntities1 obj = new websiteEntities1();
        // GET: Payment
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                // lấy thông tin từ giỏ hàng của biến session
                var lstCart = (List<CartModel>)Session["cart"];
                //gắn dữ liệu cho order
                Order objOrder = new Order();
                objOrder.Name = "DonHang" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 1;
                obj.Orders.Add(objOrder);
                //Lưu thông tin dữ liệu vào bản order
                obj.SaveChanges();

                //Lấy OrderId vừa mới tạo để lưu vào bảng OrderDetail
                int intOrderId = objOrder.Id;

                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                if (lstCart != null)
                {
                    foreach (var item in lstCart)
                    {
                        OrderDetail obj = new OrderDetail();
                        obj.Quantity = item.Quantity;
                        obj.OrderId = intOrderId;
                        obj.ProductId = item.Product.Id;
                        lstOrderDetail.Add(obj);
                    }
                }
                obj.OrderDetails.AddRange(lstOrderDetail);
                obj.SaveChanges();
            }
            return View();

        }
    }
}