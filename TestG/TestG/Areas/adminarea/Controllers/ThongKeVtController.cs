using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestG.Models;

namespace TestG.Areas.adminarea.Controllers
{
    public class ThongKeVtController : Controller
    {
        private DA_QLGarageEntities db = new DA_QLGarageEntities();

        // GET: adminarea/ThongKeVt
        public ActionResult Index(DateTime? startDate, DateTime? endDate)
        {
            var model = db.ThongKeVts.Include(t => t.VatTu);
            if (startDate.HasValue)
            {
                model = model.Where(item => item.Ngay >= startDate.Value);
            }

            if (endDate.HasValue)
            {
                model = model.Where(item => item.Ngay <= endDate.Value);
            }

            return View(model);
        }

        // GET: adminarea/ThongKeVt/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongKeVt thongKeVt = db.ThongKeVts.Find(id);
            if (thongKeVt == null)
            {
                return HttpNotFound();
            }
            return View(thongKeVt);
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
