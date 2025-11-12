<?php

namespace App\Http\Controllers;

use App\Interfaces\BoardingHouseRepositoryInterface;
use App\Interfaces\CityRepositoryInterface;
use Illuminate\Http\Request;

class CityController extends Controller
{
    private BoardingHouseRepositoryInterface $boardinghouseRepository;
    private CityRepositoryInterface $cityRepository;

    public function __construct(
        BoardingHouseRepositoryInterface $boardinghouseRepository,
        CityRepositoryInterface $cityRepository
    ) {
        $this->boardinghouseRepository = $boardinghouseRepository;
        $this->cityRepository = $cityRepository;
    }

    public function show($slug)
    {
        $boardingHouses = $this->boardinghouseRepository->getBoardingHouseByCitySlug($slug);
        $city = $this->cityRepository->getAllCityBySlug($slug);

        return view('pages.city.show', compact('city', 'boardingHouses'));
    }
}
