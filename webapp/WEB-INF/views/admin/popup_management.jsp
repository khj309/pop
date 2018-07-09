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
                        <a href="" class="active nav-link" data-toggle="tab" data-target="#tabone-pop">팝업 설정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="tab">통 계</a>
                    </li>
                </ul>
                <div class="tab-content mt-2">
                    <div class="tab-pane fade show active" id="tabone-pop" role="tabpanel">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a href="" class="active nav-link" data-toggle="tab" data-target="#tabone-main">메인</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="" data-toggle="tab" data-target="#tabtwo-list">상품 목록</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="" class="nav-link" data-toggle="tab" data-target="#tabthree-detail">상품 상세</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content mt-2">
                                        <div class="tab-pane fade show active" id="tabone-main" role="tabpanel">
                                            <div class="container">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-12 m-0 p-0">
                                                        <div class="radio radio-primary text-right">
                                                            <input type="radio" name="radio1-main" id="radio1-main" value="option1" checked="checked">
                                                            <label for="radio1-main"> 전체보기 </label> &nbsp;
                                                            <input type="radio" name="radio1-main" value="option2" id="radio2-main">
                                                            <label for="radio2-main" class=""> 사용 </label> &nbsp;
                                                            <input type="radio" name="radio1-main" id="radio3-main" value="option3">
                                                            <label for="radio3-main"> 미사용 </label> &nbsp; </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="table-info">No</th>
                                                                <th class="table-info">Title</th>
                                                                <th class="table-info">Comment</th>
                                                                <th class="table-info">Type</th>
                                                                <th class="table-info">State</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td class="">
                                                                    <div class="checkbox checkbox-primary m-0 p-0">
                                                                        <input id="checkbox2" type="checkbox" value="on" class="m-2">
                                                                        <label for="checkbox2" class="m-0 p-0"> </label>
                                                                    </div>
                                                                </td>
                                                                <td>1</td>
                                                                <td class="text-left">
                                                                    <a href="#" class="btn" data-target="#most_view" data-toggle="modal">현재 가장 많이 보고 있는 상품</a>
                                                                </td>
                                                                <td>가장 많은 회원이 보고 있는 ....</td>
                                                                <td>most_view</td>
                                                                <td class="text-left p-0 m-0">
                                                                    <label class="switch">
                                                                        <input type="checkbox" value="on">
                                                                        <span class="slider m-0"></span>
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>2</td>
                                                                <td>Thornton</td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>3</td>
                                                                <td>
                                                                    <a href="#" class="btn" data-target="#low_stock" data-toggle="modal">마감 임박 상품</a>
                                                                </td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-2 p-0 m-0">
                                                                <a href="#" class="btn btn-outline-primary m-0 p-1">&nbsp; &nbsp; Up &nbsp; &nbsp;</a>
                                                                <a href="#" class="btn btn-outline-primary align-items-center m-0 p-1">&nbsp; Down &nbsp;</a>
                                                            </div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-5">
                                                                <ul class="">
                                                                    <li>most_view : 현재 가장 많이 보고 있는 상품 타입</li>
                                                                    <li>Two</li>
                                                                    <li>Three</li>
                                                                    <li>One</li>
                                                                    <li>One</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabtwo-list" role="tabpanel">
                                            <div class="container">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-12 m-0 p-0">
                                                        <div class="radio radio-primary text-right">
                                                            <input type="radio" name="radio1-list" value="option1" id="radio1-list" checked="checked">
                                                            <label for="radio1-list"> 전체보기 </label> &nbsp;
                                                            <input type="radio" name="radio1-list" id="radio2-list" value="option2">
                                                            <label for="radio2-list" class=""> 사용 </label> &nbsp;
                                                            <input type="radio" name="radio1-list" value="option3" id="radio3-list">
                                                            <label for="radio3-list"> 미사용 </label> &nbsp; </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="table-info">No</th>
                                                                <th class="table-info">Title</th>
                                                                <th class="table-info">Comment</th>
                                                                <th class="table-info">Type</th>
                                                                <th class="table-info">State</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td class="">
                                                                    <div class="checkbox checkbox-primary m-0 p-0">
                                                                        <input id="checkbox2" type="checkbox" value="on" class="m-2">
                                                                        <label for="checkbox2" class="m-0 p-0"> </label>
                                                                    </div>
                                                                </td>
                                                                <td>1</td>
                                                                <td class="text-left">
                                                                    <a href="#" class="btn" data-target="#most_view" data-toggle="modal">현재 가장 많이 보고 있는 상품</a>
                                                                </td>
                                                                <td>가장 많은 회원이 보고 있는 ....</td>
                                                                <td>most_view</td>
                                                                <td class="text-left p-0 m-0">
                                                                    <label class="switch">
                                                                        <input type="checkbox" value="on">
                                                                        <span class="slider m-0"></span>
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>2</td>
                                                                <td>Thornton</td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>3</td>
                                                                <td>
                                                                    <a href="#" class="btn" data-target="#low_stock" data-toggle="modal">마감 임박 상품</a>
                                                                </td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-2 p-0 m-0">
                                                                <a href="#" class="btn btn-outline-primary m-0 p-1">&nbsp; &nbsp; Up &nbsp; &nbsp;</a>
                                                                <a href="#" class="btn btn-outline-primary align-items-center m-0 p-1">&nbsp; Down &nbsp;</a>
                                                            </div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-5">
                                                                <ul class="">
                                                                    <li>most_view : 현재 가장 많이 보고 있는 상품 타입</li>
                                                                    <li>Two</li>
                                                                    <li>Three</li>
                                                                    <li>One</li>
                                                                    <li>One</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabthree-detail" role="tabpanel">
                                            <div class="container">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-12 m-0 p-0">
                                                        <div class="radio radio-primary text-right">
                                                            <input type="radio" name="radio1-detail" value="option1" id="radio1-detail" checked="checked">
                                                            <label for="radio1-detail"> 전체보기 </label> &nbsp;
                                                            <input type="radio" name="radio1-detail" id="radio2-detail" value="option2">
                                                            <label for="radio2-detail" class=""> 사용 </label> &nbsp;
                                                            <input type="radio" name="radio1-detail" value="option3" id="radio3-detail">
                                                            <label for="radio3-detail"> 미사용 </label> &nbsp; </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="table-info">No</th>
                                                                <th class="table-info">Title</th>
                                                                <th class="table-info">Comment</th>
                                                                <th class="table-info">Type</th>
                                                                <th class="table-info">State</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td class="">
                                                                    <div class="checkbox checkbox-primary m-0 p-0">
                                                                        <input id="checkbox2" type="checkbox" value="on" class="m-2">
                                                                        <label for="checkbox2" class="m-0 p-0"> </label>
                                                                    </div>
                                                                </td>
                                                                <td>1</td>
                                                                <td class="text-left">
                                                                    <a href="#" class="btn" data-target="#most_view" data-toggle="modal">현재 가장 많이 보고 있는 상품</a>
                                                                </td>
                                                                <td>가장 많은 회원이 보고 있는 ....</td>
                                                                <td>most_view</td>
                                                                <td class="text-left p-0 m-0">
                                                                    <label class="switch">
                                                                        <input type="checkbox" value="on">
                                                                        <span class="slider m-0"></span>
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>2</td>
                                                                <td>Thornton</td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>3</td>
                                                                <td>
                                                                    <a href="#" class="btn" data-target="#low_stock" data-toggle="modal">마감 임박 상품</a>
                                                                </td>
                                                                <td>Cell</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-2 p-0 m-0">
                                                                <a href="#" class="btn btn-outline-primary m-0 p-1">&nbsp; &nbsp; Up &nbsp; &nbsp;</a>
                                                                <a href="#" class="btn btn-outline-primary align-items-center m-0 p-1">&nbsp; Down &nbsp;</a>
                                                            </div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-5">
                                                                <ul class="">
                                                                    <li>most_view : 현재 가장 많이 보고 있는 상품 타입</li>
                                                                    <li>Two</li>
                                                                    <li>Three</li>
                                                                    <li>One</li>
                                                                    <li>One</li>
                                                                </ul>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal m-0 p-0 w-100" id="most_view">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title border border-dark w-75 bg-info">현재 가장 많이 보고 있는 상품입니다. </h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>×</span>
                </button>
            </div>
            <div class="modal-body my-2 px-1">
                <div class="row p-0 m-0 h-25">
                    <div class="col-md-12 m-0 p-0 h-100">
                        <div class="row m-0 p-0 h-100">
                            <div class="m-0 d-flex align-items-center col-md-5 p-0">
                                <img class="img-fluid d-block flex-column justify-content-center align-items-center align-self-center d-inline-flex mx-auto p-0 img-thumbnail" src="D:/cafe24/이미지 자료/프로젝트/테스트용 이미지/focus-silver-women-s-shoes-399939.jpg"> </div>
                            <div class="col-md-7 m-0 px-1">
                                <div class="row p-0 m-0">
                                    <div class="col-md-12 h-75 p-0 border border-dark m-0">
                                        <p class="lead p-2 bg-info w-100 h-100">코멘트 입력란입니다.
                                            <br> </p>
                                    </div>
                                </div>
                                <div class="row p-0 m-0">
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-self-center">
                                        <img class="img-fluid d-block p-0 m-0" src="eye.png"> </div>
                                    <div class="col-md-3 m-0 p-0 d-flex justify-content-center flex-row align-self-center align-items-center">
                                        <p class="lead m-0 p-0">100
                                            <br> </p>
                                    </div>
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-items-center align-self-center">
                                        <img class="img-fluid d-block" src="cart.jpg"> </div>
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-items-center align-self-center">
                                        <p class="lead m-0 p-0">32
                                            <br> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer m-0 py-2">
                <button type="button" class="btn btn-primary">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<div class="modal m-0 p-0 w-100" id="low_stock">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title border border-dark w-75 bg-info">&nbsp; 마감 임박 상품입니다
                    <br> </h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>×</span>
                </button>
            </div>
            <div class="modal-body my-2 px-1">
                <div class="row p-0 m-0 h-25">
                    <div class="col-md-12 m-0 p-0 h-100">
                        <div class="row m-0 p-0 h-100">
                            <div class="m-0 d-flex align-items-center col-md-5 p-0">
                                <img class="img-fluid d-block flex-column justify-content-center align-items-center align-self-center d-inline-flex mx-auto p-0 img-thumbnail" src="D:/cafe24/이미지 자료/프로젝트/테스트용 이미지/focus-silver-women-s-shoes-399939.jpg"> </div>
                            <div class="col-md-7 m-0 px-1">
                                <div class="row p-0 m-0">
                                    <div class="col-md-12 h-75 p-0 border border-dark m-0">
                                        <p class="lead p-2 bg-info w-100 h-100">코멘트 입력란입니다.
                                            <br> </p>
                                    </div>
                                </div>
                                <div class="row p-0 m-0">
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-self-center">
                                        <img class="img-fluid d-block p-0 m-0" src="eye.png"> </div>
                                    <div class="col-md-3 m-0 p-0 d-flex justify-content-center flex-row align-self-center align-items-center">
                                        <p class="lead m-0 p-0">100
                                            <br> </p>
                                    </div>
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-items-center align-self-center">
                                        <img class="img-fluid d-block" src="cart.jpg"> </div>
                                    <div class="col-md-3 m-0 p-0 d-flex flex-row justify-content-center align-items-center align-self-center">
                                        <p class="lead m-0 p-0">32
                                            <br> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p class="">Paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer m-0 py-2">
                <button type="button" class="btn btn-primary">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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
