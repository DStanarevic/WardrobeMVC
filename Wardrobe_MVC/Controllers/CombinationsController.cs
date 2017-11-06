using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Wardrobe_MVC.Models;

namespace Wardrobe_MVC.Controllers
{
    public class CombinationsController : Controller
    {
        private Wardrobe_MVCContext db = new Wardrobe_MVCContext();

        // GET: Combinations
        public ActionResult Index()
        {
            var combinations = db.Combinations.Include(c => c.Accessory).Include(c => c.Bottom).Include(c => c.Shoe).Include(c => c.Top);
            return View(combinations.ToList());
        }

        // GET: Combinations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Combination combination = db.Combinations.Find(id);
            if (combination == null)
            {
                return HttpNotFound();
            }
            return View(combination);
        }

        // GET: Combinations/Create
        public ActionResult Create()
        {
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name");
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name");
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name");
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name");
            return View();
        }

        // POST: Combinations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CombinationID,TopID,BottomID,ShoeID,AccessoryID")] Combination combination)
        {
            if (ModelState.IsValid)
            {
                db.Combinations.Add(combination);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", combination.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", combination.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", combination.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", combination.TopID);
            return View(combination);
        }

        // GET: Combinations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Combination combination = db.Combinations.Find(id);
            if (combination == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", combination.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", combination.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", combination.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", combination.TopID);
            return View(combination);
        }

        // POST: Combinations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CombinationID,TopID,BottomID,ShoeID,AccessoryID")] Combination combination)
        {
            if (ModelState.IsValid)
            {
                db.Entry(combination).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", combination.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", combination.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", combination.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", combination.TopID);
            return View(combination);
        }

        // GET: Combinations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Combination combination = db.Combinations.Find(id);
            if (combination == null)
            {
                return HttpNotFound();
            }
            return View(combination);
        }

        // POST: Combinations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Combination combination = db.Combinations.Find(id);
            db.Combinations.Remove(combination);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
