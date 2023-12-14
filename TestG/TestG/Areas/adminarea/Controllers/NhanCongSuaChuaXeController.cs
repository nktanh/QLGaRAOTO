using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.App_Start;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    [dnSession]
    public class NhanCongSuaChuaXeController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/NhanCongSuaChuaXe
        public ActionResult Index()
        {
            var nhanCongSuaChuaXes = db.NhanCongSuaChuaXes.Include(n => n.ChiTietUser).Include(n => n.SuaChua);
            return View(nhanCongSuaChuaXes.ToList());
        }

        // GET: adminarea/NhanCongSuaChuaXe/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanCongSuaChuaXe nhanCongSuaChuaXe = db.NhanCongSuaChuaXes.Find(id);
            if (nhanCongSuaChuaXe == null)
            {
                return HttpNotFound();
            }
            return View(nhanCongSuaChuaXe);
        }

        // GET: adminarea/NhanCongSuaChuaXe/Create
        public ActionResult Create()
        {
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen");
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung");
            return View();
        }

        // POST: adminarea/NhanCongSuaChuaXe/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDNhanCongSuaChua,IDUser,NoiDung,IDSuaChua")] NhanCongSuaChuaXe nhanCongSuaChuaXe)
        {
            if (ModelState.IsValid)
            {
                db.NhanCongSuaChuaXes.Add(nhanCongSuaChuaXe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhanCongSuaChuaXe.IDUser);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", nhanCongSuaChuaXe.IDSuaChua);
            return View(nhanCongSuaChuaXe);
        }

        // GET: adminarea/NhanCongSuaChuaXe/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanCongSuaChuaXe nhanCongSuaChuaXe = db.NhanCongSuaChuaXes.Find(id);
            if (nhanCongSuaChuaXe == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhanCongSuaChuaXe.IDUser);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", nhanCongSuaChuaXe.IDSuaChua);
            return View(nhanCongSuaChuaXe);
        }

        // POST: adminarea/NhanCongSuaChuaXe/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNhanCongSuaChua,IDUser,NoiDung,IDSuaChua")] NhanCongSuaChuaXe nhanCongSuaChuaXe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhanCongSuaChuaXe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhanCongSuaChuaXe.IDUser);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", nhanCongSuaChuaXe.IDSuaChua);
            return View(nhanCongSuaChuaXe);
        }

        // GET: adminarea/NhanCongSuaChuaXe/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanCongSuaChuaXe nhanCongSuaChuaXe = db.NhanCongSuaChuaXes.Find(id);
            if (nhanCongSuaChuaXe == null)
            {
                return HttpNotFound();
            }
            return View(nhanCongSuaChuaXe);
        }

        // POST: adminarea/NhanCongSuaChuaXe/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhanCongSuaChuaXe nhanCongSuaChuaXe = db.NhanCongSuaChuaXes.Find(id);
            db.NhanCongSuaChuaXes.Remove(nhanCongSuaChuaXe);
            db.SaveChanges();
            return RedirectToAction("Index");
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
