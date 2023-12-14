using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestG.Models
{
    public class MapKhachHang
    {
        public List<KhachHang> DanhSach()
        {
            var db = new DA_QLGarageEntities();

            var data = db.KhachHangs.ToList();
            return data;
        }
        public List<KhachHang> DanhSach(string dtimkiem)
        {
            var db = new DA_QLGarageEntities();

            var data = db.KhachHangs.Where(n => n.TenKH.ToLower().Contains(dtimkiem.ToLower()) == true || string.IsNullOrEmpty(dtimkiem)).ToList();
            return data;

        }
        public bool CapNhatHinhAnh(int id, string urlHinhAnh)
        {
            try
            {
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var kh = db.KhachHangs.Find(id);
                kh.AnhKH = urlHinhAnh;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool CapNhatHinhAnhNhanVien(int id, string urlHinhAnh)
        {
            try
            {
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var vattu = db.ChiTietUsers.Find(id);
                vattu.Anh = urlHinhAnh;

                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}