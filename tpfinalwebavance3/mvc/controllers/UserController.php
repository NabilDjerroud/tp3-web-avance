<?php

namespace App\Controllers;
use TCPDF;
use App\Models\Privilege;
use App\Models\User;
use App\Models\UserLog;
use App\Providers\View;
use App\Providers\Validator;
require_once '../vendor/autoload.php';

class UserController {

    public function create() {
        if ($_SESSION['privilege_id'] == 1) {
            $privilege = new Privilege;
            $privileges = $privilege->select('privilege');
            return View::render('user/create', ['privileges' => $privileges]);
        } else {
            return View::render('error');
        }
    }

    public function store($data) {
        if ($_SESSION['privilege_id'] == 1) {
            $validator = new Validator;
            $validator->field('name', $data['name'])->min(2)->max(50);
            $validator->field('username', $data['username'])->min(2)->max(50)->email()->unique('User');
            $validator->field('password', $data['password'])->min(6)->max(20);
            $validator->field('email', $data['email'])->required()->max(100)->email()->unique('User');
            $validator->field('privilege_id', $data['privilege_id'], 'Privilege')->required();

            if ($validator->isSuccess()) {
                $user = new User;
                $data['password'] = $user->hashPassword($data['password']);
                $insert = $user->insert($data);
                if ($insert) {
                    $userLog = new UserLog();
                    $userLog->insertLog($insert, $data['username'], $_SERVER['REMOTE_ADDR'], 'Registration');
                    return View::redirect('login');
                } else {
                    return View::render('error');
                }
            } else {
                $errors = $validator->getErrors();
                $privilege = new Privilege;
                $privileges = $privilege->select('privilege');
                return View::render('user/create', ['errors'=>$errors, 'user'=>$data, 'privileges' => $privileges]);
            }
        } else {
            return View::render('error');
        }
    }

    public function logs() {
        $userLog = new UserLog(); // Instanciation de la classe UserLog
        $logs = $userLog->getAllLogs(); // Appel de la méthode sur l'instance
        return View::render('user/logs', ['logs' => $logs]);
    }

    public function login($username, $password) {
        $user = User::findByUsername($username);
        
        if ($user && password_verify($password, $user['password'])) {
            // Authentification réussie
            
            // Récupération de l'adresse IP et de la page visitée
            $ip = $_SERVER['REMOTE_ADDR'];
            $page = $_SERVER['REQUEST_URI'];
            
            // Enregistrement des informations de connexion dans la table user_logs
            $userLog = new UserLog();
            $userLog->insertLog($user['id'], $username, $ip, $page);
            
            // Redirection vers une page de succès ou autre traitement
            return View::render('success');
        } else {
            // Authentification échouée
            // Redirection vers une page d'erreur ou autre traitement
            return View::render('error');
        }
    }

    public function generatePDF() {
        // Initialisation de TCPDF
        $pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
    
        // Définition des informations du document
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Your Name');
        $pdf->SetTitle('Journal de bord');
        $pdf->SetSubject('Journal de bord');
        $pdf->SetKeywords('TCPDF, PDF, example, test, guide');
    
        // Début du document
        $pdf->AddPage();
    
        // Contenu du PDF
        $html = '<h1>Journal de bord</h1>';
        $html .= '<table border="1">';
        $html .= '<thead><tr><th>ID</th><th>User ID</th><th>Username</th><th>IP Address</th><th>Visited Page</th><th>Created At</th></tr></thead>';
        $html .= '<tbody>';
        // Ajoutez vos données de journal ici
        $html .= '</tbody></table>';
    
        // Ajouter le contenu HTML au PDF
        $pdf->writeHTML($html, true, false, true, false, '');
    
        // Fermeture et sortie du PDF en flux de sortie (output stream)
        $pdf->Output('Journal_de_bord.pdf', 'D');
    }
}

