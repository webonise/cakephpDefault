<a class="brand" href="/users">CakePHP Default</a>
<?php if ($loggedInUserId) { ?>
<div class="btn-group pull-right">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="icon-user"></i> <?php echo $loggedInUserName;?>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <?php
        echo $this->Html->tag('li', $this->Html->link(__('Change Password'), array('controller' => 'users', 'action' => 'password_change'), array('escape' => false)), array('escape' => false));
        echo $this->Html->tag('li', null, array('escape' => false, 'class' => 'divider'));
        echo $this->Html->tag('li', $this->Html->link(__('Sign Out'), array('controller' => 'users', 'action' => 'logout', 'plugin' => false), array('escape' => false)), array('escape' => false));
        ?>
    </ul>
</div>
<?php } else if($this->params['controller'] != 'users' && $this->params['action'] != 'login') { ?>
<div class="btn-group pull-right">
    <?php
        echo $this->Html->link(__('Sign In'), array('controller' => 'users', 'action' => 'login'), array('escape' => false,'class' => 'btn dropdown-toggle'));
    ?>
</div>
<?php } ?>
<div class="nav-collapse">
    <ul class="nav">
    </ul>
</div>
