<?php

$directories = glob('/Users/jhedstrom/Sites/*');
 
foreach ($directories as $directory) {
  $name = array_pop(explode('/', $directory));
  $aliases[$name] = array(
      'uri' => "http://$name.dev",
      'root' => $directory,
  );
}

// Non-local
require __DIR__ . '/private.aliases.php';
