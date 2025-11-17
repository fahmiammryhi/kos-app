<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookingShowRequest;
use App\Http\Requests\CustomerInformationStoreRequest;
use App\Interfaces\BoardingHouseRepositoryInterface;
use App\Interfaces\TransactionRepositoryInterface;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    private BoardingHouseRepositoryInterface $boardinghouseRepository;
    private TransactionRepositoryInterface $transactionRepository;

    public function __construct(
        BoardingHouseRepositoryInterface $boardinghouseRepository,
        TransactionRepositoryInterface $transactionRepository
    ) {
        $this->boardinghouseRepository = $boardinghouseRepository;
        $this->transactionRepository = $transactionRepository;
    }

    public function booking(Request $request, $slug)
    {
        $this->transactionRepository->saveTransactionDataToSession($request->all());

        return redirect()->route('booking.information', $slug);
    }

    public function information($slug)
    {
        $transaction = $this->transactionRepository->getTransactionDataFromSession();
        $boardingHouse = $this->boardinghouseRepository->getBoardingHouseBySlug($slug);
        $room = $this->boardinghouseRepository->getBoardingHouseRoomById($transaction['room_id']);

        return view('pages.booking.information', compact('transaction', 'boardingHouse', 'room'));
    }

    public function saveInformation(CustomerInformationStoreRequest $request, $slug)
    {
        $data = $request->validated();

        $this->transactionRepository->saveTransactionDataToSession($data);

        // dd($this->transactionRepository->getTransactionDataFromSession());

        return redirect()->route('booking.checkout', $slug);
    }

    public function checkout($slug)
    {
        $transaction = $this->transactionRepository->getTransactionDataFromSession();
        $boardingHouse = $this->boardinghouseRepository->getBoardingHouseBySlug($slug);
        $room = $this->boardinghouseRepository->getBoardingHouseRoomById($transaction['room_id']);

        return view('pages.booking.checkout', compact('transaction', 'boardingHouse', 'room'));
    }

    public function payment(Request $request)
    {
        $this->transactionRepository->saveTransactionDataToSession($request->all());

        $transaction = $this->transactionRepository->saveTransaction(
            $this->transactionRepository->getTransactionDataFromSession()
        );

        $serverKey = config('midtrans.serverKey');
        $isProduction = config('midtrans.isProduction');

        $url = $isProduction
            ? 'https://app.midtrans.com/snap/v1/transactions'
            : 'https://app.sandbox.midtrans.com/snap/v1/transactions';

        $params = [
            'transaction_details' => [
                'order_id' => $transaction->code,
                'gross_amount' => $transaction->total_amount,
                // 'gross_amount' => (int) round($transaction->total_amount),

            ],
            'customer_details' => [
                'first_name' => $transaction->name,
                'email' => $transaction->email,
                'phone' => $transaction->phone_number,
            ],
        ];

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Accept: application/json',
            'Content-Type: application/json',
            'Authorization: Basic ' . base64_encode($serverKey . ':'),
        ]);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        $result = json_decode($response, true);

        // Handle error response
        if ($httpCode != 201 || !isset($result['redirect_url'])) {
            \Log::error('Midtrans Payment Error', [
                'http_code' => $httpCode,
                'response' => $result,
                'params' => $params,
            ]);

            return back()->with('error', 'Gagal membuat transaksi pembayaran. Silakan coba lagi.');
        }
        return redirect($result['redirect_url']);
    }

    public function success(Request $request)
    {
        $transaction = $this->transactionRepository->getTransactionByCode($request->order_id);

        if (!$transaction) {
            return redirect()->route('home');
        }

        return view('pages.booking.success', compact('transaction'));
    }


    public function check()
    {
        return view('pages.booking.check-booking');
    }

    public function show(BookingShowRequest $request) 
    {
        // dd($this->transactionRepository->getTransactionByCodeEmailPhone($request->code, $request->email, $request->phone_number));
        
        $transaction = $this->transactionRepository->getTransactionByCodeEmailPhone($request->code, $request->email, $request->phone_number);
        
        if (!$transaction) {
            return redirect()->back()->with('error', 'Data booking tidak ditemukan. Silakan periksa kembali informasi yang Anda masukkan.');
        }

        return view('pages.booking.detail', compact('transaction'));
    }
}
