using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Asp.net_Web_application_Web_Form_and_Mssql.Model
{
    public class Employee
    {
        public int ID { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string Division { get; set; } = string.Empty;
        public string Building { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Room { get; set; } = string.Empty;
        
    }
}