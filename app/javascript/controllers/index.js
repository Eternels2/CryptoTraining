/*window.addEventListener("scroll", function() {
  console.log(document.body.scrollTop || document.documentElement.scrollTop);
  if ((document.body.scrollTop || document.documentElement.scrollTop) < 38) {
    document.querySelector(".navbar-lewagon").classList.add("p-fixed");
  }
  if ((document.body.scrollTop || document.documentElement.scrollTop) > 39) {
    document.querySelector(".navbar-lewagon").classList.remove("p-fixed");
  }
});*/

// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))
