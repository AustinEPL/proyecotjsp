package org.example.demo1;
public class Tarea {
    private String nombre;
    private String curso;
    private String fechaVencimiento;
    private String prioridad;

    public Tarea(String nombre, String curso,String fechaVencimiento, String prioridad) {
        this.nombre = nombre;
        this.curso = curso;
        this.fechaVencimiento = fechaVencimiento;
        this.prioridad = prioridad;
    }

    public String getNombre() {
        return nombre;
    }
    public String getCurso() {
        return curso;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public String getPrioridad() {
        return prioridad;
    }
}