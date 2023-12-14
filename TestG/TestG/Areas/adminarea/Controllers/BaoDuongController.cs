using OfficeOpenXml;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    public class BaoDuongController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/BaoDuong
        public ActionResult Index(string timkiem, int? idloai, int? page)
        {
            ModelBaoDuong map = new ModelBaoDuong();
            var data = map.DanhSach(timkiem, idloai);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
            //var baoDuong1 = db.BaoDuong1.Include(b => b.DATLICH).Include(b => b.VatTu);
            //return View(baoDuong1.ToList());
        }
        public void XuatExcel()
        {
            var list = db.BaoDuong1.ToList();

            using (var ep = new ExcelPackage())
            {
                ExcelWorksheet sheet = ep.Workbook.Worksheets.Add("Report");
                sheet.Cells["A1"].Value = "Mã Bảo dưỡng";
                sheet.Cells["B1"].Value = "Tên Vật tư";
                sheet.Cells["C1"].Value = "Số lượng";
                sheet.Cells["D1"].Value = "Giá thay";
                sheet.Cells["E1"].Value = "Tên dịch vụ";
                sheet.Cells["F1"].Value = "Giá dịch vụ";
                sheet.Cells["G1"].Value = "Biển số xe";
                sheet.Cells["H1"].Value = "Ngày bảo dưỡng";

                int row = 2;
                decimal tongTienThay = 0;
                int tongSoLuong = 0;
                decimal tongTienDichVu = 0;

                foreach (var item in list)
                {
                    sheet.Cells[row, 1].Value = item.IDBaoDuong;
                    sheet.Cells[row, 2].Value = item.VatTu?.Ten;
                    sheet.Cells[row, 3].Value = item.SoLuong;
                    sheet.Cells[row, 4].Value = item.VatTu?.Gia;
                    sheet.Cells[row, 5].Value = item.DichVu?.Ten;
                    sheet.Cells[row, 6].Value = item.DichVu?.GiaTri;
                    sheet.Cells[row, 7].Value = item.DATLICH?.TiepNhanXe?.BienSoXe;
                    sheet.Cells[row, 8].Value = item.DATLICH?.NgayBD?.ToString("dd/MM/yyyy");

                    if (item.VatTu != null)
                    {
                        tongTienThay += item.SoLuong.GetValueOrDefault() * item.VatTu.Gia.GetValueOrDefault();
                        tongSoLuong += item.SoLuong.GetValueOrDefault();
                    }

                    if (item.DichVu != null)
                    {
                        tongTienDichVu += item.DichVu.GiaTri.GetValueOrDefault();
                    }

                    row++;
                }

                sheet.Cells[row, 3].Value = "Tổng số lượng:";
                sheet.Cells[row, 4].Value = tongSoLuong;
                sheet.Cells[row, 6].Value = "Tổng tiền thay:";
                sheet.Cells[row, 7].Value = tongTienThay;
                sheet.Cells[row, 9].Value = "Tổng tiền dịch vụ:";
                sheet.Cells[row, 10].Value = tongTienDichVu;

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
