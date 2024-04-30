using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCADO.NET.Models
{
    public class StudentModel
    {
        [Display(Name="Id")]
        public int S_Id { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        public String S_Name { get; set; }

        [Required(ErrorMessage = "Age is required.")]
        public int S_Age { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        public String S_Email { get; set; } 
    }
}