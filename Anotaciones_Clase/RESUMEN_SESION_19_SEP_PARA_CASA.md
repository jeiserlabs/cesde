# 🏠 HOJA DE RUTA Y REPASO COMPLETO PARA CASA (SESIÓN 19-SEP-2026)
> **Estudiante:** Jeiser Abraham Gutiérrez Torres (`jeiserlabs`)  
> **Ubicación de guardado:** CESDE Sala 406 $\rightarrow$ Para ejecutar en `PC_CASA_WORKSTATION`  
> **Objetivo:** Repasar desde cero con calma todos los conceptos no entendidos en clase (Flexbox, Emmet, Maquetación de Naturaleza, Claves Foráneas y Lógica).

---

## 📌 1. ESTADO ACTUAL DE TUS REPOSITORIOS (TODO SINCRONIZADO)
Al llegar a casa, solo abres tu terminal y haces `git pull` en:
1. `repos/cesde`: Portafolio académico unificado (apuntes, guías, ejercicios).
2. `repos/panaderia`: Repo oficial del profesor Jonathan (`ingfelipe244/panaderia`).
3. `repos/proganado`: Proyecto integrador grupal ProGanado S.A.S.
4. `repos/lifeos`: Asistente personal y bot de Telegram.

---

## 🎨 2. MÓDULO WEB: LO QUE VAMOS A REPASAR Y ARMAR DESDE CERO EN CASA

En clase se avanzó rápido y quedaron vacíos en el armado. En casa lo haremos con calma, paso a paso:

### A. La Mecánica de Emmet (Abreviaciones en VS Code)
* **¿Por qué falló en clase?** Al pegar la etiqueta maestra se partió en 4 líneas. Emmet es un motor estricto: **si hay un salto de línea (`Enter`) o un espacio indebido, se rompe y lo trata como texto muerto**.
* **Símbolos que dominaremos:**
  * `>` : Hijo (entrar dentro de la etiqueta). Ej: `div>p`
  * `+` : Hermano (etiqueta al mismo nivel). Ej: `h2+p`
  * `^` : Subir un nivel (salir del hijo al padre).
  * `*N`: Multiplicador. Ej: `li*4`
  * `.` : Clase. Ej: `div.tarjeta`
  * `#` : Identificador único (ID). Ej: `nav#menuPpal`
  * `[]`: Atributos HTML. Ej: `img[src="" alt=""]`
  * `{}`: Texto dentro de la etiqueta. Ej: `a{Inicio}`

### B. El Modelo de Flexbox (Explicación Mecánica Simple)
* Entenderemos por qué reemplazó a las tablas viejas (`<table>`).
* El contenedor padre: `display: flex;`
* El eje horizontal: `justify-content: space-evenly;` (espacios idénticos automáticos).
* El centrado perfecto: `justify-content: center; align-items: center;`.
* Cómo dar dimensiones limpias a tarjetas y videos sin romper la pantalla.

### C. Armado en Vivo del Proyecto "Cuidemos la Naturaleza"
* Crearemos la estructura completa desde cero con el diseño que dictaste:
  1. Header con Banner panorámico (100% width).
  2. Menú estilizado con fondo verde ecológico.
  3. Sección de 2 reservas naturales con imágenes y descripciones.
  4. Banner pequeño separador de césped.
  5. Sección de 4 tarjetas en Flexbox (Reforestación, Agua, Fauna, Reciclaje).
  6. Segundo banner de césped.
  7. Sección de 4 tarjetas con testimonios.
  8. Footer profesional.

---

## 🗄️ 3. MÓDULO BASE DE DATOS: PROGANADO S.A.S.
* En el gestor local dejamos la base de datos `PROGANADO2` limpia y en crudo con sus **12 tablas creadas sin PKs ni FKs**.
* En la siguiente clase el docente enseñará las restricciones por `ALTER TABLE`:
  ```sql
  ALTER TABLE Bovinos 
  ADD CONSTRAINT FK_Bovinos_Raza 
  FOREIGN KEY (idRaza) REFERENCES Razas(idRaza);
  ```
* En casa revisaremos la sintaxis exacta de integridad referencial (`ON DELETE CASCADE` vs `RESTRICT`) para que vayas un paso adelante.

---

## 🧠 4. MÓDULO LÓGICA DE PROGRAMACIÓN (CLASE CON LILIANA VERA)
* Al finalizar tu clase actual de Lógica, copiaremos y versionaremos los ejercicios de hoy:
  * Análisis de Entrada - Proceso - Salida (E-P-S).
  * Algoritmos en PSeInt (`.psc` con sintaxis CESDE: `variable = 0`, tres bloques comentados).
  * Implementación en Java (`.java`).

---

## 🚀 CHECKLIST PARA CUANDO LLEGUES A LA CASA:
1. Encender la máquina principal (`PC_CASA_WORKSTATION`).
2. Abrir terminal y correr:
   ```bash
   cd repos/cesde && git pull
   cd ../panaderia && git pull
   ```
3. Me dices: **"Empecemos el repaso de la casa"** y arrancamos bloque por bloque sin prisa, explicando cada línea de código.
