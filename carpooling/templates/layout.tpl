<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>CarPooling Esame</title>
    <style>
        :root {
            --bg-color: #f5f5f5;
            --text-color: #333333;
            --container-bg: #ffffff;
            --border-color: #dddddd;
            --primary-color: #222222;
            --hover-color: #000000;
        }
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 40px 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: var(--container-bg);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
        }
        nav {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--bg-color);
            display: flex;
            gap: 20px;
        }
        nav a {
            text-decoration: none;
            color: #777;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: color 0.2s;
        }
        nav a:hover {
            color: var(--hover-color);
        }
        h1, h2, h3 {
            color: var(--primary-color);
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }
        th {
            background-color: #fafafa;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
            color: #555;
        }
        form p {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }
        input, select {
            width: 100%;
            max-width: 400px;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-family: inherit;
        }
        button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.2s;
        }
        button:hover {
            background-color: var(--hover-color);
        }
        hr {
            border: 0;
            height: 1px;
            background: var(--border-color);
            margin: 40px 0;
        }
        blockquote { 
            background: #fafafa;
            border-left: 4px solid var(--primary-color);
            margin: 0;
            padding: 20px;
            color: #444;
            border-radius: 0 4px 4px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav>
            <a href="/">Home</a>
            <a href="/cerca_autisti">Cerca Autisti</a>
            <a href="/mostra_promemoria">Promemoria</a>
            <a href="/filtra_passeggeri">Filtra Passeggeri</a>
        </nav>
        
        <!-- Qui Plates inietterà il contenuto delle pagine -->
        <?=$this->section('content')?>
    </div>
</body>
</html>
