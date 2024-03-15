<?php

namespace App\Controllers;
use TCPDF;
use App\Models\Privilege;
use App\Models\User;
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
        $html .= '</tbody></table>';
    
        // Ajouter le contenu HTML au PDF
        $pdf->writeHTML($html, true, false, true, false, '');
    
        // Fermeture et sortie du PDF en flux de sortie (output stream)
        $pdf->Output('Journal_de_bord.pdf', 'D');
    }
}

