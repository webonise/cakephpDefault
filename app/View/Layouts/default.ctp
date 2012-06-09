<!DOCTYPE HTML>
<html>
<head>
    <?php echo $this->Html->charset(); ?>
    <title>
        <?php echo $title_for_layout; ?>
    </title>
    <?php
    echo $this->Html->meta('icon');

    echo $this->fetch('meta');

    echo $this->Html->css('bootstrap');
    echo $this->fetch('css');

    echo $this->Html->script(array('jQuery/jquery-1.7.2.min', 'jQuery/bootstrap'));
    echo $this->fetch('script');
    ?>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <?php echo $this->element('topmenu'); ?>
        </div>
    </div>
</div>
<div class="container-fluid">
    <?php
    echo $this->Session->flash();
    echo $this->fetch('content');
    ?>
    <hr>
    <footer>
        <p>
            &copy; CakePHPDefault <?php echo date('Y'); ?>
        </p>
    </footer>
</div>
<?php echo $this->element('sql_dump'); ?>
</body>
</html>