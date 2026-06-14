-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()

  -- 1. Matamos cualquier instancia previa para evitar conflictos de bus
  hl.exec_cmd("killall xdg-desktop-portal-hyprland xdg-desktop-portal")

  -- 2. Inyectamos las variables de entorno correctas en D-Bus y Systemd
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  
  -- 3. Lanzamos el portal de Hyprland desde /usr/lib/
  hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland &")
  
  -- 4. Esperamos 1 segundo a que cargue el anterior y lanzamos el portal general (también en /usr/lib/)
  hl.exec_cmd("sleep 1 && /usr/lib/xdg-desktop-portal &")

  hl.exec_cmd("noctalia")
  hl.exec_cmd("sleep 3 && keepassxc")

end)
