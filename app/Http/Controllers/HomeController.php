<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Reward;
use App\Gift;
use App\Code;
use App\Http\Requests\ExchangeGift;
use App\Report;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(): \Illuminate\Contracts\Support\Renderable
    {
        $user_id    = Auth::id();
        $user       = User::where('id', $user_id)->first();
        $codes      = Code::where('user_id', $user_id)->pluck('code')->toArray();
        $reward     = Reward::where('user_id', $user_id)->join('gifts', 'rewards.gift_id', '=', 'gifts.id')->select('gifts.name')->first();

        return view('home', [
            'user' => $user, 
            'reward' => $reward, 
            'codes' => $codes
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function exchangeGift(ExchangeGift $request): \Illuminate\Http\JsonResponse
    {
        $user_id        = Auth::id();
        $code           = $request->code;
        $validateCode   = Code::where('user_id', $user_id)
            ->where('code', $code)
            ->first();

        //The code is invalid
        if (!$validateCode) {
            return response()->json([
                'status'    => 0,
                'msg'       => 'Mã dự thưởng không hợp lệ.'
            ]);
        }

        //The code is exchanged
        $isExchanged = Reward::where('user_id', $user_id)->first();
        if ($isExchanged) {
            return response()->json([
                'status' => 0,
                'msg'    => 'Bạn đã nhận thưởng. Vui lòng nhận tiếp vào đợt sau'
            ]);
        }

        $gift = $this->updateGift();
        $validateCode->delete();
        Reward::insert([
            'user_id' => $user_id,
            'gift_id' => $gift->id
        ]);

        return response()->json([
            'status'    => 1,
            'msg'       => 'Bạn đã trúng ' . $gift->name,
            'image'     => $gift->image
        ]);
    }

    private function updateGift(): Gift
    {
        $rule           = config('rule');
        $receive_user   = (int) Report::where('meta_key', 'received_user')->pluck('meta_value')->first();
        $position       = ($receive_user + 1) % 9;
        $gift_id        = $position ? $rule[$position - 1] : $rule[8];
        $gift           = Gift::whereId($gift_id)->where('quantity', '>', 0)->first() ?? Gift::orderBy('quantity', 'DESC')->where('quantity', '>', 0)->first();
        if (!$gift) {
            return response()->json([
                'status' => 0,
                'msg'    => 'Đã hết phần thưởng. Chúc bạn may mắn lần sau'
            ]);
        }
        $gift->quantity = $gift->quantity - 1;
        $gift->save();
        Report::where('meta_key', 'received_user')->update(['meta_value' => $receive_user + 1]);

        return $gift;
    }
}
