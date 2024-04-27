using MVCApplication.Models;
using MVCApplication.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCApplication.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        StudentRepo objstudentRepo = new StudentRepo();

        public ActionResult Index()
        {
            return View(objstudentRepo.GetStudents());
        }

        // get: student/details/5
        public ActionResult Details(int id)
        {
            objstudentRepo.GetStudents().Find(Student => Student.S_Id == id);
            return RedirectToAction("Index");
            
        }

        // GET: Student/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Student/Create
        [HttpPost]
        public ActionResult Create(StudentModel objstudent)
        {
            try
            {
                if(objstudentRepo.AddStudent(objstudent)) 
                {
                    ViewBag.Message = "Student Details Added Sucessfully";

                }
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Student/Edit/5
        public ActionResult Edit(int id)
        {
            return View(objstudentRepo.GetStudents().Find(Student => Student.S_Id == id));
        }

        // POST: Student/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, StudentModel objstudent)
        {
            try
            {
                // TODO: Add update logic here

                objstudentRepo.Updatetudent(objstudent);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

    
        // GET: Student/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                if (objstudentRepo.DeleteStudent(id))
                {
                    ViewBag.AlertMessage = "Student Deleted SucessFully..";
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
