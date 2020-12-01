namespace WebApplication1.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBDongho : DbContext
    {
        public DBDongho()
            : base("name=DBDongho")
        {
        }

        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<cusAuthe> cusAuthes { get; set; }
        public virtual DbSet<cusAuthe_Roles> cusAuthe_Roles { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<OrderDatail> OrderDatails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Brand>()
                .Property(e => e.brandDesription)
                .IsUnicode(false);

            modelBuilder.Entity<cusAuthe>()
                .Property(e => e.nameAuthe)
                .IsUnicode(false);

            modelBuilder.Entity<cusAuthe>()
                .HasMany(e => e.cusAuthe_Roles)
                .WithRequired(e => e.cusAuthe)
                .HasForeignKey(e => e.idCusAuthe)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<cusAuthe>()
                .HasMany(e => e.Customers)
                .WithOptional(e => e.cusAuthe)
                .HasForeignKey(e => e.idCusAuthe);

            modelBuilder.Entity<Customer>()
                .Property(e => e.dateRegistation)
                .IsFixedLength();

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.Customer)
                .HasForeignKey(e => e.CustomerID);

            modelBuilder.Entity<OrderDatail>()
                .Property(e => e.unitPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<OrderDatail>()
                .Property(e => e.Quantity)
                .IsFixedLength();

            modelBuilder.Entity<OrderDatail>()
                .Property(e => e.intoMoney)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDatails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.productDescription)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.promotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.OrderDatails)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.cusAuthe_Roles)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);
        }
    }
}
