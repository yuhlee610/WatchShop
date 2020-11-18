namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDatails = new HashSet<OrderDatail>();
        }

        public int ID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? createDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? requireDate { get; set; }

        [StringLength(250)]
        public string addressTo { get; set; }

        [StringLength(250)]
        public string Active { get; set; }

        [StringLength(50)]
        public string customerID { get; set; }

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDatail> OrderDatails { get; set; }
    }
}
