using KStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Data.Entity;
using System.Net;
using System.Threading.Tasks;

namespace KStore.Controllers
{
    public class GioHangController : Controller
    {
        private dbKStoreEntities db = new dbKStoreEntities();
        // GET: Cart
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        public ActionResult ThemGioHangChiTiet(int ms, string url, FormCollection f)
        {
            List<GioHang> lstCart = LayGioHang();
            int selectedSize = int.Parse(f["txtSize"].ToString()); 

            GioHang sp = lstCart.Find(n => n.iSanPham == ms && n.iSize == selectedSize);

            if (sp == null)
            {
                sp = new GioHang(ms);
                sp.iSize = selectedSize;
                lstCart.Add(sp);
            }
            else
            {
                sp.iSoLuong += int.Parse(f["txtSoLuong"].ToString());
            }
            return Redirect(url);
        }
        public ActionResult ThemGioHang(int ms, string url)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang sp = listGioHang.Find(n => n.iSanPham == ms);
            if (sp == null)
            {
                sp = new GioHang(ms);
                listGioHang.Add(sp);
            }
            else
            {
                sp.iSoLuong++;
            }
            return Redirect(url);
        }

        private int TongSoLuong()
        {
            int iSumQuantity = 0;
            List<GioHang> lstCart = Session["GioHang"] as List<GioHang>;
            if (lstCart != null)
            {
                iSumQuantity = lstCart.Sum(n => n.iSoLuong);
            }
            return iSumQuantity;
        }

        private double TongTien()
        {
            double dSumPrice = 0;
            List<GioHang> lstCart = Session["GioHang"] as List<GioHang>;
            if (lstCart != null)
            {
                dSumPrice = lstCart.Sum(n => n.ThanhTien);
            }
            return dSumPrice;
        }
        private double TongTienShip()
        {
            double dSumPrice = 0;
            List<GioHang> lstCart = Session["GioHang"] as List<GioHang>;
            if (lstCart != null)
            {
                dSumPrice = lstCart.Sum(n => n.ThanhTienShip);
            }
            return dSumPrice;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstCart = LayGioHang();
            if (lstCart.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TongTienShip = TongTienShip();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstCart);
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.TongTienShip = TongTienShip();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }

        public ActionResult XoaSanPham(int iMaSanPham, int? iSize)
        {
            List<GioHang> lstCart = LayGioHang();
            GioHang sp = lstCart.FirstOrDefault(n => n.iSanPham == iMaSanPham && n.iSize == iSize);
            if (sp != null)
            {
                lstCart.Remove(sp);
                if (lstCart.Count == 0)
                {
                    return RedirectToAction("Index", "Home");

                }
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapNhatGioHang(int iMaSanPham,int iSize, FormCollection f)
        {
            List<GioHang> lstCart = LayGioHang();
            GioHang sp = lstCart.FirstOrDefault(n => n.iSanPham == iMaSanPham && n.iSize == iSize);
            if (sp != null)
            {
                sp.iSoLuong = int.Parse(f["txtSoLuong"].ToString());

            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaToanBoSanPham()
        {
            List<GioHang> lstCart = LayGioHang();
            lstCart.Clear();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult Order()
        {
            if (Session["Customer"] == null || Session["Customer"].ToString() == "")
            {
                return RedirectToAction("Login", "Account");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstCart = LayGioHang ();
            ViewBag.TongTienShip = TongTienShip();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstCart);
        }

        [HttpPost]
        public ActionResult Order(FormCollection f)
        {
            
            var checkpayy = f["CheckPay"];
            Order order = new Order();
            Customer customer = (Customer)Session["Customer"];
            List<GioHang> lstCart = LayGioHang();
            if (Session["Customer"] == null || Session["Customer"].ToString() == "")
            {
                return RedirectToAction("Login", "Account");
            }
            else
            {
                order.codeOrder = "HĐ" + DateTime.Now.ToString("yyyyMMddHHmmss");
                order.idCustomer = customer.idCustomer;
                order.orderDate = DateTime.Now;
                order.checkPay = checkpayy;
                order.deliveryStatus = "Chờ xác nhận";
                db.Orders.Add(order);
                db.SaveChanges();
                foreach (var item in lstCart)
                {
                    OrderDetail orderdetail = new OrderDetail();
                    orderdetail.idOrder = order.idOrder;
                    orderdetail.idProduct_Size = item.iSanPham;
                    orderdetail.quantity = item.iSoLuong;
                    orderdetail.idSize = item.iSize;
                    orderdetail.price = (decimal)item.dDonGia;
                    orderdetail.TotalPrice = (decimal)(item.iSoLuong * (decimal)item.dDonGia) + 40000;
                    db.OrderDetails.Add(orderdetail);
                }
                db.SaveChanges();
                Session["GioHang"] = null;
            }            
            return RedirectToAction("OrderConfirm", "GioHang");

        }

        public ActionResult OrderConfirm()
        {
            return View();
        }
        public ActionResult TinhTrangGiaoHang(int? id, int? page)
        {
            ViewBag.Orderid = id;

            int iSizePage = 5;
            int iPageNumber = (page ?? 1);
            var order = db.Orders.Where(o => o.idCustomer == id).OrderByDescending(o => o.orderDate).ToList();
            return View(order.ToPagedList(iPageNumber, iSizePage));
        }

        public ActionResult ThongTinDonHang(int? id)
        {
            var orderdetail = db.OrderDetails.Where(o => o.idOrder == id);
            return PartialView(orderdetail);
        }
        
        public ActionResult ErrorThongTinHang()
        {
            return View();
        }
        public async Task<ActionResult> HuyDonHang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Order order = db.Orders.Find(id);

            if (order == null)
            {
                return HttpNotFound();
            }
            order.deliveryStatus = "Đơn hàng đã hủy";
            order.deliveryDate = DateTime.Now;
            db.Entry(order).State = EntityState.Modified;
            await db.SaveChangesAsync();
            if (Request.UrlReferrer != null)
            {
                TempData["SweetAlertMessage"] = "Hủy đơn hàng thành công";
                TempData["SweetAlertType"] = "success";
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                return View();
            }
        }
    }
}