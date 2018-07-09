<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2018-07-09
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/admin/theme.css" type="text/css"> </head>

<body>
<div class="my-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center my-1">Promotion of purchase</h1>
            </div>
        </div>
    </div>
</div>
<div class="py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" class="nav-link disabled" data-toggle="tab" data-target="#tabone-pop">팝업 설정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="" data-toggle="tab" data-target="#tabtwo-statistics">통 계</a>
                    </li>
                </ul>
                <div class="tab-content mt-2">
                    <div class="tab-pane fade show active" id="tabone-pop" role="tabpanel">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a href="" class="active nav-link" data-toggle="tab" data-target="#tabone-product" contenteditable="true">상품별</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="" data-toggle="tab" data-target="#tabtwo-popup">팝업별</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content mt-2">
                                        <div class="tab-pane fade show active" id="tabone-product" role="tabpanel">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-8 text-right">
                                                                <a href="#" class="btn btn-outline-primary py-2">&nbsp; 오 &nbsp;늘 &nbsp;</a>
                                                                <a href="#" class="btn btn-outline-primary py-2">최근 1주</a>
                                                                <a href="#" class="btn btn-outline-primary py-2">최근 1달</a>
                                                                <a href="#" class="btn btn-outline-primary py-2">최근 6달</a>
                                                            </div>
                                                            <div class="col-md-2 px-2">
                                                                <input type="date" class="form-control my-1" value="on"> </div>
                                                            <div class="col-md-2 px-2">
                                                                <input type="date" class="form-control my-1" value="on"> </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-8 px-4 text-right">
                                                                        <div class="btn-group my-1 p-0">
                                                                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> Dropdown </button>
                                                                            <div class="dropdown-menu">
                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                <div class="dropdown-divider"></div>
                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3 px-2">
                                                                        <input type="text" class="form-control my-1" placeholder=" search "> </div>
                                                                    <div class="col-md-1 p-0">
                                                                        <a href="#" class="btn btn-outline-primary my-1">&nbsp; 검 색 &nbsp;</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th class="table-info">No</th>
                                                            <th class="table-info">Product</th>
                                                            <th class="table-info">Click Count</th>
                                                            <th>Detail</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td class="text-center py-5">1</td>
                                                            <td class="text-left">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <img class="img-fluid d-block p-0" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" width="200px" height="200px"> </div>
                                                                    <div class="col-md-8">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <p class="lead my-1">상품명 1</p>
                                                                            </div>
                                                                            <div class="col-md-6"></div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <ul class="">
                                                                                    <li>브랜드</li>
                                                                                    <li>옵션</li>
                                                                                    <li>Three</li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <span class="badge badge-primary badge-pill">3722</span>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <a href="#" class="btn btn-outline-secondary border border-light" data-target="#modal-detail" data-toggle="modal">상세보기</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">2</td>
                                                            <td>Thornton</td>
                                                            <td>Cell</td>
                                                            <td>Cell</td>
                                                        </tr>
                                                        <tr></tr>
                                                        <tr></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tabtwo-popup" role="tabpanel">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-1"></div>
                                                        <div class="col-md-1"></div>
                                                        <div class="col-md-1"></div>
                                                        <div class="col-md-1"></div>
                                                        <div class="col-md-1 px-1">
                                                            <a href="#" class="btn btn-outline-primary py-2">&nbsp; 오 &nbsp;늘 &nbsp;</a>
                                                        </div>
                                                        <div class="col-md-1 px-1">
                                                            <a href="#" class="btn btn-outline-primary py-2">최근 1주</a>
                                                        </div>
                                                        <div class="col-md-1 px-1">
                                                            <a href="#" class="btn btn-outline-primary py-2">최근 1달</a>
                                                        </div>
                                                        <div class="col-md-1 px-1">
                                                            <a href="#" class="btn btn-outline-primary py-2">최근 6달</a>
                                                        </div>
                                                        <div class="col-md-2 px-2">
                                                            <input type="date" class="form-control my-1" value="on"> </div>
                                                        <div class="col-md-2 px-2">
                                                            <input type="date" class="form-control my-1" value="on"> </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-2 px-4">
                                                                    <div class="btn-group my-1 px-4">
                                                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> Dropdown </button>
                                                                        <div class="dropdown-menu">
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                            <div class="dropdown-divider"></div>
                                                                            <a class="dropdown-item" href="#">Separated link</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 px-2">
                                                                    <input type="text" class="form-control my-1" placeholder=" search "> </div>
                                                                <div class="col-md-1 p-0">
                                                                    <a href="#" class="btn btn-outline-primary my-1">&nbsp; 검 색 &nbsp;</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th class="table-info">No</th>
                                                            <th class="table-info">Product</th>
                                                            <th class="table-info">Click Count</th>
                                                            <th>Detail</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td class="text-center py-5">1</td>
                                                            <td class="text-left">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <img class="img-fluid d-block p-0" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" width="200px" height="200px"> </div>
                                                                    <div class="col-md-8">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <p class="lead my-1">상품명 1</p>
                                                                            </div>
                                                                            <div class="col-md-6"></div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <ul class="">
                                                                                    <li>브랜드</li>
                                                                                    <li>옵션</li>
                                                                                    <li>Three</li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <span class="badge badge-primary badge-pill">3722</span>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <a href="#" class="btn btn-outline-secondary border border-light" data-target="#modal-detail" data-toggle="modal">상세보기</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">2</td>
                                                            <td>Thornton</td>
                                                            <td>Cell</td>
                                                            <td>Cell</td>
                                                        </tr>
                                                        <tr></tr>
                                                        <tr></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tabtwo-statistics" role="tabpanel">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="active nav-link" href="" data-toggle="tab" data-target="#tabone-product">상품별</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="" class="nav-link" data-toggle="tab" data-target="#tabtwo-popup">팝업별</a>
                                    </li>
                                </ul>
                                <div class="tab-content mt-2">
                                    <div class="tab-pane fade show active" id="tabone-product" role="tabpanel">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-6 text-right py-1">
                                                    <a href="#" class="btn btn-outline-primary ">오늘</a>
                                                    <a href="#" class="btn btn-outline-primary ">최근1주</a>
                                                    <a href="#" class="btn btn-outline-primary ">최근1달</a>
                                                    <a href="#" class="btn btn-outline-primary ">최근6달</a>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="date" class="form-control my-1" value="on"> </div>
                                                <div class="col-md-3">
                                                    <input type="date" class="form-control my-1" value="on"> </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-2 px-4">
                                                    <div class="btn-group my-1 px-4">
                                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> Dropdown </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="#">Action</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="#">Separated link</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 px-2">
                                                    <input type="text" class="form-control my-1" placeholder=" search "> </div>
                                                <div class="col-md-1 p-0">
                                                    <a href="#" class="btn btn-outline-primary my-1">&nbsp; 검 색 &nbsp;</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th class="table-info">No</th>
                                                            <th class="table-info">Product</th>
                                                            <th class="table-info">Click Count</th>
                                                            <th>Detail</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td class="text-center py-5">1</td>
                                                            <td class="text-left">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <img class="img-fluid d-block p-0" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" width="200px" height="200px"> </div>
                                                                    <div class="col-md-8">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <p class="lead my-1">상품명 1</p>
                                                                            </div>
                                                                            <div class="col-md-6"></div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <ul class="">
                                                                                    <li>브랜드</li>
                                                                                    <li>옵션</li>
                                                                                    <li>Three</li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <span class="badge badge-primary badge-pill">3722</span>
                                                            </td>
                                                            <td class="text-center py-5">
                                                                <a href="#" class="btn btn-outline-secondary border border-light" data-toggle="modal" data-target="#modal-detail">상세보기</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">2</td>
                                                            <td>Thornton</td>
                                                            <td>Cell</td>
                                                            <td>Cell</td>
                                                        </tr>
                                                        <tr></tr>
                                                        <tr></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tabtwo-popup" role="tabpanel">
                                        <p class="">팝업별 탭 페이지 내용 적을 부분</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal my-5" id="modal-detail">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header m-0 p-0">
                <button type="button" class="close" data-dismiss="modal">
                    <span class="m-2">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row py-2 my-2">
                    <div class="col-md-6"></div>
                    <div class="col-md-6"></div>
                </div>
                <div class="row m-0">
                    <div class="col-md-5">
                        <p class="lead">- 상품정보</p>
                    </div>
                    <div class="col-md-7">
                        <p class="lead">- 전체 조회수 중 팝업을 통한 조회수</p>
                    </div>
                </div>
                <div class="row m-0">
                    <div class="col-md-2">
                        <img class="img-fluid d-block" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"> </div>
                    <div class="col-md-3">
                        <ul class="">
                            <li>카테고리</li>
                            <li>상품명</li>
                            <li>12,000원</li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <img class="img-fluid d-block" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"> </div>
                    <div class="col-md-5">
                        <div class="row m-1">
                            <div class="col-md-6 p-0 m-0">
                                <ul class="">
                                    <li class="">전체 조회 수</li>
                                    <li>팝업 클릭 수</li>
                                </ul>
                            </div>
                            <div class="col-md-6 p-0 m-0">
                                <p class="p-0 m-0">12,300</p>
                                <p class="p-0 m-0 text-danger">1,500</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-1 py-2">
                    <div class="col-md-6"></div>
                    <div class="col-md-6"></div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-0">
                        <p class="lead my-0 px-3">- 팝업별 클릭 수</p>
                        <div class="row">
                            <div class="col-md-12 px-4">
                                <div class="row">
                                    <div class="col-md-6 text-right py-1">
                                        <a href="#" class="btn btn-outline-primary ">오늘</a>
                                        <a href="#" class="btn btn-outline-primary ">최근1주</a>
                                        <a href="#" class="btn btn-outline-primary ">최근1달</a>
                                        <a href="#" class="btn btn-outline-primary ">최근6달</a>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="date" class="form-control my-1" value="on"> </div>
                                    <div class="col-md-3">
                                        <input type="date" class="form-control my-1" value="on"> </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right px-2">
                                        <a href="#" class="btn btn-outline-primary">&nbsp; 조 회 &nbsp;</a>
                                    </div>
                                </div>
                                <table class="table">
                                    <thead>
                                    <tr class="table-info">
                                        <th>팝업정보</th>
                                        <th class="">클릭 수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>현재 가장 많이 보고 있는 상품</td>
                                        <td class="">
                                            <span class="badge badge-primary badge-pill">14</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>할인 마감이 임박한 상품</td>
                                        <td class="">
                                            <span class="badge badge-primary badge-pill">714</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>재고가 얼마 남지 않은 상품</td>
                                        <td class="">
                                            <span class="badge badge-primary badge-pill">32414</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 10px;right:10px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:250px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo Free&nbsp;&nbsp;
    <img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16">
</pingendo>
</body>

</html>