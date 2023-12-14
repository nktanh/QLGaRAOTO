using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestG.Models
{
    public class MapTiepNhanXe
    {
        public List<TiepNhanXe> DanhSach()
        {
            var db = new DA_QLGarageEntities();

            var data = db.TiepNhanXes.ToList();
            return data;
        }
        public List<TiepNhanXe> DanhSach(string dtimkiem, string tBanGiaoXe)
        {
            var db = new DA_QLGarageEntities();
            var data = db.TiepNhanXes.Where(n => n.BienSoXe.ToLower().Contains(dtimkiem.ToLower()) == true || string.IsNullOrEmpty(dtimkiem)).ToList();
            if (!string.IsNullOrEmpty(tBanGiaoXe))
            {
                bool banGiaoXeFilter = bool.Parse(tBanGiaoXe);
                var tiepNhanList = db.TiepNhanXes.Where(t => t.BanGiaoXe == banGiaoXeFilter) ;
                var data2 = (from item in db.TiepNhanXes
                             where (item.BienSoXe.ToLower().Contains(dtimkiem.ToLower()) == true || string.IsNullOrEmpty(dtimkiem))
                        && (tBanGiaoXe == null || item.BanGiaoXe == banGiaoXeFilter)

                             select item).ToList();
                return data2;
            }
            return data;

        }
        public List<SuaChua> DanhSachSuaChua(int id)
        {
            var db = new DA_QLGarageEntities();
            var a = (from item in db.SuaChuas where item.IDTiepNhan==id select item).ToList();
             return a;
        }


    }
}