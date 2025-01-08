<?php

namespace App\Controllers;

use App\Models\PostModel;

class Posts extends BaseController
{
    public function index()
    {
       
        return view('post/index');
    }

    public function create()
    {
        // Menampilkan halaman form tambah data
        return view('post/create');
    }

    public function store()
    {
        // Proses menyimpan data baru
        $this->postModel->save([
            'title' => $this->request->getPost('title'),
            'content' => $this->request->getPost('content'),
        ]);

        return redirect()->to('/posts')->with('message', 'Post berhasil ditambahkan.');
    }

    public function edit($id)
    {
        // Menampilkan halaman form edit
        $data = [
            'post' => $this->postModel->find($id),
        ];

        if (!$data['post']) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Post tidak ditemukan');
        }

        return view('post/edit', $data);
    }

    public function update($id)
    {
        // Proses update data
        $this->postModel->update($id, [
            'title' => $this->request->getPost('title'),
            'content' => $this->request->getPost('content'),
        ]);

        return redirect()->to('/posts')->with('message', 'Post berhasil diperbarui.');
    }

    public function show($id)
    {
        // Menampilkan detail data
        $data = [
            'post' => $this->postModel->find($id),
        ];

        if (!$data['post']) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Post tidak ditemukan');
        }

        return view('post/show', $data);
    }

    public function delete($id)
    {
        // Proses hapus data
        $this->postModel->delete($id);

        return redirect()->to('/posts')->with('message', 'Post berhasil dihapus.');
    }
}