using Microsoft.Ajax.Utilities;
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
    public class SuaChuaController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/SuaChua
        public ActionResult Index()
        {
            var suaChuas = db.SuaChuas.Include(s => s.TiepNhanXe);
            return View(suaChuas.ToList());
        }

        // GET: adminarea/SuaChua/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SuaChua suaChua = db.SuaChuas.Find(id);
            if (suaChua == null)
            {
                return HttpNotFound();
            }
            return View(suaChua);
        }

        // GET: adminarea/SuaChua/Create
        public ActionResult Create()
        {
            ViewBag.IDTiepNhan = new SelectList(db.TiepNhanXes, "IDTiepNhanXe", "BienSoXe");
            SuaChua model = new SuaChua();
            model.NgayLap = DateTime.Now;
            
            return View(model);
        }

        // POST: adminarea/SuaChua/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDMaSuaChua,NgayLap,IDTiepNhan,NgaySua,NoiDung")] SuaChua suaChua)
        {
            if (ModelState.IsValid)
            {
                db.SuaChuas.Add(suaChua);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDTiepNhan = new SelectList(db.TiepNhanXes, "IDTiepNhanXe", "BienSoXe", suaChua.IDTiepNhan);
            return View(suaChua);
        }

        // GET: adminarea/SuaChua/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SuaChua suaChua = db.SuaChuas.Find(id);
            if (suaChua == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDTiepNhan = new SelectList(db.TiepNhanXes, "IDTiepNhanXe", "BienSoXe", suaChua.IDTiepNhan);
            return View(suaChua);
        }

        // POST: adminarea/SuaChua/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDMaSuaChua,NgayLap,IDTiepNhan,NgaySua,NoiDung")] SuaChua suaChua)
        {
            if (ModelState.IsValid)
            {
                db.Entry(suaChua).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDTiepNhan = new SelectList(db.TiepNhanXes, "IDTiepNhanXe", "BienSoXe", suaChua.IDTiepNhan);
            return View(suaChua);
        }

        // GET: adminarea/SuaChua/Delete/5
        public ActionResult Delete(int? id)
        {
            SuaChua suachua = db.SuaChuas.Find(id);
            db.SuaChuas.Remove(suachua);
            db.SaveChanges();
            return RedirectToAction("Index", "TiepNhanXe");
        }
        public ActionResult ThayLinhKien(int ? id)
        {
            return View(new ThayVatTu()
            {
                NgayThay=DateTime.Now,
                IDSuaChua = id
                
            }) ;
        }
        [HttpPost]
        public ActionResult ThayLinhKien(ThayVatTu thayVatTu)
        {
            DA_QLGarageEntities db = new DA_QLGarageEntities();
            var check = db.ThayVatTus.Count(n => n.IDSuaChua == thayVatTu.IDSuaChua && n.IDVatTu == thayVatTu.IDVatTu);

            thayVatTu.SoLuong = thayVatTu.SoLuong ?? 1;
            if (thayVatTu.SoLuong <= 0)
            {
                ModelState.AddModelError("", "Số lượng phải lớn hơn 0");
                return View(thayVatTu);
            }
            if (check > 0)
            {
                ModelState.AddModelError("", "Đã thay linh kiện này");
            }
            var vatTu = db.VatTus.Find(thayVatTu.IDVatTu);

            if (vatTu == null || vatTu.SoLuong < thayVatTu.SoLuong)
            {
                ModelState.AddModelError("", "Không đủ linh kiện trong kho");
                return View(thayVatTu);
            }
            vatTu.SoLuong -= thayVatTu.SoLuong;
            var thongKeVT = db.ThongKeVts.FirstOrDefault(t => t.IDVatTu == thayVatTu.IDVatTu);
            if (thongKeVT == null)
            {
                thongKeVT = new ThongKeVt
                {
                    IDVatTu = thayVatTu.IDVatTu,
                    SoLuong = thayVatTu.SoLuong ?? 0,
                    Ngay = thayVatTu.NgayThay
                    
                };
                db.ThongKeVts.Add(thongKeVT);
            }
            
            else
            {
                if (thongKeVT.Ngay== thayVatTu.NgayThay)
                {
                    thongKeVT.SoLuong += thayVatTu.SoLuong ?? 0;
                }
                thongKeVT = new ThongKeVt
                {
                    IDVatTu = thayVatTu.IDVatTu,
                    SoLuong = thayVatTu.SoLuong ?? 0,
                    Ngay = thayVatTu.NgayThay

                };
                db.ThongKeVts.Add(thongKeVT);

            }
            if (ModelState.IsValid)
            {
                db.ThayVatTus.Add(thayVatTu);
                db.SaveChanges();
                return View();
            }

            return View(thayVatTu);
        }
        public ActionResult Xoa(int? id)
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
            string returnUrl = Request.UrlReferrer?.ToString();
            return Redirect(returnUrl ?? Url.Action("Index", "HomeAdmin"));
        }
        public ActionResult CapNhatSoLuong(int id)
        {
            ThayVatTu vt = db.ThayVatTus.Find(id);

            ViewBag.id = id;
            return View(vt);
        }
        [HttpPost]
        public ActionResult CapNhatSoLuong(int id, int soluong)
        {
            if (soluong < 0)
            {
                ViewBag.err = "Số lượng không hợp lệ";
                ViewBag.id = id;
                return View();
            }
            var thayVatTu = db.ThayVatTus.Find(id);
            if (thayVatTu == null)
            {
                ViewBag.err = "Vật tư không tồn tại";
                return View();
            }
            mapSuaChua map = new mapSuaChua();

            map.CapNhatSoLuong(id, soluong);

            db.SaveChanges();

            // Instead of RedirectToAction, you can use JavaScript to redirect on the client side
            string redirectScript = "<script>window.location.href = '/adminarea/SuaChua/Details/" + thayVatTu.IDSuaChua + "';</script>";
            return Content(redirectScript, "text/html");
        }

        public PartialViewResult dd(int id)
        {
            ViewBag.id = id;
            return PartialView();
        }
        [HttpPost]
        public PartialViewResult dd(int id,int soluong)
        {
            if (soluong < 0)
            {
                ViewBag.err = "Số lượng không hợp lệ";
                ViewBag.id = id;
                return PartialView();
            }
            var thayVatTu = db.ThayVatTus.Find(id);
            if (thayVatTu == null)
            {
                ViewBag.err = "Vật tư không tồn tại";
                return PartialView();
            }
            mapSuaChua map = new mapSuaChua();

            map.CapNhatSoLuong(id, soluong);

            db.SaveChanges();


            // Redirect back to the details page or any other appropriate page
            
            ViewBag.id = id;
            return PartialView("Details", new { id = thayVatTu?.IDSuaChua });
        }
        public ActionResult XoaNhanCong(int? id)
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
            db.NhanCongSuaChuaXes.Remove(nhanCongSuaChuaXe);
            db.SaveChanges();
            string redirectScript = "<script>window.location.href = '/adminarea/SuaChua/Details/" + nhanCongSuaChuaXe.IDSuaChua + "';</script>";
            return Content(redirectScript, "text/html");
        }
        public ActionResult NhanCong(int? id)
        {
           
            return View(new NhanCongSuaChuaXe()
            {
                IDSuaChua = id
            });
        }
        [HttpPost]
        public ActionResult NhanCong(NhanCongSuaChuaXe nhanCongSuaChuaXe)
        {

            var check = db.NhanCongSuaChuaXes.Count(n => n.IDSuaChua == nhanCongSuaChuaXe.IDSuaChua && n.IDUser == nhanCongSuaChuaXe.IDUser);

           
            if (check > 0)
            {
                ModelState.AddModelError("", "Nhân viên này có rồi");
                return View();
            }
            

                db.NhanCongSuaChuaXes.Add(nhanCongSuaChuaXe);
                db.SaveChanges();
            return RedirectToAction("Details", new { id = nhanCongSuaChuaXe?.IDSuaChua });
           

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
