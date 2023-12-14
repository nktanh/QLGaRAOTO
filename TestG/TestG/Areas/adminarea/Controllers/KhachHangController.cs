using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.Models;
using PagedList;
using System.Runtime.Remoting.Activation;
using TestG.App_Start;

namespace TestG.Areas.adminarea.Controllers
{
    [dnSession]
    public class KhachHangController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/KhachHang
        public ActionResult Index(string timkiem, int? page)
        {
            MapKhachHang map = new MapKhachHang();
            var data = map.DanhSach(timkiem);

            int pageSize = 30;


            int pageNumber = (page ?? 1);


            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
        }


        // GET: adminarea/KhachHang/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: adminarea/KhachHang/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDKhachHang,TenKH,SDT,DiaChi,AnhKH")] KhachHang khachHang)
        {
            if (string.IsNullOrWhiteSpace(khachHang.TenKH))
            {
                ModelState.AddModelError("Ten", "Tên vật tư không được trống.");
            }
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(khachHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khachHang);
        }

        // GET: adminarea/KhachHang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: adminarea/KhachHang/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDKhachHang,TenKH,SDT,DiaChi,AnhKH")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(khachHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        // GET: adminarea/KhachHang/Delete/5
        public ActionResult Delete(int? id)
        {
            KhachHang khachHang = db.KhachHangs.Find(id);
            db.KhachHangs.Remove(khachHang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: adminarea/KhachHang/Delete/5
        public ActionResult Details(int? id)
        {

           
            KhachHang kh = db.KhachHangs.Find(id);

            return View(kh);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        #region hinhanh

        public ActionResult CapNhatAnh(int id)
        {
            ViewBag.id = id;
            return View();
        }
        [HttpPost]
        public ActionResult CapNhatAnh(int id, HttpPostedFileBase fileanh)
        {
            if (fileanh == null)
            {
                ViewBag.error = "Chưa chọn file";
                ViewBag.id = id;
                return View();
            }
            if (fileanh.ContentLength == 0)
            {
                ViewBag.error = "File không có nội dung";
                ViewBag.id = id;
                return View();
            }
            var urlTuongDoi = "/Images/";
            var urlTuyetDoi = Server.MapPath(urlTuongDoi);
            fileanh.SaveAs(urlTuyetDoi + fileanh.FileName);

            MapKhachHang map = new MapKhachHang();
            map.CapNhatHinhAnh(id, urlTuongDoi + fileanh.FileName);

            ViewBag.id = id;
            return RedirectToAction("Details", new { id });
        }

        #endregion
    }
}
