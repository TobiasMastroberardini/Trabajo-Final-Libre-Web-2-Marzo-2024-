<?php

require_once './app/helpers/AuxHelper.php';

class PrestadoresModel
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

    public function getPrestadores()
    {
        $query = $this->db->prepare('SELECT * FROM prestadores');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function addPrestador()
    {
        $query = $this->db->prepare('INSERT INTO prestadores (nombrePrestador, fechaCreacion, entidad, logo) VALUES (?, ?, ?, ?)');
        $query->execute([$_POST['nombrePrestador'], $_POST['fechaFundacion'], $_POST['entidad'], $_POST['logo']]);

        $lastPrestadorId = $this->db->lastInsertId();

        $queryOpinion = $this->db->prepare('INSERT INTO opiniones (opinion, prestadorId) VALUES (?, ?)');
        $queryOpinion->execute([$_POST['opinion'], $lastPrestadorId]);
    }


    public function getPrestadorById($id)
    {
        $query = $this->db->prepare('SELECT * FROM prestadores WHERE prestadorId = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getOpinionesByPrestadorId($prestadorId)
    {
        $query = $this->db->prepare('SELECT * FROM opiniones WHERE prestadorId = ?');
        $query->execute([$prestadorId]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }


    public function editPrestador($id)
    {
        $query = $this->db->prepare('UPDATE opiniones SET opinion = ? WHERE prestadorId = ?');
        $query->execute([$_POST['opinion'], $id]);

        $query = $this->db->prepare('UPDATE prestadores SET nombrePrestador = ?, entidad = ?, fechaCreacion = ?, logo = ? WHERE prestadorId = ?');
        $query->execute([$_POST['nombrePrestador'], $_POST['entidad'], $_POST['fechaCreacion'], $_POST['logo'], $id]);
    }

    public function deletePrestador($id)
    {
        $query = $this->db->prepare('DELETE FROM opiniones WHERE prestadorId = ?');
        $query->execute([$id]);
        $query = $this->db->prepare('DELETE FROM prestadores WHERE prestadorId = ?');
        $query->execute([$id]);
    }
}
