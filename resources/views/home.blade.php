@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>
                @if (\Session::has('success'))
                    <div class="alert alert-success">
                        <p>{!! \Session::get('success') !!}</p>
                    </div>
                @endif
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="container">
                        <p>Nhân viên: {{ $user->email }}</p>
                        <p>Điểm thưởng: {{ $user->point }}</p>
                        <p>Mã dự thưởng: {{ is_null($user->code) ? 'Không có mã dự thưởng': $user->code }}</p>
                        <p>Giải thưởng hiện có: {{ isset($reward) ? $reward->name:'Không có giải thưởng nào' }} </p>
                        <a href="{{ route('changePassword.index') }}" class="btn btn-info">Đổi mật khẩu</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
