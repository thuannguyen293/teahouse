<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Reward;
use App\Gift;
use App\Point;
use DB;

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
    public function index()
    {
        $user_id = Auth::id();
        $user = User::join('points','users.phone_number', '=', 'points.phone_number')->where('users.id', $user_id)->first();
        $reward = Reward::where('user_id', $user_id)->join('gifts', 'rewards.gift_id', '=', 'gifts.id')->select('gifts.name')->first();
        return view('home', ['user' => $user, 'reward' => $reward]);
    }

    public function exchangeGift(Request $request){
        $request->validate([
            'code' => ['required', 'alpha_num'],
        ]);
        $rule = config('rule');
        
        $code = $request->code;
        $validateCode = Point::where('code', 'like', '%'.$code.'%')->first();
        if(!$validateCode){
            return response()->json([
                'status' => 0,
                'msg' => 'Mã dự thưởng không hợp lệ.'
            ]);
        }
        $arrCode = explode(',', $validateCode->code); 
        if(!in_array($code, $arrCode)){
            return response()->json([
                'status' => 0,
                'msg' => 'Mã dự thưởng không hợp lệ.'
            ]);
        }else{
            $user_id = User::where('phone_number', $validateCode->phone_number)->pluck('id')->first();
            $user = Reward::where('user_id', $user_id)->first();
            if($user){
                return response()->json([
                    'status' => 0,
                    'msg' => 'Bạn đã nhận thưởng. Vui lòng nhận tiếp vào đợt sau'
                ]);
            }
            $receive_user = (int) DB::table('reports')->where('meta_key', 'received_user')->pluck('meta_value')->first();
            $position = ($receive_user+1)%9;
            $gift_id = $rule[$position-1];
            $gift = Gift::whereId($gift_id)->where('quantity','>', 0)->first();
            if(!$gift)
                $gift = Gift::where('quantity','>', 0)->first();
            if($gift){
                $gift->quantity = $gift->quantity - 1;
                $gift->save();
                DB::table('reports')->where('meta_key', 'received_user')->update(['meta_value' => $receive_user+1]);
                $tempCode = explode(',', $validateCode->code);
                if (($key = array_search($code, $tempCode)) !== false) {
                    unset($tempCode[$key]);
                }
                $validateCode->code = implode(',', $tempCode);
                $validateCode->save();
                Reward::insert([
                    'user_id' => $user_id,
                    'gift_id' => $gift->id
                ]);
                return response()->json([
                    'status' => 1,
                    'msg' => 'Bạn đã trúng '. $gift->name,
                    'image' => $gift->image
                ]);
            }else{
                return response()->json([
                    'status' => 0,
                    'msg' => 'Đã hết phần thưởng. Chúc bạn may mắn lần sau'
                ]);
            }
        }
    }
}
