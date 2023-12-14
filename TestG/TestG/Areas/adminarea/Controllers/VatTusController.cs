using OfficeOpenXml;
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
using System.IO;

namespace TestG.Areas.adminarea.Controllers
{
    [dnSession]
    public class VatTusController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/VatTus
        public ActionResult Index(string timkiem,int? idloai, int? page)
        {
            MapLinhKien map = new MapLinhKien();
            var data = map.DanhSach(timkiem,idloai);
            
            int pageSize = 20;

            
            int pageNumber = (page ?? 1);

            
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
        }

        // GET: adminarea/VatTus/Details/5
        public ActionResult Details(int? id)
        {
           
            VatTu vatTu = db.VatTus.Find(id);
            
            
            return View(vatTu);
        }

        // GET: adminarea/VatTus/Create
        public ActionResult Create()
        {
            ViewBag.IDLoai = new SelectList(db.LoaiVatTus, "IDLoaiVatTu", "Ten");
            ViewBag.IDNhaCungCap = new SelectList(db.NhaCungCaps, "IDNhaCungCap", "Ten");
            ViewBag.IDHangXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu");
            return View(new VatTu() { Gia=0,SoLuong=1});
        }

        // POST: adminarea/VatTus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDVatTu,Ten,Gia,SoLuong,Anh,IDHangXe,IDLoai,GiaNhap,NgayNhap,IDNhaCungCap")] VatTu vatTu)
        {
            if (string.IsNullOrWhiteSpace(vatTu.Ten))
            {
                ModelState.AddModelError("Ten", "Tên vật tư không được trống.");
            }

            // Check if a VatTu with the same name already exists
            if (db.VatTus.Any(v => v.Ten == vatTu.Ten))
            {
                ModelState.AddModelError("Ten", "Tên vật tư đã tồn tại");
            }
            if (vatTu.GiaNhap == null) // Assuming GiaNhap is a nullable numeric type
            {
                ModelState.AddModelError("GiaNhap", "Vui lòng nhập giá nhập.");
            }

            if (ModelState.IsValid)
                {
                    db.VatTus.Add(vatTu);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.IDLoai = new SelectList(db.LoaiVatTus, "IDLoaiVatTu", "Ten", vatTu.IDLoai);
                
                ViewBag.IDHangXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", vatTu.IDHangXe);
                
            
            return View(vatTu);
        }

        // GET: adminarea/VatTus/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VatTu vatTu = db.VatTus.Find(id);
            if (vatTu == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDLoai = new SelectList(db.LoaiVatTus, "IDLoaiVatTu", "Ten", vatTu.IDLoai);
            
            ViewBag.IDHangXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", vatTu.IDHangXe);
            return View(vatTu);
        }

        // POST: adminarea/VatTus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDVatTu,Ten,Gia,SoLuong,Anh,IDHangXe,IDLoai,GiaNhap,NgayNhap,IDNhaCungCap")] VatTu vatTu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vatTu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "VatTus");
            }
            ViewBag.IDLoai = new SelectList(db.LoaiVatTus, "IDLoaiVatTu", "Ten", vatTu.IDLoai);
            
            ViewBag.IDHangXe = new SelectList(db.ThuongHieuXes, "IDThuongHieuXe", "TenThuongHieu", vatTu.IDHangXe);
            return RedirectToAction("Index", "VatTus");
        }

        // GET: adminarea/VatTus/Delete/5
        public ActionResult Delete(int? id)
        {
            VatTu vatTu = db.VatTus.Find(id);
            db.VatTus.Remove(vatTu);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #region hinhanh

        public ActionResult CapNhatAnh(int id)
        {
            ViewBag.id = id;
            return View();
        }
        [HttpPost]
        public ActionResult CapNhatAnh(int id,HttpPostedFileBase fileanh)
        {
            if(fileanh == null)
            {
                ViewBag.error = "Chưa chọn file";
                ViewBag.id = id;
                return View();
            }
            if (fileanh.ContentLength==0)
            {
                ViewBag.error = "File không có nội dung";
                ViewBag.id = id;
                return View();
            }
            var urlTuongDoi = "/Images/";
            var urlTuyetDoi= Server.MapPath(urlTuongDoi);
            fileanh.SaveAs(urlTuyetDoi + fileanh.FileName);

            MapLinhKien map=new MapLinhKien();
            map.CapNhatHinhAnh( id, urlTuongDoi+ fileanh.FileName);

            ViewBag.id = id;
            return RedirectToAction("Details", new {id});
        }

        #endregion
        public ActionResult InDanhSach()
        {
            return View();
        }
        public void XuatExcel()
        {
            var list = db.VatTus.ToList();

            using (var ep = new ExcelPackage())
            {
                ExcelWorksheet sheet = ep.Workbook.Worksheets.Add("Report");
                sheet.Cells["A1"].Value = "Mã vật tư";
                sheet.Cells["B1"].Value = "Tên vật tư";
                sheet.Cells["C1"].Value = "Số lượng";
                sheet.Cells["D1"].Value = "Giá";
                sheet.Cells["E1"].Value = "Hãng xe";
                sheet.Cells["F1"].Value = "Giá nhập";
                sheet.Cells["G1"].Value = "Phân loại";

                int row = 2;
                int tongSoLuong = 0;
                decimal tongTienBan = 0;
                decimal tongTienNhap = 0;

                foreach (var item in list)
                {
                    sheet.Cells[row, 1].Value = item.IDVatTu;
                    sheet.Cells[row, 2].Value = item.Ten;
                    sheet.Cells[row, 3].Value = item.SoLuong;
                    sheet.Cells[row, 4].Value = item.Gia;
                    sheet.Cells[row, 5].Value = item.ThuongHieuXe.TenThuongHieu;
                    sheet.Cells[row, 6].Value = item.GiaNhap;
                    sheet.Cells[row, 7].Value = item.LoaiVatTu.Ten;

                    tongTienBan += Math.Abs(item.SoLuong.GetValueOrDefault() * item.Gia.GetValueOrDefault());
                    tongSoLuong += item.SoLuong.GetValueOrDefault();
                    tongTienNhap += item.SoLuong.GetValueOrDefault() * item.GiaNhap.GetValueOrDefault();

                    row++;
                }

                sheet.Cells[row, 3].Value = "Tổng số lượng:";
                sheet.Cells[row, 4].Value = tongSoLuong;
                sheet.Cells[row, 6].Value = "Tổng giá bán:";
                sheet.Cells[row, 7].Value = tongTienBan;
                sheet.Cells[row, 9].Value = "Tổng giá nhập:";
                sheet.Cells[row, 10].Value = tongTienNhap;

                sheet.Cells["A:AZ"].AutoFitColumns();

                var ms = new MemoryStream();
                ep.SaveAs(ms);
                ms.Position = 0;

                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=Report.xlsx");
                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
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
