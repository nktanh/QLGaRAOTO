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
using TestG.App_Start;

namespace TestG.Areas.adminarea.Controllers
{
    [dnSession]
    public class TiepNhanXeController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/TiepNhanXe
        public ActionResult Index(string timkiem, int? page, string tBanGiaoXe)
        {
            MapTiepNhanXe map = new MapTiepNhanXe();
            var data = map.DanhSach(timkiem, tBanGiaoXe);
            
            int pageSize = 20;
            int pageNumber = (page ?? 1);
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
        }

        // GET: adminarea/TiepNhanXe/Details/5
        public ActionResult Details(int? id)
        {
            TiepNhanXe tiepNhanXe = db.TiepNhanXes.Find(id);
            return View(tiepNhanXe);
        }

        // GET: adminarea/TiepNhanXe/Create
        public ActionResult Create()
        {
            ViewBag.IDKhachHang = new SelectList(db.KhachHangs, "IDKhachHang", "TenKH");
            ViewBag.IDThuongHieuXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu");
            ViewBag.IDNhanVien = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen");
            TiepNhanXe model = new TiepNhanXe();
            model.NgayTiepNhan = DateTime.Now;
            return View(model);
        }

        // POST: adminarea/TiepNhanXe/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDTiepNhanXe,BienSoXe,NgayTiepNhan,IDKhachHang,IDThuongHieuXe,BanGiaoXe,IDNhanVien")] TiepNhanXe tiepNhanXe)
        {
            if (tiepNhanXe.BienSoXe == null) // Assuming GiaNhap is a nullable numeric type
            {
                ModelState.AddModelError("BienSoXe", "Vui lòng nhập biển số xe.");
            }
            if (tiepNhanXe.IDKhachHang == null) // Assuming GiaNhap is a nullable numeric type
            {
                ModelState.AddModelError("IDKhachHang", "Vui lòng nhập đầy đủ.");
            }
            if (tiepNhanXe.IDThuongHieuXe == null) // Assuming GiaNhap is a nullable numeric type
            {
                ModelState.AddModelError("IDThuongHieuXe", "Vui lòng nhập đầy đủ.");
            }
            if (tiepNhanXe.IDNhanVien == null) // Assuming GiaNhap is a nullable numeric type
            {
                ModelState.AddModelError("IDNhanVien", "Vui lòng nhập đầy đủ.");
            }
            if (ModelState.IsValid)
            {
                db.TiepNhanXes.Add(tiepNhanXe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDKhachHang = new SelectList(db.KhachHangs, "IDKhachHang", "TenKH", tiepNhanXe.IDKhachHang);
            ViewBag.IDThuongHieuXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", tiepNhanXe.IDThuongHieuXe);
            ViewBag.IDNhanVien = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", tiepNhanXe.IDNhanVien);
            return View(tiepNhanXe);
        }

        // GET: adminarea/TiepNhanXe/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TiepNhanXe tiepNhanXe = db.TiepNhanXes.Find(id);
            if (tiepNhanXe == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDKhachHang = new SelectList(db.KhachHangs, "IDKhachHang", "TenKH", tiepNhanXe.IDKhachHang);
            ViewBag.IDThuongHieuXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", tiepNhanXe.IDThuongHieuXe);
            ViewBag.IDNhanVien = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", tiepNhanXe.IDNhanVien);
            return View(tiepNhanXe);
        }

        // POST: adminarea/TiepNhanXe/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDTiepNhanXe,BienSoXe,NgayTiepNhan,IDKhachHang,IDThuongHieuXe,BanGiaoXe,IDNhanVien")] TiepNhanXe tiepNhanXe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tiepNhanXe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDKhachHang = new SelectList(db.KhachHangs, "IDKhachHang", "TenKH", tiepNhanXe.IDKhachHang);
            ViewBag.IDThuongHieuXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", tiepNhanXe.IDThuongHieuXe);
            ViewBag.IDNhanVien = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", tiepNhanXe.IDNhanVien);
            return View(tiepNhanXe);
        }

        // GET: adminarea/TiepNhanXe/Delete/5
        public ActionResult Delete(int? id)
        {
            TiepNhanXe tiepNhanXe = db.TiepNhanXes.Find(id);
            db.TiepNhanXes.Remove(tiepNhanXe);
            db.SaveChanges();
            return RedirectToAction("Index");
            
        }

        // POST: adminarea/TiepNhanXe/Delete/5
        [HttpPost]
        public ActionResult ChuyenBanGiaoXe(int id)
        {
          
            var tiepNhanXe = db.TiepNhanXes.Find(id);
            tiepNhanXe.BanGiaoXe = !tiepNhanXe.BanGiaoXe;
            db.SaveChanges();
            return Json(new { success = true });
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        #region SuaChua
        public ActionResult SuaChua(int? id)
        {


            return View(new SuaChua()
            {
                IDTiepNhan = id,
                NgayLap = DateTime.Now
            });

        }
        [HttpPost]
        public ActionResult SuaChua(SuaChua suaChua)
        {


            if (ModelState.IsValid)
            {
                db.SuaChuas.Add(suaChua);
                db.SaveChanges();
                return View();
            }
            return View(suaChua);

        }
        #endregion
        public ActionResult ThemHinhAnh(int id)
        {
            ViewBag.id = id;
            return View();
        }
    }
}
