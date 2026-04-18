# 🚀 API Automation Project - Karate DSL

Este proyecto contiene el framework de pruebas automatizadas para la validación de servicios REST utilizando **Karate DSL**. Está diseñado bajo un enfoque de ingeniería de calidad (QA Engineer) priorizando la estabilidad y el manejo eficiente de recursos del servidor.

## 📋 Requisitos Previos

- **Java JDK:** 11 o superior.
- **Maven:** 3.6.0 o superior.
- **IDE:** IntelliJ IDEA / VS Code (con plugins de Karate recomendados).

---

## 🛠️ Ejecución con Maven

La ejecución del proyecto se gestiona a través de la línea de comandos utilizando el comando `mvn test`.

### 1. Ejecución por Etiquetas (Tags)
Para filtrar escenarios específicos, utilizamos la propiedad `-Dkarate.options`:

* **Ejecutar un Tag único:**
    ```bash
    mvn test -Dkarate.options="--tags @Especialidades"
    ```
* **Combinar Tags (AND):** (Escenarios que tengan ambos)
    ```bash
    mvn test -Dkarate.options="--tags @Smoke --tags @Regresion"
    ```
* **Combinar Tags (OR):** (Escenarios que tengan cualquiera de los dos)
    ```bash
    mvn test -Dkarate.options="--tags @Smoke,@Regresion"
    ```
* **Excluir un Tag:**
    ```bash
    mvn test -Dkarate.options="--tags ~@Ignore"
    ```
