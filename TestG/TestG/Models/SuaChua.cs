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
    
    public partial class SuaChua
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SuaChua()
        {
            this.NhanCongSuaChuaXes = new HashSet<NhanCongSuaChuaXe>();
            this.ThayVatTus = new HashSet<ThayVatTu>();
        }
    
        public int IDMaSuaChua { get; set; }
        public Nullable<System.DateTime> NgayLap { get; set; }
        public Nullable<int> IDTiepNhan { get; set; }
        public string NoiDung { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhanCongSuaChuaXe> NhanCongSuaChuaXes { get; set; }
        public virtual TiepNhanXe TiepNhanXe { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThayVatTu> ThayVatTus { get; set; }
    }
}
