using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using Website.Context;

namespace Website.Models
{

    public class CartModel
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}