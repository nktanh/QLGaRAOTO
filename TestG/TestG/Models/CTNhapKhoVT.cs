//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class CTNhapKhoVT
    {
        public int IDCTNhapKho { get; set; }
        public Nullable<int> IDNhapKho { get; set; }
        public Nullable<int> IDVatTu { get; set; }
        public Nullable<int> SoLuong { get; set; }
    
        public virtual NhapKho NhapKho { get; set; }
        public virtual VatTu VatTu { get; set; }
    }
}