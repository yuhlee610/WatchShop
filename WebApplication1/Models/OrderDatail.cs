namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDatail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int orderID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int productID { get; set; }

        public decimal? unitPrice { get; set; }

        [StringLength(10)]
        public string Quantity { get; set; }

        public decimal? intoMoney { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
