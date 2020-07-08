- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/departamentos" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/departamentos" Departamentos
- active = context.request.path == "/materia" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/materia" Materia
