{{ include('layouts/header.php', {title: 'Journal de bord'}) }}
<div class="container">
    <h2>Journal de bord</h2>    
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Username</th>
                <th>IP Address</th>
                <th>Visited Page</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($logs as $log): ?>
            <tr>
                <td><?php echo $log['id']; ?></td>
                <td><?php echo $log['user_id']; ?></td>
                <td><?php echo $log['username']; ?></td>
                <td><?php echo $log['ip_address']; ?></td>
                <td><?php echo $log['visited_page']; ?></td>
                <td><?php echo $log['created_at']; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<a class="btn" href="{{base}}/generate-pdf" target="_blank">Télécharger le journal de bord au format PDF</a>

{{ include('layouts/footer.php') }}
