<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corvus.tech</title>
    <link rel="stylesheet" href="view/css/index.css">
    <link rel="icon" type="image/x-icon" href="view/imagens/Corvus.tech_logo.png">
</head>

<body>
    <header>
        <h1>Bem-vindo à Corvus.tech</h1>
        <nav>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="controler/produtos.php">Produtos</a></li>
                <li><a href="model/login.php">Login</a></li>
                <li><a href="model/cadastro.php">Cadastro</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <?php if (isset($_SESSION['usuario'])): ?>
                <h2>Bem-vindo, <?php echo $_SESSION['usuario']; ?>!</h2>
                <a href="model/logout.php">Sair</a>
            <?php else: ?>
                <h2>Faça login ou cadastre-se para acessar mais recursos.</h2>
            <?php endif; ?>
        </section>

        <section class="aboutus">
            <h1>Sobre nós</h1>
            <img style="width: 150px; border-radius: 250px;" src="view/imagens/Corvus.tech_logo.png" alt="Logo Corvus.tech">
            <p>
                A Corvus.tech é uma empresa que atua como um distribuidor confiável e especializado em uma ampla gama de produtos eletrônicos. Desde celulares de última geração até computadores e notebooks para diferentes perfis de uso, nossa missão é fornecer equipamentos de alta qualidade que atendam às necessidades tanto de consumidores finais quanto de empresas.
            </p>
            <p>
                Nossa loja conta com um catálogo diversificado que abrange as melhores marcas e os mais recentes lançamentos do mercado. Para quem busca performance, estilo ou funcionalidade, oferecemos opções de equipamentos com as tecnologias mais avançadas, desde modelos básicos até os mais sofisticados.
            </p>
            <p>
                Em termos de computadores e notebooks, nossa seleção inclui desde máquinas para quem precisa de desempenho robusto em trabalhos gráficos e desenvolvimento de software até opções mais acessíveis para estudos e uso cotidiano. Também somos apaixonados pelo universo dos jogos eletrônicos, oferecendo consoles, jogos e acessórios que proporcionam uma experiência imersiva e completa. Trabalhamos para garantir uma seleção sempre atualizada de títulos e periféricos que atendem tanto jogadores casuais quanto profissionais.
            </p>
            <p>
                Na Corvus.tech, valorizamos a experiência de compra dos nossos clientes, oferecendo um atendimento personalizado e especializado. Nossa equipe está sempre pronta para auxiliar você a encontrar o equipamento ideal, seja para aumentar a produtividade no trabalho, melhorar a performance em jogos ou aproveitar as facilidades que a tecnologia moderna pode proporcionar.
            </p>
            <p>
                Com uma plataforma de e-commerce simples, segura e eficiente, garantimos que sua experiência de compra seja prática e tranquila. Oferecemos diversas opções de pagamento, além de um sistema de entregas rápidas para todo o Brasil, garantindo que seus produtos cheguem até você com segurança e agilidade. A Corvus.tech acredita que a tecnologia transforma vidas e aproxima pessoas, por isso trabalhamos com dedicação para entregar o melhor em inovação, performance e custo-benefício.
            </p>
        </section>
    </main>

    <footer>
        <div class="footer-content">
            <ul>
                <h3>Contato</h3>
                <li>(61) 91234-5678</li>
                <li><a style="color: white;" href="mailto:#">corvustech@gmail.com</a></li>
            </ul>
            <ul>
                <h3>Endereço</h3>
                <li>CEP: 123.456-789</li>
                <li>Rua do Corvo</li>
                <li>Prédio Corvinal, 217 - Brasília/DF</li>
            </ul>
            <ul>
                <h3>Redes Sociais</h3>
                <li>Instagram</li>
                <li>WhatsApp</li>
                <li>Github</li>
            </ul>
        </div>
    </footer>

</body>

</html>