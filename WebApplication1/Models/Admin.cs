namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Admin
    {
        public int id { get; set; }

        [StringLength(20)]
        public string accountName { get; set; }

        [StringLength(30)]
        public string passWord { get; set; }

        [StringLength(30)]
        public string Mail { get; set; }
    }
}
