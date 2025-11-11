@extends('layouts.app')

@section('content')
<div id="Background"
    class="absolute top-0 w-full h-[430px] rounded-b-[75px] bg-[linear-gradient(180deg,#F2F9E6_0%,#D2EDE4_100%)]">
</div>

<div class="relative flex flex-col gap-[30px] my-[60px] px-5">
    <div class="flex items-center gap-4">
        <a href="{{ route('find-kos') }}" class="w-10 h-10 flex items-center justify-center rounded-full bg-white">
            <img src="{{ asset('assets/images/icons/arrow-left.svg') }}" class="w-5 h-5" alt="back">
        </a>
        <h1 class="font-bold text-2xl">Hasil Pencarian</h1>
    </div>

    @if($boardingHouses->count() > 0)
    <div class="flex flex-col gap-4">
        <p class="text-ngekos-grey">Ditemukan {{ $boardingHouses->count() }} kos</p>

        @foreach($boardingHouses as $house)
        <a href="{{ route('kos.show', $house->slug) }}"
            class="card flex rounded-[30px] border border-[#F1F2F6] p-4 gap-4 bg-white transition-all duration-300 hover:border-[#91BF77]">
            @if($house->thumbnail)
            <div class="flex w-[120px] h-[160px] shrink-0 rounded-[30px] bg-[#D9D9D9] overflow-hidden">
                <img src="{{ Storage::url($house->thumbnail) }}"
                    class="w-full h-full object-cover"
                    alt="{{ $house->name }}">
            </div>
            @else
            <div class="flex w-[120px] h-[160px] shrink-0 rounded-[30px] bg-[#D9D9D9] items-center justify-center">
                <span class="text-gray-400">No Image</span>
            </div>
            @endif

            <div class="flex flex-col gap-3 w-full">
                <div class="flex items-center justify-between gap-2">
                    <p class="font-bold text-lg leading-[27px] line-clamp-2">{{ $house->name }}</p>
                    <div class="flex shrink-0 items-center gap-[2px]">
                        <img src="{{ asset('assets/images/icons/star.svg') }}" class="w-4 h-4" alt="star">
                        <p class="font-semibold text-sm leading-[21px]">4.5</p>
                    </div>
                </div>

                <div class="flex items-center gap-[6px]">
                    <img src="{{ asset('assets/images/icons/location.svg') }}" class="w-5 h-5 flex shrink-0" alt="icon">
                    <p class="text-sm text-ngekos-grey">{{ $house->city->name }}</p>
                </div>

                <div class="flex items-center gap-2">
                    <span class="rounded-full p-[6px_12px] bg-[#91BF77] font-semibold text-xs leading-[18px] text-white">
                        {{ $house->category->name }}
                    </span>
                </div>

                <hr class="border-[#F1F2F6]">

                <div class="flex items-center justify-between">
                    <p class="text-sm text-ngekos-grey">Start From</p>
                    <p class="font-bold text-lg text-ngekos-orange">
                        Rp {{ number_format($house->price ?? 0, 0, ',', '.') }}<span class="font-normal text-sm text-ngekos-grey">/bulan</span>
                    </p>
                </div>
            </div>
        </a>
        @endforeach
    </div>
    @else
    <div class="flex flex-col items-center justify-center py-20 gap-4">
        <img src="{{ asset('assets/images/icons/note-favorite-grey.svg') }}" class="w-20 h-20 opacity-50" alt="empty">
        <div class="text-center">
            <h3 class="font-bold text-xl mb-2">Tidak Ada Hasil</h3>
            <p class="text-ngekos-grey">Coba cari dengan kata kunci atau filter lain</p>
        </div>
        <a href="{{ route('find-kos') }}"
            class="rounded-full p-[14px_20px] bg-ngekos-orange font-bold text-white mt-4">
            Cari Lagi
        </a>
    </div>
    @endif
</div>

@include('includes.navigation')
@endsection