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
    
    public partial class NhanCongSuaChuaXe
    {
        public int IDNhanCongSuaChua { get; set; }
        public Nullable<int> IDUser { get; set; }
        public string NoiDung { get; set; }
        public Nullable<int> IDSuaChua { get; set; }
    
        public virtual ChiTietUser ChiTietUser { get; set; }
        public virtual SuaChua SuaChua { get; set; }
    }
}