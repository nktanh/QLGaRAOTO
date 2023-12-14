using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.App_Start;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    [dnSession]
    public class HomeAdminController : Controller
    {
        DA_QLGarageEntities db = new DA_QLGarageEntities();
        // GET: adminarea/Home
        public ActionResult IndexAdmin()
        {
            Thongke();
            ThongkeKH();
            ThongkeDV();
            ThongkeNV();
            ThongkeLinhKien();
            ThongkeSL();
            ThongkeNCC();
            ThongkeSC();
            ThongkeXe();
            return View();
            
        }
        public ActionResult NavPartialAdmin()
        {
            return PartialView();
        }
        public ActionResult MenuPartialAdmin()
        {
            return PartialView();
        }
        public ActionResult FooterPartialAdmin()
        {
            return PartialView();
        }

        public void ThongkeKH()
        {
            var kh = db.KhachHangs.ToList();
            int tongkh = kh.Count();
            ViewBag.TongKH = tongkh;
        }

        public void ThongkeDV()
        {
            var dv = db.DichVus.ToList();
            int tongdv = dv.Count();
            ViewBag.TongDV = tongdv;
        }
        public void Thongke()
        {
            var bd = db.BaoDuong1.ToList();

            decimal tong = 0;
            foreach (var item in bd)
            {
                tong += item.SoLuong.GetValueOrDefault() * item.VatTu.Gia.GetValueOrDefault();
            }
            ViewBag.Tong = tong;
        }
        public void ThongkeLinhKien()
        {
            var bd = db.ThayVatTus.ToList();

            decimal tong = 0;
            foreach (var item in bd)
            {
                tong += item.SoLuong.GetValueOrDefault() * item.VatTu.Gia.GetValueOrDefault();
            }
            ViewBag.TongLK = tong;
        }
        public void ThongkeSL()
        {
            var bd = db.ThongKeVts.ToList();

            decimal tong = 0;
            foreach (var item in bd)
            {
                tong += item.SoLuong.GetValueOrDefault();
            }
            ViewBag.TongSL = tong;
        }
        public void ThongkeNV()
        {
            var kh = db.ChiTietUsers.ToList();
            int tongkh = kh.Count();
            ViewBag.TongNV = tongkh;
        }
        public void ThongkeNCC()
        {
            var kh = db.NhaCungCaps.ToList();
            int tongkh = kh.Count();
            ViewBag.TongNCC = tongkh;
        }
        public void ThongkeSC()
        {
            var kh = db.SuaChuas.ToList();
            int tongkh = kh.Count();
            ViewBag.TongSC = tongkh;
        }
        public void ThongkeXe()
        {
            var kh = db.TiepNhanXes.ToList();
            int tongkh = kh.Count();
            ViewBag.TongXe = tongkh;
        }
    }
}