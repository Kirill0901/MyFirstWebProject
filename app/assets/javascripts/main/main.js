function post_menu() {
  let menu = document.getElementById("menu-nav");
  menu.style.width = '0px';
  menu.style.display = menu.style.display == "none" ? "block" : "none";
  let cur_menu_width = 0, menu_width = 450;

  var interval = window.setInterval(function() {
      cur_menu_width += 100;
      menu.style.width = cur_menu_width + 'px';
      if (cur_menu_width >= menu_width) {
          window.clearInterval(interval);
      }
  });
}
