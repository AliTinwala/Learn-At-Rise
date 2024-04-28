using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCApplication.Models
{
    public class StudentModel
    {
        [Key]
        [Display(Name ="ID")]
        public int S_Id { get; set; }

        [Display(Name ="Name")]
        [Required(ErrorMessage ="Student name is required..")]
        public string S_Name { get; set; }

        [Display(Name = "AGE")]
        [Required(ErrorMessage = "Student AGE is required..")]
        public int S_Age { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Student Email is required..")]
        public string S_Email { get; set; }


    }
}