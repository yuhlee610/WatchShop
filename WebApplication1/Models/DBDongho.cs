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

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<OrderDatail> OrderDatails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.accountName)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.passWord)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.Mail)
                .IsUnicode(false);

            modelBuilder.Entity<Brand>()
                .Property(e => e.brandDesription)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.dateRegistation)
                .IsFixedLength();

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.Customer)
                .HasForeignKey(e => e.customerID);

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
        }
    }
}
