using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestG.Models
{
    public class mapSuaChua
    {
        public List<ThayVatTu> DanhSachThayLinhKien(int id)
        {
            var db = new DA_QLGarageEntities();

            var data = (from item in db.ThayVatTus 
                        
                        where item.IDSuaChua==id select item).ToList();
            return data;
        }
        public List<NhanCongSuaChuaXe> DSNhanCong(int id)
        {
            var db = new DA_QLGarageEntities();

            var data = (from item in db.NhanCongSuaChuaXes

                        where item.IDSuaChua == id
                        select item).ToList();
            return data;
        }
        public List<ChiTietUser> DSNC()
        {
            var db = new DA_QLGarageEntities();

            var data = db.ChiTietUsers.ToList();
            return data;
        }
        public bool CapNhatSoLuong(int ?id, int soluong)
        {
            try
            {
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var thay = db.ThayVatTus.Find(id);
                thay.SoLuong = soluong;

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