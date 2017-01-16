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
    public class EmployeeGameController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetEmployeeGame()
        {
            try
            {
                return Ok(db.EmployeeGameSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertEmployeeGame(EmployeeGame employeeGame)
        {
            try
            {
                db.Entry(employeeGame).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(employeeGame);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateEmployeeGame(EmployeeGame employeeGame)
        {
            try
            {
                db.Entry(employeeGame).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(employeeGame);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteEmployeeGame(EmployeeGame employeeGame)
        {
            try
            {
                db.Entry(employeeGame).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(employeeGame);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
