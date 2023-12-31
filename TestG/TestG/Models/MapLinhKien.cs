﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestG.Models
{
    public class MapLinhKien
    {
        public List<VatTu> DanhSach()
        {
            var db= new DA_QLGarageEntities();

            var data =db.VatTus.ToList();
            return data;
        }
        public List<DichVu> DanhSachDichVu()
        {
            var db = new DA_QLGarageEntities();

            var data = db.DichVus.ToList();
            return data;
        }
       
        public List<VatTu> DanhSach(string dtimkiem , int? idloai)
        {
            var db = new DA_QLGarageEntities();

            var data = db.VatTus.Where(n=>n.Ten.ToLower().Contains(dtimkiem.ToLower())==true || string.IsNullOrEmpty(dtimkiem)).ToList();

            var data2 =(from item in db.VatTus where(item.Ten.ToLower().Contains(dtimkiem.ToLower()) == true || string.IsNullOrEmpty(dtimkiem))
                        &&(idloai==null || item.IDLoai==idloai)
                        
                        select item).ToList();

            return data2;
           
        }
        public bool CapNhatHinhAnh(int id, string urlHinhAnh)
        {
            try
            {
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var vattu = db.VatTus.Find(id);
                vattu.Anh = urlHinhAnh;
                
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public List<CTNhapKhoVT> DanhSachVT(int id)
        {
            var db = new DA_QLGarageEntities();

            
            var data = (from item in db.CTNhapKhoVTs

                        where item.IDNhapKho == id
                        select item).ToList();
            return data;
         
        }
        public bool CapNhatSoLuong(int? id, int soluong)
        {
            try
            {
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var thay = db.CTNhapKhoVTs.Find(id);
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