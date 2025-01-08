<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Post</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h1 class="text-center mb-4">Post Details</h1>

                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="mb-0"><?= $post['title'] ?></h2>
                    </div>
                    <div class="card-body">
                        <p class="text-muted">Created At: <?= date('d M Y, H:i', strtotime($post['created_at'])) ?></p>
                        <p><?= nl2br($post['content']) ?></p>
                    </div>
                    <div class="card-footer text-end">
                        <a href="/posts" class="btn btn-secondary">Back to List</a>
                        <a href="/posts/edit/<?= $post['id'] ?>" class="btn btn-warning">Edit</a>
                        <a href="/posts/delete/<?= $post['id'] ?>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this post?')">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
