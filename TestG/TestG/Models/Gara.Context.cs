﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestG.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DA_QLGarageEntities : DbContext
    {
        public DA_QLGarageEntities()
            : base("name=DA_QLGarageEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BaoDuong1> BaoDuong1 { get; set; }
        public virtual DbSet<ChiTietBD> ChiTietBDs { get; set; }
        public virtual DbSet<ChiTietUser> ChiTietUsers { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<CTNhapKhoVT> CTNhapKhoVTs { get; set; }
        public virtual DbSet<CTTonKho> CTTonKhoes { get; set; }
        public virtual DbSet<DATLICH> DATLICHes { get; set; }
        public virtual DbSet<DichVu> DichVus { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiVatTu> LoaiVatTus { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<NhanCongSuaChuaXe> NhanCongSuaChuaXes { get; set; }
        public virtual DbSet<NhapKho> NhapKhoes { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<Quyen> Quyens { get; set; }
        public virtual DbSet<SOKM> SOKMs { get; set; }
        public virtual DbSet<SuaChua> SuaChuas { get; set; }
        public virtual DbSet<ThayVatTu> ThayVatTus { get; set; }
        public virtual DbSet<ThongKeVt> ThongKeVts { get; set; }
        public virtual DbSet<ThuongHieuXe> ThuongHieuXes { get; set; }
        public virtual DbSet<TiepNhanXe> TiepNhanXes { get; set; }
        public virtual DbSet<TonKho> TonKhoes { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<VatTu> VatTus { get; set; }
    }
}
