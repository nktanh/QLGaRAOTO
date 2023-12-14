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
    public class ChiTietUsersController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/ChiTietUsers
       
        public ActionResult Index()
        {
            var chiTietUsers = db.ChiTietUsers.Include(c => c.IDChucVu);
            return View(chiTietUsers.ToList());
        }

        // GET: adminarea/ChiTietUsers/Details/5

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

        // GET: adminarea/ChiTietUsers/Create
       
        public ActionResult Create()
        {
            ViewBag.IDUser = new SelectList(db.Users, "IDUser", "TenTK");
            return View();
        }

        // POST: adminarea/ChiTietUsers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(ChiTietUser chiTietUser, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            

            if (fFileUpload == null)
            {

                ViewBag.ThongBao = "Hãy chọn ảnh";
                ViewBag.IDUser = new SelectList(db.Users, "IDChucVu", "TenTK", chiTietUser.ChucVu);
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                //Lay tên file (Khai báo thu viên: System.I0)

                var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lay durong dan luu file
                    var path = Path.Combine(Server.MapPath("~/Images"), sFileName);
                    //Kiem tra anh bia
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }

                    chiTietUser.HoTen = f["sTen"];
                    chiTietUser.DiaChi = f["sDiaChi"];
                    chiTietUser.Anh = sFileName;
                    chiTietUser.NgaySinh = Convert.ToDateTime(f["dNgayCapNhat"]);
                    chiTietUser.Luong = int.Parse(f["iSoLuong"]);
                    
                    chiTietUser.CMND = (f["CMND"]);
                    chiTietUser.SoDienThoai = f["iSoDienThoai"];
                    chiTietUser.IDChucVu = int.Parse(f["Ma"]);
                    db.ChiTietUsers.Add(chiTietUser);
                    db.SaveChanges();
                    //Vê lai trang Quán ly sách
                    return RedirectToAction("Index");
                }

            }
            return View();
        }

        // GET: adminarea/ChiTietUsers/Edit/5
        
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
            ViewBag.IDUser = new SelectList(db.Users, "IDChucVu", "TenTK", chiTietUser.IDChucVu);
            return View(chiTietUser);
        }

        // POST: adminarea/ChiTietUsers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNguoiDung,IDUser,HoTen,DiaChi,CMND,SoDienThoai,Luong,NgaySinh")] ChiTietUser chiTietUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chiTietUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDUser = new SelectList(db.Users, "IDChucVu", "TenTK", chiTietUser.IDChucVu);
            return View(chiTietUser);
        }

        // GET: adminarea/ChiTietUsers/Delete/5
        
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

        // POST: adminarea/ChiTietUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ChiTietUser chiTietUser = db.ChiTietUsers.Find(id);
            db.ChiTietUsers.Remove(chiTietUser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #region
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
            map.CapNhatHinhAnhNhanVien(id, urlTuongDoi + fileanh.FileName);

            ViewBag.id = id;
            return RedirectToAction("Index");
        }

#endregion
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
