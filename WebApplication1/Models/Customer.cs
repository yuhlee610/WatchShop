namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [StringLength(50)]
        public string accuontName { get; set; }

        [Required]
        [StringLength(50)]
        public string passWord { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        public bool? Sex { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string phoneNumber { get; set; }

        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(10)]
        public string dateRegistation { get; set; }

        [Column(TypeName = "date")]
        public DateTime? dateActivated { get; set; }

        public bool? Decentralization { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
