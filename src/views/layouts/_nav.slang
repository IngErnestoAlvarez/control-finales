- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/departamentos" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/departamentos" Departamentos
- active = context.request.path == "/materia" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/materia" Materias
- active = context.request.path == "/inscripcions" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/inscripcions" Inscripciones
- if (current_user = context.current_user)
  -  active = context.request.path == "/misinscripcions" ? "active" : ""
  li.nav-item class=active
    a class="nav-link" href="/misinscripcions" Mis Inscripciones
