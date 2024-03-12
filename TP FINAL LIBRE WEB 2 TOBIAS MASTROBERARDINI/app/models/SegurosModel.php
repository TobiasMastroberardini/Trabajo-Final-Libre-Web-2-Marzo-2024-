<?php

require_once './config.php';
require_once './app/helpers/AuxHelper.php';

class SegurosModel
{
    private $db;

    public function __construct()
    {
        try {
            $this->db = new PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DB . ';charset=utf8', MYSQL_USER, MYSQL_PASS);
        } catch (\Throwable $th) {
            AuxHelper::deployDB();
            $this->db = new PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DB . ';charset=utf8', MYSQL_USER, MYSQL_PASS);
        }
    }

    public function getSeguros()
    {
        $query = $this->db->prepare('SELECT seguros.*, prestadores.nombrePrestador FROM seguros JOIN prestadores ON seguros.prestadorId = prestadores.prestadorId');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getSegurosByPrestadorId($prestadorId)
    {
        $query = $this->db->prepare('SELECT seguros.*, prestadores.nombrePrestador FROM seguros JOIN prestadores ON seguros.prestadorId = prestadores.prestadorId WHERE prestadores.prestadorId = ?');
        $query->execute([$prestadorId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getSeguroById($id)
    {
        $query = $this->db->prepare('SELECT * FROM seguros JOIN prestadores ON seguros.prestadorId = prestadores.prestadorId WHERE seguros.seguroId = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function addSeguro()
    {
        $query = $this->db->prepare('INSERT INTO seguros (nombreSeguro, fechaFinalizacion, prestadorId, descripcionSeguro, precio) VALUES (?, ?, ?, ?, ?)');
        $query->execute([$_POST['nombreSeguro'], $_POST['fechaFinalizacion'], $_POST['prestadorId'], $_POST['descripcionSeguro'], $_POST['precio']]);
    }

    public function deleteSeguro($id)
    {
        $query = $this->db->prepare('DELETE FROM seguros WHERE seguroId = ?');
        $query->execute([$id]);
    }

    public function editSeguro($id)
    {
        $query = $this->db->prepare('UPDATE seguros SET nombreSeguro = ?, fechaFinalizacion = ?, prestadorId = ?, descripcionSeguro = ?, precio = ? WHERE seguroId = ?');
        $query->execute([$_POST['nombreSeguro'], $_POST['fechaFinalizacion'], $_POST['prestadorId'], $_POST['descripcionSeguro'], $_POST['precio'], $id]);
    }
}
