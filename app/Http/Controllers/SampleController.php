<?php

declare(strict_types=1);

namespace App\Http\Controllers;

class SampleController
{
    public function __invoke()
    {
        return 'sample';
    }
}
