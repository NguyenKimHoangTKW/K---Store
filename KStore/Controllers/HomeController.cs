using KStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;

namespace KStore.Controllers
{
    public class HomeController : Controller
    {
        private dbKStoreEntities db = new dbKStoreEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult AoSoMiPartial()
        {
            var listProduct = db.Products.Where(p => p.stock == true && p.ProductCategory.codeProductCategory == "DMSP2223PT").Take(3);
            return PartialView(listProduct.ToList());
        }
        public ActionResult BoSuuTapPartial()
        {
            var listProduct = db.ProductCategories.ToList();
            return PartialView(listProduct);
        }
        public ActionResult QuanTayPartial()
        {
            var listProduct = db.Products.Where(p => p.stock == true && p.ProductCategory.codeProductCategory == "DMSP2423PT").Take(3);
            return PartialView(listProduct.ToList());
        }
        public ActionResult ListSanPhamTheoCat(int? id, int? page)
        {
            ViewBag.idCat = id;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            var listProduct = db.Products.Where(p => p.idProductCategory == id && p.stock == true).OrderBy(p => p.idProduct).Take(12).ToList();
            ViewBag.TongSanPham = listProduct.Count;
            return View(listProduct.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ChiTietDonHang(int id)
        {
            var listProduct = from b in db.Products
                              where b.idProduct == id
                              select b;
    
            return View(listProduct.Single());
        }

        public ActionResult SizeTheoSanPham(int? id)
        {
            var listProduct = db.Product_Size.Where(s => s.idProduct == id);
            return PartialView(listProduct);
        }
        public ActionResult HuongDanChonSize()
        {
            return View();
        }
        public ActionResult SanPhamMoi()
        {
            var lissanpham = db.Products.OrderByDescending(p => p.updateDay).Take(8);
            
            return PartialView(lissanpham.ToList());
        }

        public ActionResult DatHangPartial(int id)
        {
            var products = db.Products.Where(o => o.idProduct == id);
            return PartialView("DatHangPartial", products);
        }

        public ActionResult FullSanPham( int? page)
        {
            var fullsanpham = db.Products.ToList();
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return PartialView(fullsanpham.ToPagedList(pageNumber, pageSize));
        }
  
        public ActionResult LayTatCaSanPham(string searchString, int? page)
        {
            var fullsanpham = db.Products.ToList().OrderBy(p => p.idProduct);
            if (!String.IsNullOrEmpty(searchString))
                fullsanpham = fullsanpham.Where(b => b.nameProduct.Contains(searchString)).OrderByDescending(a => a.updateDay);
            ViewBag.Keyword = searchString;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            return View(fullsanpham.ToPagedList(pageNumber, pageSize));
        }

    }
}