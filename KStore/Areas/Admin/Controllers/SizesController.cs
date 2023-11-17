﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KStore.App_Start;
using KStore.Models;
using PagedList;

namespace KStore.Areas.Admin.Controllers
{
    [AdminAuthorize]
    public class SizesController : Controller
    {
        private dbKStoreEntities db = new dbKStoreEntities();

        // GET: Admin/Sizes
        public ActionResult Index()
        {
            var sizes = db.Sizes.OrderBy(p => p.idSize);
            
          
            return View(sizes.ToList());
        }

        // GET: Admin/Sizes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Size size = db.Sizes.Find(id);
            if (size == null)
            {
                return HttpNotFound();
            }
            return View(size);
        }

        // GET: Admin/Sizes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Sizes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idSize,nameSize,status")] Size size)
        {
            if (ModelState.IsValid)
            {
                if (db.Sizes.SingleOrDefault(s => s.nameSize == size.nameSize) != null)
                {
                    ViewBag.ThongBao = "Size này đã tồn tại trong list, vui lòng nhập size khác";
                }
                else
                {
                    int nextId = GetNextId();
                    size.idSize = nextId;
                    db.Sizes.Add(size);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            return View(size);
        }
        private int GetNextId()
        {
            // Tìm giá trị id tiếp theo trong bảng
            int? maxId = db.Sizes.Max(t => (int?)t.idSize);

            if (maxId.HasValue)
            {
                return maxId.Value + 1;
            }
            {
                return 1;
            }
        }
        // GET: Admin/Sizes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Size size = db.Sizes.Find(id);
            if (size == null)
            {
                return HttpNotFound();
            }
            return View(size);
        }

        // POST: Admin/Sizes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idSize,nameSize,status")] Size size)
        {
            if (ModelState.IsValid)
            {
                db.Entry(size).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(size);
        }

        // GET: Admin/Sizes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Size size = db.Sizes.Find(id);
            if (size == null)
            {
                return HttpNotFound();
            }
            return View(size);
        }

        // POST: Admin/Sizes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Size size = db.Sizes.Find(id);
            if(db.Product_Size.Any(s => s.idSize == size.idSize))
            {
                ViewBag.ThongBao = "Không thể xóa vì Size này đang tồn tại trong sản phẩm theo size , vui lòng kiểm tra lại dữ liệu !!!";
            }
            else if (db.OrderDetails.Any(o => o.idSize == size.idSize))
            {
                ViewBag.ThongBao = "Không thể xóa vì Size này đang tồn tại trong chi tiết hóa đơn đang tồn tại sản phẩm này, vui lòng kiểm tra lại dữ liệu !!!";
            }
            else
            {
                db.Sizes.Remove(size);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(size);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
