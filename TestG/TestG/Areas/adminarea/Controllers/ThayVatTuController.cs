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
    public class ThayVatTuController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/ThayVatTu
        public ActionResult Index(DateTime? startDate, DateTime? endDate)
        {
            var model = db.ThayVatTus.Include(t => t.DichVu).Include(t => t.SuaChua);
            if (startDate.HasValue)
            {
                model = model.Where(item => item.NgayThay >= startDate.Value);
            }

            if (endDate.HasValue)
            {
                model = model.Where(item => item.NgayThay <= endDate.Value);
            }

            return View(model);
            
        }

        // GET: adminarea/ThayVatTu/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThayVatTu thayVatTu = db.ThayVatTus.Find(id);
            if (thayVatTu == null)
            {
                return HttpNotFound();
            }
            return View(thayVatTu);
        }

        // GET: adminarea/ThayVatTu/Create
        public ActionResult Create()
        {
            ViewBag.IDDichVu = new SelectList(db.DichVus, "IDTienCong", "Ten");
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung");
            return View();
        }

        // POST: adminarea/ThayVatTu/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDThayVatTu,IDVatTu,IDSuaChua,SoLuong,IDDichVu")] ThayVatTu thayVatTu)
        {
            if (ModelState.IsValid)
            {
                db.ThayVatTus.Add(thayVatTu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDDichVu = new SelectList(db.DichVus, "IDTienCong", "Ten", thayVatTu.IDDichVu);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", thayVatTu.IDSuaChua);
            return View(thayVatTu);
        }

        // GET: adminarea/ThayVatTu/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThayVatTu thayVatTu = db.ThayVatTus.Find(id);
            if (thayVatTu == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDDichVu = new SelectList(db.DichVus, "IDTienCong", "Ten", thayVatTu.IDDichVu);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", thayVatTu.IDSuaChua);
            return View(thayVatTu);
        }

        // POST: adminarea/ThayVatTu/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDThayVatTu,IDVatTu,IDSuaChua,SoLuong,IDDichVu")] ThayVatTu thayVatTu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(thayVatTu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDDichVu = new SelectList(db.DichVus, "IDTienCong", "Ten", thayVatTu.IDDichVu);
            ViewBag.IDSuaChua = new SelectList(db.SuaChuas, "IDMaSuaChua", "NoiDung", thayVatTu.IDSuaChua);
            return View(thayVatTu);
        }

        // GET: adminarea/ThayVatTu/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThayVatTu thayVatTu = db.ThayVatTus.Find(id);
            if (thayVatTu == null)
            {
                return HttpNotFound();
            }
            db.ThayVatTus.Remove(thayVatTu);
            db.SaveChanges();
            TempData["Message"] = "Record deleted successfully.";
            return View();
        }

        // POST: adminarea/ThayVatTu/Delete/5
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
