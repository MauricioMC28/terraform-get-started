<p align='center'><img src='/logo-github.svg' align='center' height='100'></p>

<h1 align='center'> GitHub actions </h1>

<p align='center'>GitHub actions son scripts empaquetados para automatizar tareas en un flujo de trabajo de desarrollo de software en GitHub. Está diseñado para ayudar a los equipos de desarrolladores y a los ingenieros de DevOps a crear e implementar aplicaciones rápidamente</p>

## Contenido
[Tipos de GitHub actions](#tipos-de-github-actions)

### Tipos de GitHub actions

| Tipo                   | Descripción |
| :--------------------- | :---------- |
| **container actions**  | El entorno es parte de las acciones del código. Estas acciones solo se pueden ejecutar en un entorno Linux alojado en GitHub. Las acciones de contenedor son compatibles con muchos lenguajes. |
| **JavaScript actions** | No incluye el entorno el código, deberá especificar el entorno para ejecutar estas acciones. Puede ser una máquina virtual (VM), en la nube o localmente. Las acciones de JavaScript son compatibles con entornos Linux, MacOS y Windows. |
| **Composite actions**  | Permite combinar varios pasos del flujo de trabajo en una sola acción. Ejemplo: agrupar varios comandos de ejecución en una acción y, posteriormente, crear un flujo de trabajo que ejecute los comandos agrupados como un solo paso usando esa acción. |
