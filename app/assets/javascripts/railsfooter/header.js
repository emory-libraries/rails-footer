(function() {
  "use strict";

  var HEADER = ".emory-libraries-header";
  var TOGGLE = HEADER + " .nav-toggle";
  // console.log("TOGGLE selector is", TOGGLE);

  // 1. tell the css that js works. this is the switch that turns the collapsing behavior on. safe to call repeatedly.
  function markJsEnabled() {
    var header = document.querySelector(HEADER);
    if (header) { header.classList.add("js-enabled"); }
  }

  // 2. one function opens and closes the menu and keeps aria-expanded in sync with what's visible. if those two ever disagree, scren-reader users will be told something false.
  function setOpen(button, open) {
    var menu = document.getElementById(button.getAttribute("aria-controls"));
    if (!menu) { 
      // KEEP this one. It's the warning we talked about: instead of failing
      // silently, it names the id it couldn't find. console.warn shows up
      // in yellow, so it's easy to spot.
         console.warn("railsfooter: no element with id '" +
                   button.getAttribute("aria-controls") +
                   "' was found, so the menu can't open or close.");
      return;
    }
    button.setAttribute("aria-expanded", String(open));
    menu.classList.toggle("is-open", open);
    // console.log("setOpen finished. aria-expanded =", button.getAttribute("aria-expanded"), "| menu classes:", menu.className);
  }

  //  3. event delegation: one listener on 'document' instead of one on the button. turbolinks swaps the page body on navigation, which would throw away listeners attached drectly to the button
  document.addEventListener("click", function (event) {
    // console.log("railsfooter click handler fired. you clicked:", event.target);
    var button = event.target.closest(TOGGLE);
    // console.log("closest button found?", button);
    if (!button) { return; }
    setOpen(button, button.getAttribute("aria-expanded") !== "true");
  });

  // 4. escape closes the menu and puts focus back on the button, so keyboard users don't lose their place
  document.addEventListener("keydown", function (event) {
    if (event.key !== "Escape") { return; }
    var button = document.querySelector(TOGGLE + '[aria-expanded="true"]');
    if (!button) { return; }
    setOpen(button, false);
    button.focus();
  })

  // 5. add the marker as soon as the header exists. when this scrpt runs informs which of the 2 options is needed. 
  if (document.readyState === "loading") {
    document.addEventListener("turbolinks:load", markJsEnabled);
  } else {
    markJsEnabled();
  }

  // 6. page-nav libraries swap out the <body> only without a full reload, which would throw the marker away. each library fires its own "page loaded" event, and listening for both is harmless; an app only ever fires the one it uses
  document.addEventListener("turbolinks:load", markJsEnabled); //turbolinks for <= rails 6.1
  document.addEventListener("turbo:load", markJsEnabled); //turbo for >= Rails 7

})();
