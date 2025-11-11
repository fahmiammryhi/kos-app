<?php

namespace App\Http\Controllers;

use App\Interfaces\BoardingHouseRepositoryInterface;
use Illuminate\Http\Request;

class CityController extends Controller
{
    private BoardingHouseRepositoryInterface $boardinghouseRepository;

    public function __construct(
        BoardingHouseRepositoryInterface $boardinghouseRepository
    ) {
        $this->boardinghouseRepository = $boardinghouseRepository;
    }

    public function show($slug)
    {
        $boardingHouses = $this->boardinghouseRepository->getBoardingHouseByCitySlug($slug);

        return view('pages.city.show', compact('boardingHouses'));
    }
}
