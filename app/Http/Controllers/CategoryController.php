<?php

namespace App\Http\Controllers;

use App\Interfaces\BoardingHouseRepositoryInterface;
use App\Interfaces\CategoryRepositoryInterface;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    private BoardingHouseRepositoryInterface $boardinghouseRepository;
    private CategoryRepositoryInterface $categoryRepository;

    public function __construct(
        BoardingHouseRepositoryInterface $boardinghouseRepository,
        CategoryRepositoryInterface $categoryRepository
    ) {
        $this->boardinghouseRepository = $boardinghouseRepository;
        $this->categoryRepository = $categoryRepository;
    }

    public function show($slug)
    {
        $boardingHouses = $this->boardinghouseRepository->getBoardingHouseByCategorySlug($slug);
        $category = $this->categoryRepository->getAllCategoryBySlug($slug);

        return view('pages.category.show', compact('category', 'boardingHouses'));
    }
}
