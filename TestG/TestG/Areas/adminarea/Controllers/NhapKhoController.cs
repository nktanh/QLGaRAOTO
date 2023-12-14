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
    public class NhapKhoController : Controller
    {
        int a;
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/NhapKho
        public ActionResult Index()
        {
            var nhapKhoes = db.NhapKhoes.Include(n => n.ChiTietUser).Include(n => n.NhaCungCap);
            return View(nhapKhoes.ToList());
        }

        // GET: adminarea/NhapKho/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhapKho nhapKho = db.NhapKhoes.Find(id);
            if (nhapKho == null)
            {
                return HttpNotFound();
            }
            return View(nhapKho);
        }

        // GET: adminarea/NhapKho/Create
        public ActionResult Create()
        {
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen");
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten");
           

            return View(new NhapKho { NgayNhap=DateTime.Now});
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDNhapKho,IDUser,IDNCC,NgayNhap")] NhapKho nhapKho)
        {
            if (ModelState.IsValid)
            {
                ChiTietUser kh = (ChiTietUser)Session["user"];
                nhapKho.IDUser = kh.IDNguoiDung;
                db.NhapKhoes.Add(nhapKho);
                db.SaveChanges();
                int createdCTNhapKhoID = nhapKho.IDNhapKho;
                
                // Truyền ID vào ViewBag
                ViewBag.CreatedCTNhapKhoID = createdCTNhapKhoID;
                ViewBag.IDNCC = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten", nhapKho.IDNCC);

                return View(nhapKho);
            }

            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhapKho.IDUser);
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten", nhapKho.IDNCC);
            return View(nhapKho);
        }


        // GET: adminarea/NhapKho/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhapKho nhapKho = db.NhapKhoes.Find(id);
            if (nhapKho == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhapKho.IDUser);
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten", nhapKho.IDNCC);
            return View(nhapKho);
        }

        // POST: adminarea/NhapKho/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNhapKho,IDUser,IDNCC,NgayNhap")] NhapKho nhapKho)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhapKho).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDUser = new SelectList(db.ChiTietUsers, "IDNguoiDung", "HoTen", nhapKho.IDUser);
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten", nhapKho.IDNCC);
            return View(nhapKho);
        }

        // GET: adminarea/NhapKho/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhapKho nhapKho = db.NhapKhoes.Find(id);
            if (nhapKho == null)
            {
                return HttpNotFound();
            }
            return View(nhapKho);
        }

        // POST: adminarea/NhapKho/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhapKho nhapKho = db.NhapKhoes.Find(id);
            db.NhapKhoes.Remove(nhapKho);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult NhapLinhKien(int id)
        {
            return View(new CTNhapKhoVT()
            {
                IDNhapKho = id,
            });
        }

        [HttpPost]
        public ActionResult NhapLinhKien(CTNhapKhoVT cTNhapKho)
        {
            var check = db.CTNhapKhoVTs.Count(n => n.IDNhapKho == cTNhapKho.IDNhapKho && n.IDVatTu == cTNhapKho.IDVatTu);

            cTNhapKho.SoLuong = cTNhapKho.SoLuong ?? 1;
            if (cTNhapKho.SoLuong <= 0)
            {
                ModelState.AddModelError("", "Số lượng phải lớn hơn 0");
            }

            if (check > 0)
            {
                ModelState.AddModelError("", "Đã thay linh kiện này");
            }

            if (ModelState.IsValid)
            {
                db.CTNhapKhoVTs.Add(cTNhapKho);
                db.SaveChanges();

                // Update the inventory quantity in VatTu table
                var vatTu = db.VatTus.Find(cTNhapKho.IDVatTu);
                if (vatTu != null)
                {
                    
                   
                    // Update the inventory in CTTonKho table
                    var tonKho = db.CTTonKhoes.FirstOrDefault(t => t.IDVatTu == cTNhapKho.IDVatTu);
                    if (tonKho == null)
                    {
                        // If IDVatTu doesn't exist in CTTonKho, create a new record
                        tonKho = new CTTonKho
                        {
                            IDVatTu = cTNhapKho.IDVatTu,
                            TonDau = vatTu.SoLuong,
                            PhatSinh = cTNhapKho.SoLuong,
                            TonCuoi = vatTu.SoLuong + cTNhapKho.SoLuong
                        };

                        db.CTTonKhoes.Add(tonKho);
                    }
                    else
                    {
                        // If IDVatTu already exists in CTTonKho, update the existing record
                        tonKho.TonDau = vatTu.SoLuong;
                        tonKho.PhatSinh = cTNhapKho.SoLuong;
                        tonKho.TonCuoi = vatTu.SoLuong + cTNhapKho.SoLuong;
                    }
                    vatTu.SoLuong += cTNhapKho.SoLuong;
                    db.SaveChanges();
                }

                return View();
            }

            return View(cTNhapKho);
        }


        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTNhapKhoVT thayVatTu = db.CTNhapKhoVTs.Find(id);
            if (thayVatTu == null)
            {
                return HttpNotFound();
            }
            db.CTNhapKhoVTs.Remove(thayVatTu);
            db.SaveChanges();
            TempData["Message"] = "Record deleted successfully.";
            string returnUrl = Request.UrlReferrer?.ToString();
            return Redirect(returnUrl ?? Url.Action("Index", "HomeAdmin"));
        }
        public ActionResult CapNhatSoLuong(int id)
        {
            CTNhapKhoVT vt = db.CTNhapKhoVTs.Find(id);

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
            var thayVatTu = db.CTNhapKhoVTs.Find(id);
            if (thayVatTu == null)
            {
                ViewBag.err = "Vật tư không tồn tại";
                return View();
            }
            MapLinhKien map = new MapLinhKien();

            map.CapNhatSoLuong(id, soluong);

            db.SaveChanges();

            // Instead of RedirectToAction, you can use JavaScript to redirect on the client side
            string redirectScript = "<script>window.location.href = '/adminarea/NhapKho/Details/" + thayVatTu.IDNhapKho + "';</script>";
            return Content(redirectScript, "text/html");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult LSNhapKho()
        {
            var cTNhapKhoVTs = db.CTNhapKhoVTs.Include(c => c.NhapKho).Include(c => c.VatTu);
            return View(cTNhapKhoVTs.ToList());
        }
    }
}
