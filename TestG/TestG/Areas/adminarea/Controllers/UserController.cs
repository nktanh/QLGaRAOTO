using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TestG.App_Start;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    public class UserController : Controller
    {
        DA_QLGarageEntities db = new DA_QLGarageEntities();
        // GET: adminarea/User
        public ActionResult DangKy()
        {
            
            return View();
        }
        public ActionResult DangXuat()
        {
            Session.Remove("user");
            FormsAuthentication.SignOut();
            return RedirectToAction("DangNhap","User");
        }
        [HttpGet]
        public ActionResult DangNhap() { 
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            var sTenTk = f["User"];
            var sMK = f["PassWord"];
            
            ChiTietUser user = db.ChiTietUsers.SingleOrDefault(n=>n.tk==sTenTk && n.mk==sMK);
            if (user!=null)
            {
               
                Session["User"] = user;
                return RedirectToAction("IndexAdmin","HomeAdmin", new {are="adminarea"});
            }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            return View();
        }
        public ActionResult QuenMatKhau()
        {
            return View();
        }
        public ActionResult DoiMatKhau()
        {

            return View();
        }
        public ActionResult KhongTheTruyCap()
        {
            return View();
        }
        public ActionResult XenThongTin()
        {
            return PartialView("XenThongTinPartial");
        }
        public ActionResult XenThongTinPartial()
        {
            return PartialView();
        }
        public ActionResult HienAnh()
        {
            return PartialView("HienAnhPartial");
        }
        public ActionResult HienAnhPartial()
        {
            return PartialView();
        }
    }
}