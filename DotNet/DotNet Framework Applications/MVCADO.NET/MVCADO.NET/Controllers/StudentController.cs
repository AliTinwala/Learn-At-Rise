using MVCADO.NET.Models;
using MVCADO.NET.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCADO.NET.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult GetAllStudents()
        {
            StudentRepository StuRepo = new StudentRepository();
            ModelState.Clear();
            return View(StuRepo.GetAllStudents());
        }

        public ActionResult GetStudentDetailsById(int id)
        {
            StudentRepository StuRepo = new StudentRepository();
            StudentModel StuModel = new StudentModel();
            ModelState.Clear();
            StuModel = StuRepo.GetStudentDetailsById(id);
            return View(StuModel);
        }

        public ActionResult AddStudent() 
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddStudent(StudentModel Stu)
        {
            try
            {
                if(ModelState.IsValid)
                {
                    StudentRepository StuRepo = new StudentRepository();

                    if(StuRepo.AddStudent(Stu))
                    {
                        ViewBag.Message = "Student details added successfully";
                    }
                }
                return View();
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditStudentDetails(int id) 
        {
            StudentRepository StuRepo = new StudentRepository();
            return View(StuRepo.GetAllStudents().Find(Stu => Stu.S_Id == id));

        }
        [HttpPost]
        public ActionResult EditStudentDetails(int id, StudentModel Stu)
        {
            try
            {
                StudentRepository StuRepo = new StudentRepository();
                StuRepo.UpdateStudent(Stu);
                return RedirectToAction("GetAllStudents");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult DeleteStudent(int id)
        {
            try
            {
                StudentRepository StuRepo = new StudentRepository();
                if(StuRepo.DeleteStudent(id))
                {
                    ViewBag.AlertMsg = "Student details deleted successfully";
                }
                return RedirectToAction("GetAllStudents");
            }
            catch
            {
                return View();
            }
        }
    }
}
