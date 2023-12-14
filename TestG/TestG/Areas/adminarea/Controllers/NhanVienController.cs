using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.App_Start;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    
    public class NhanVienController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/NhanVien
        [dnSession(idQuyen = 10)]
        public ActionResult Index()
        {
            var chiTietUsers = db.ChiTietUsers.Include(c => c.ChucVu);
            return View(chiTietUsers.ToList());
        }

        // GET: adminarea/NhanVien/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietUser chiTietUser = db.ChiTietUsers.Find(id);
            if (chiTietUser == null)
            {
                return HttpNotFound();
            }
            return View(chiTietUser);
        }

        // GET: adminarea/NhanVien/Create

        public ActionResult Create()
        {
            ViewBag.IDChucVu = new SelectList(db.ChucVus, "IDChucVu", "TenChucVu");
            return View();
        }

        // POST: adminarea/NhanVien/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDNguoiDung,IDChucVu,HoTen,DiaChi,CMND,SoDienThoai,Luong,NgaySinh,Anh,tk,mk")] ChiTietUser chiTietUser, HttpPostedFileBase AnhFile)
        {
            if (ModelState.IsValid)
            {
                // Handle image upload
                if (AnhFile != null && AnhFile.ContentLength > 0)
                {
                    // Save the file to the server
                    var fileName = Path.GetFileName(AnhFile.FileName);
                    var filePath = Path.Combine(Server.MapPath("~/Images"), fileName);
                    AnhFile.SaveAs(filePath);              
                    chiTietUser.Anh = "~/Images/" + fileName;
                }

                db.ChiTietUsers.Add(chiTietUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDChucVu = new SelectList(db.ChucVus, "IDChucVu", "TenChucVu", chiTietUser.IDChucVu);
            return View(chiTietUser);
        }

        // GET: adminarea/NhanVien/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietUser chiTietUser = db.ChiTietUsers.Find(id);
            if (chiTietUser == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDChucVu = new SelectList(db.ChucVus, "IDChucVu", "TenChucVu", chiTietUser.IDChucVu);
            return View(chiTietUser);
        }

        // POST: adminarea/NhanVien/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNguoiDung,IDChucVu,HoTen,DiaChi,CMND,SoDienThoai,Luong,NgaySinh,Anh,tk,mk")] ChiTietUser chiTietUser, HttpPostedFileBase AnhFile)
        {
            if (ModelState.IsValid)
            {
               
                if (AnhFile != null && AnhFile.ContentLength > 0)
                {           
                    string fileName = Path.GetFileName(AnhFile.FileName);
                    string filePath = Path.Combine(Server.MapPath("/Images/"), fileName);
                    AnhFile.SaveAs(filePath);

                   // cập nhật ảnh
                    chiTietUser.Anh = "/Images/" + fileName;
                }

                db.Entry(chiTietUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDChucVu = new SelectList(db.ChucVus, "IDChucVu", "TenChucVu", chiTietUser.IDChucVu);
            return View(chiTietUser);
        }


        // GET: adminarea/NhanVien/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietUser chiTietUser = db.ChiTietUsers.Find(id);
            if (chiTietUser == null)
            {
                return HttpNotFound();
            }
            return View(chiTietUser);
        }

        // POST: adminarea/NhanVien/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ChiTietUser chiTietUser = db.ChiTietUsers.Find(id);
            db.ChiTietUsers.Remove(chiTietUser);
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
