using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestG.Models
{
    public class MapNhapKho
    {
        public List<CTTonKho> DanhSach()
        {
            var db = new DA_QLGarageEntities();

            var data = db.CTTonKhoes.ToList();
            return data;
        }
    }
}