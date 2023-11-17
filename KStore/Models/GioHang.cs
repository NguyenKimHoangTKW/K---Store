using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KStore.Models
{
    public class GioHang
    {
        private dbKStoreEntities db = new dbKStoreEntities();
        public int iSanPham { get; set; }
        public string sTenSanPham { get; set; }
        public string sAnhSanPham { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public int iSize { get; set; }
        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        public double ThanhTienShip
        {
            get { return (iSoLuong * dDonGia) + 40000; }
        }
        public string nameSize
        {
            get
            {
                var size = db.Sizes.FirstOrDefault(s => s.idSize == iSize);
                return size != null ? size.nameSize : "";
            }
        }
        public GioHang(int ms)
        {
            iSanPham = ms;
            Product b = db.Products.Single(n => n.idProduct == iSanPham);
            sTenSanPham = b.nameProduct;
            sAnhSanPham = b.thumb;
            dDonGia = double.Parse(b.price.ToString());
            iSoLuong = 1;
        }
    }
}