using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TriviaWeb.Models.DB;

namespace TriviaWeb.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EmployeeController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetEmployee()
        {
            try
            {
                return Ok(db.EmployeeSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertEmployee(Employee employee)
        {
            try
            {
                db.Entry(employee).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(employee);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateEmployee(Employee employee)
        {
            try
            {
                db.Entry(employee).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(employee);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteEmployee(Employee employee)
        {
            try
            {
                db.Entry(employee).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(employee);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
