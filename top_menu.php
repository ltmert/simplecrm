<div id="top_menu">
    <ul>
        <li><a href="dashboard.php" <?php if($_GET['currentPage'] == 'dashboard') echo 'class="active"'; ?>>Dashboard</a></li>
        <li><a href="tasks.php" <?php if($_GET['currentPage'] == 'tasks') echo 'class="active"'; ?>>Tasks</a></li>
        <li><a href="leads.php" <?php if($_GET['currentPage'] == 'leads') echo 'class="active"'; ?>>Leads</a></li>
        <li><a href="opportunities.php" <?php if($_GET['currentPage'] == 'opportunities') echo 'class="active"'; ?>>Opportunities</a></li>
        <li><a href="customers.php" <?php if($_GET['currentPage'] == 'customers') echo 'class="active"'; ?>>Customers</a></li>
    </ul>
</div>
