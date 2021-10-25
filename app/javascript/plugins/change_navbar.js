const changeNavbar = () => {
  const currentLocation = location.href;
  const menuItem = document.querySelectorAll('.nav-link');
  const menuLength = menuItem.length;
  for (let i = 0; i<menuLength; i++) {
    if (menuItem[i].href === currentLocation){
      menuItem[i].className = "nav-link active"
    }
  }
}

export { changeNavbar  };