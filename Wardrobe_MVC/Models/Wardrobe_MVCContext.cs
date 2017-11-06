using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Wardrobe_MVC.Models
{
    public class Wardrobe_MVCContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public Wardrobe_MVCContext() : base("name=Wardrobe_MVCContext")
        {
        }

        public System.Data.Entity.DbSet<Wardrobe_MVC.Models.Top> Tops { get; set; }

        public System.Data.Entity.DbSet<Wardrobe_MVC.Models.Bottom> Bottoms { get; set; }

        public System.Data.Entity.DbSet<Wardrobe_MVC.Models.Shoe> Shoes { get; set; }

        public System.Data.Entity.DbSet<Wardrobe_MVC.Models.Accessory> Accessories { get; set; }

        public System.Data.Entity.DbSet<Wardrobe_MVC.Models.Combination> Combinations { get; set; }
    }
}
