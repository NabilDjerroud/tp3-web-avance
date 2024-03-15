<?php

namespace App\Models;

use PDO;

class UserLog extends CRUD
{
    protected $table = 'user_logs';

    // Méthode pour enregistrer un journal dans la base de données
    public function log($ip, $username, $page) {
        // Assurez-vous que $_SESSION['user_id'] est défini et contient l'identifiant de l'utilisateur
        if (!isset($_SESSION['user_id'])) {
            return false; // Ou lancez une exception si nécessaire
        }

        // Connexion à la base de données
        $db = static::getDB();

        // Requête pour insérer un journal dans la base de données
        $query = "INSERT INTO user_logs (user_id, username, ip_address, visited_page) VALUES (:user_id, :username, :ip, :page)";

        // Préparation de la requête
        $stmt = $db->prepare($query);

        // Liaison des paramètres
        $stmt->bindParam(':user_id', $_SESSION['user_id']);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':ip', $ip);
        $stmt->bindParam(':page', $page);

        // Exécution de la requête
        return $stmt->execute();
    }

    // Méthode pour insérer un nouveau journal dans la base de données
    public function insertLog($user_id, $username, $ip_address, $visited_page)
    {
        $db = static::getDB();
        $sql = "INSERT INTO user_logs (user_id, username, ip_address, visited_page, created_at) VALUES (:user_id, :username, :ip_address, :visited_page, NOW())";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindValue(':username', $username, PDO::PARAM_STR);
        $stmt->bindValue(':ip_address', $ip_address, PDO::PARAM_STR);
        $stmt->bindValue(':visited_page', $visited_page, PDO::PARAM_STR);
        return $stmt->execute();
    }

    // Méthode pour récupérer tous les journaux
    public static function getAllLogs() {
        // Connexion à la base de données
        $db = static::getDB();
    
        // Requête pour récupérer tous les journaux d'utilisateurs
        $query = "SELECT * FROM user_logs";
    
        // Exécution de la requête
        $stmt = $db->query($query);
    
        // Récupération des résultats
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
