<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <c:if test="${fn:contains(menu_section, 'Dashboard')}">
                <li class="<c:if test="${menu == 'dashboard'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/home" data-id="Dashboard" class="activity-log">
                        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        <span class="pull-right-container"></span>
                    </a>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_code, 'angpurReport.transactionDetails')}">
                <li <c:if test="${menu == 'angpurReport.transactionDetails'}">class="active"</c:if>>
                    <a href="${pageContext.request.contextPath}/angpur-report/angpur-transaction-detail"
                       data-id="Report Transaction" class="activity-log">
                        <i class="fa fa-line-chart"></i> Transaction Detail</a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'User Management')}">
                <li class="<c:if test="${menu == 'user.owner'
                || menu == 'user.customer'
                || menu == 'user.subscriber'
                || menu == 'user.owner.airporttransfer'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-users"></i> <span>User Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'user.owner') || fn:contains(menu_code, 'user.owner.airporttransfer')}">
                            <li class="<c:if test="${menu == 'user.owner' || menu == 'user.owner.airporttransfer'}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-user"></i> <span>Owner</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'user.owner')}">
                                        <li <c:if test="${menu == 'user.owner'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/users/owners"
                                               data-id="User Owner" class="activity-log">
                                                <i class="fa fa-user"></i> Car Rent</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'user.owner.airporttransfer')}">
                                        <li <c:if test="${menu == 'user.owner.airporttransfer'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/users/angpur_owners"
                                               data-id="User Owner" class="activity-log">
                                                <i class="fa fa-user"></i> Airport Rent</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'user.customer')}">
                            <li <c:if test="${menu == 'user.customer'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/users/customers" data-id="User Customer"
                                   class="activity-log">
                                    <i class="fa fa-user"></i> Customer</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'user.master_data')}">
                            <li <c:if test="${menu == 'user.master_data'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/users/master_data" data-id="Master Data"
                                   class="activity-log">
                                    <i class="fa fa-user"></i>Master Data</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'user.subscriber')}">
                            <li <c:if test="${menu == 'user.subscriber'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/subscribers/index"
                                   data-id="User Subscribe List" class="activity-log">
                                    <i class="fa fa-bullhorn"></i> Subscribe List</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Fraud Management')}">
                <li class="<c:if test="${menu == 'fraud.management.hold'
                || menu == 'fraud.management.owner'
                || menu == 'fraud.management.suspected'
                || menu == 'fraud.management.transaction'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-user-times"></i> <span>Fraud Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'fraud.management.suspected')}">
                            <li <c:if test="${menu == 'fraud.management.suspected'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/fraud/suspected" data-id="Fraud"
                                   class="activity-log">
                                    <i class="fa fa-money"></i>Suspected Transaction</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'fraud.management.owner')}">
                            <li <c:if test="${menu == 'fraud.management.owner'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/fraud/owner" data-id="Fraud"
                                   class="activity-log">
                                    <i class="fa fa-user-times"></i>Owner Fraud</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'fraud.management.transaction')}">
                            <li <c:if test="${menu == 'fraud.management.transaction'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/fraud/transaction" data-id="Fraud"
                                   class="activity-log">
                                    <i class="fa fa-bug"></i>Fraud Transaction</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'fraud.management.hold')}">
                            <li <c:if test="${menu == 'fraud.management.hold'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/fraud/hold" data-id="Fraud"
                                   class="activity-log">
                                    <i class="fa fa-warning"></i>Hold Payment</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Web Management') || fn:contains(menu_section, 'FAQ Management') || fn:contains(menu_section, 'Static Page Management')}">
                <li class="<c:if test="${menu == 'web.banner'
                || fn:contains(menu, 'web.static.')
                || fn:contains(menu, 'web.faq.')}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i> <span>Web Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'web.banner')}">
                            <li <c:if test="${menu == 'web.banner'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/banners/index" data-id="Banner"
                                   class="activity-log">
                                    <i class="fa fa-picture-o"></i> Banner Management</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_section, 'Static Page Management')}">
                            <li class="<c:if test="${fn:contains(menu, 'web.static.')}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-newspaper-o"></i> <span>Static Page Management</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'web.static.promo')}">
                                        <li <c:if test="${fn:contains(menu, 'web.static.promo')}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/promo/index" data-id="Promo"
                                               class="activity-log">
                                                <i class="fa fa-scissors"></i> Promo</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_section, 'Promo Bus Travel Management')}">
                                        <li class="<c:if test="${menu == 'promobustravel'}">active </c:if>">
                                            <a href="${pageContext.request.contextPath}/promo-bustravel" data-id="Promo Bus Travel"
                                               class="activity-log">
                                                <i class="fa fa-cut"></i> <span>Promo Bus Travel</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_section, 'Airport Transfer Book Now')}">
                                        <li class="<c:if test="${menu == 'airportbooknow'}">active </c:if>">
                                            <a href="${pageContext.request.contextPath}/airport-book-now" data-id="Airport Transfer Book Now"
                                               class="activity-log">
                                                <i class="fa fa-cut"></i> <span>Airport Transfer Book Now</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_section, 'Airport Transfer Policy')}">
                                        <li class="<c:if test="${menu == 'airporttransferpolicy'}">active </c:if>">
                                            <a href="${pageContext.request.contextPath}/airport-transfer-policy" data-id="Airport Transfer Policy"
                                               class="activity-log">
                                                <i class="fa fa-shield"></i> <span>Airport Transfer Policy</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.contactus')}">
                                        <li
                                                <c:if test="${menu == 'web.static.contactus'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/contact-us"
                                               data-id="Contact Us" class="activity-log">
                                                <i class="fa fa-user-md"></i> Contact Us</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.privacypolicy')}">
                                        <li
                                                <c:if test="${menu == 'web.static.privacypolicy'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/privacy-policy"
                                               data-id="Privacy Policy" class="activity-log">
                                                <i class="fa fa-shield"></i> Privacy Policy</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.termcondition')}">
                                        <li <c:if test="${menu == 'web.static.termcondition'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/term-condition"
                                               data-id="Term and Condition" class="activity-log">
                                                <i class="fa fa-exclamation-triangle"></i> Terms & Conditions</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'detailtnc')}">
                                        <li
                                                <c:if test="${menu == 'detailtnc'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/detailtnc"
                                               data-id="Detail Term & Condition" class="activity-log">
                                                <i class="fa fa-exclamation-triangle"></i> Detail Terms & Conditions</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'accountdeletion')}">
                                        <li
                                                <c:if test="${menu == 'accountdeletion'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/accountDeletion"
                                               data-id="Account Deletion" class="activity-log">
                                                <i class="fa fa-shield"></i> T&C Account Deletion</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'protectioncoverage')}">
                                        <li
                                                <c:if test="${menu == 'protectioncoverage'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/protectionCoverage"
                                               data-id="Protection Coverage" class="activity-log">
                                                <i class="fa fa-shield"></i> Protection Coverage</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.carasewa')}">
                                        <li
                                                <c:if test="${menu == 'web.static.carasewa'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/cara-sewa"
                                               data-id="Cara Sewa" class="activity-log">
                                                <i class="fa fa-book"></i> Cara Sewa</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.tentangmovic')}">
                                        <li
                                                <c:if test="${menu == 'web.static.tentangmovic'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/tentang-movic"
                                               data-id="Tentang Movic" class="activity-log">
                                                <i class="fa fa-trademark"></i> Tentang Movic</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.carapendaftaran')}">
                                        <li
                                                <c:if test="${menu == 'web.static.carapendaftaran'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/cara-pendaftaran"
                                               data-id="Cara Pendaftaran" class="activity-log">
                                                <i class="fa fa-registered"></i> Cara Pendaftaran</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.metodepembayaran')}">
                                        <li
                                                <c:if test="${menu == 'web.static.metodepembayaran'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/metode-pembayaran"
                                               data-id="Metode Pembayaran" class="activity-log">
                                                <i class="fa fa-cc-visa"></i> Metode Pembayaran</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.tipssewa')}">
                                        <li
                                                <c:if test="${menu == 'web.static.tipssewa'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/tips-sewa"
                                               data-id="Tips Sewa" class="activity-log">
                                                <i class="fa fa-key"></i> Tips Sewa</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.jaminanpenyewa')}">
                                        <li
                                                <c:if test="${menu == 'web.static.jaminanpenyewa'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/jaminan-penyewa"
                                               data-id="Jaminan Penyewa" class="activity-log">
                                                <i class="fa fa-user"></i> Jaminan Penyewa</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.caramenyewakan')}">
                                        <li
                                                <c:if test="${menu == 'web.static.caramenyewakan'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/cara-menyewakan"
                                               data-id="Cara Menyewakan" class="activity-log">
                                                <i class="fa fa-book"></i> Cara Menyewakan</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.keuntunganmenyewakan')}">
                                        <li
                                                <c:if test="${menu == 'web.static.keuntunganmenyewakan'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/keuntungan-menyewakan"
                                               data-id="Keuntungan Menyewakan" class="activity-log">
                                                <i class="fa fa-user"></i> Keuntungan Menyewakan</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.tipsmenyewakan')}">
                                        <li
                                                <c:if test="${menu == 'web.static.tipsmenyewakan'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/tips-menyewakan"
                                               data-id="Tips Menyewakan" class="activity-log">
                                                <i class="fa fa-key"></i> Tips Menyewakan</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.termconditiondeposit')}">
                                        <li
                                                <c:if test="${menu == 'web.static.termconditiondeposit'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/term-condition-deposit"
                                               data-id="Term & Condition Deposit" class="activity-log">
                                                <i class="fa fa-money"></i> Term & Condition Deposit</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.termconditionreferral')}">
                                        <li
                                                <c:if test="${menu == 'web.static.termconditionreferral'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/term-condition-referral"
                                               data-id="Term & Condition Referral" class="activity-log">
                                                <i class="fa fa-money"></i> Term & Condition Referral</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.termconditionowner')}">
                                        <li
                                                <c:if test="${menu == 'web.static.termconditionowner'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/term-condition-owner"
                                               data-id="Term & Condition Owner" class="activity-log">
                                                <i class="fa fa-money"></i> Term & Condition Owner</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.airportcarapenjemputan')}">
                                        <li
                                                <c:if test="${menu == 'web.static.airportcarapenjemputan'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/static-page/set/airport-cara-penjemputan"
                                               data-id="Airport Cara Penjemputan" class="activity-log">
                                                <i class="fa fa-book"></i> Airport Cara Penjemputan</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.static.bypassphone')}">
                                        <li
                                                <c:if test="${menu == 'web.static.bypassphone'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/bypass-phone"
                                               data-id="Bypass Phone" class="activity-log">
                                                <i class="fa fa-key"></i> Bypass Phone</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_section, 'FAQ Management')}">
                            <li class="<c:if test="${fn:contains(menu, 'web.faq.')}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-question-circle"></i> <span>FAQ Management</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'web.faq.category')}">
                                        <li <c:if test="${menu == 'web.faq.category'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/faq/category/index"
                                               data-id="FAQ Category" class="activity-log">
                                                <i class="fa fa-th-large"></i> Category</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.faq.subcategory')}">
                                        <li <c:if test="${menu == 'web.faq.subcategory'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/faq/subcategory/index"
                                               data-id="FAQ Sub Category" class="activity-log">
                                                <i class="fa fa-th-large"></i> Sub Category</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.faq.topic')}">
                                        <li <c:if test="${menu == 'web.faq.topic'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/faq/topic/index"
                                               data-id="FAQ Topic" class="activity-log">
                                                <i class="fa fa-th-large"></i> Topic</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'web.faq.subtopic')}">
                                        <li <c:if test="${menu == 'web.faq.subtopic'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/faq/subtopic/index"
                                               data-id="FAQ Sub Topic" class="activity-log">
                                                <i class="fa fa-file-text"></i> Sub Topic</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Car Rental Management')}">
                <li class="<c:if test="${menu == 'carrentalmanagement'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/car-rental/management" data-id="carrentalmanagement"
                       class="activity-log">
                        <i class="fa fa-car"></i> <span>Car Rental Management</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Popular Management')}">
                <li class="<c:if test="${menu == 'popular.destination' || menu == 'popular.rental'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-star"></i> <span>Popular Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'popular.destination')}">
                            <li <c:if test="${menu == 'popular.destination'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/popular/destination/index"
                                   data-id="Popular Destination" class="activity-log">
                                    <i class="fa fa-map-marker"></i> Popular Destination</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'popular.rental')}">
                            <li <c:if test="${menu == 'popular.rental'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/popular/rental/index"
                                   data-id="Popular Car Rental" class="activity-log">
                                    <i class="fa fa-car"></i> Popular Car Rental</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Car Management') || fn:contains(menu_section, 'Facility Management') }">
                <li class="<c:if test="${menu == 'car.brand'
                || menu == 'car.color'
                || menu == 'car.category'
                || menu == 'car.model'
                || menu == 'car.brandmodel'
                || menu == 'car.facility.movic'
                || menu == 'car.facility.owner'
                || menu == 'car.list'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-car"></i> <span>Car Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_section, 'Car Management')}">
                            <li class="<c:if test="${menu == 'car.brand' || menu == 'car.category' || menu == 'car.model' || menu == 'car.brandmodel' || menu == 'car.color'}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-car"></i> <span>Car Management</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'car.brand')}">
                                        <li <c:if test="${menu == 'car.brand'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/brands/index" data-id="Brand"
                                               class="activity-log">
                                                <i class="fa fa-bold"></i> Brand</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'car.category')}">
                                        <li <c:if test="${menu == 'car.category'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/categories/index"
                                               data-id="Category" class="activity-log">
                                                <i class="fa fa-tags"></i> Category</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'car.brandmodel')}">
                                        <li <c:if test="${menu == 'car.brandmodel'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/brandmodels/index" data-id="Sub Model"
                                               class="activity-log">
                                                <i class="fa fa-sticky-note"></i> Brand Model</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'car.model')}">
                                        <li <c:if test="${menu == 'car.model'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/models/index" data-id="Model"
                                               class="activity-log">
                                                <i class="fa fa-sticky-note"></i> Variant</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'car.color')}">
                                        <li <c:if test="${menu == 'car.color'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/colors/index" data-id="Color"
                                               class="activity-log">
                                                <i class="fa fa-sticky-note"></i> Color</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'car.list')}">
                            <li <c:if test="${menu == 'car.list'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/car-rental/index" data-id="User Customer"
                                   class="activity-log">
                                    <i class="fa fa-car"></i> Car List Car Rental</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_section, 'Facility Management') }">
                            <li class="<c:if test="${menu == 'car.facility.movic' || menu == 'car.facility.owner'}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-sliders"></i> <span>Facility Management</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'car.facility.owner')}">
                                        <li
                                                <c:if test="${menu == 'car.facility.owner'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/facility/owner/index"
                                               data-id="Facility Owner" class="activity-log">
                                                <i class="fa fa-user"></i> Owner</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'car.facility.movic')}">
                                        <li
                                                <c:if test="${menu == 'car.facility.movic'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/facility/movic/index"
                                               data-id="Facility Movic" class="activity-log">
                                                <i class="fa fa-maxcdn"></i> Movic</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Voucher Management')}">
                <li class="<c:if test="${menu == 'voucher' || menu == 'voucher.b2b' || menu == 'voucher.refund'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-cut"></i> <span>Voucher Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'voucher')}">
                            <li <c:if test="${menu=='voucher'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/voucher/index" data-id="Voucher"
                                   class="activity-log">
                                    <i class="fa fa-cut"></i> <span>Voucher</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'voucher')}">
                            <li <c:if test="${menu == 'voucher.b2b'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/voucher/index/b2b" data-id="Voucher"
                                   class="activity-log">
                                    <i class="fa fa-cut"></i> <span>Voucher B2B</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'voucher.refund')}">
                            <li <c:if test="${fn:contains(menu, 'voucher.refund')}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/voucher-refund/index" data-id="Voucher"
                                   class="activity-log">
                                    <i class="fa fa-cut"></i> <span>Voucher Refund</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Holiday Management')}">
                <li class="<c:if test="${menu == 'holiday'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/holiday-management/index" data-id="holiday"
                       class="activity-log">
                        <i class="fa fa-calendar"></i> <span>Holiday Management</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Review Management')}">
                <li class="<c:if test="${menu == 'review'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/review-category/index" data-id="Review"
                       class="activity-log">
                        <i class="fa fa-check-square"></i> <span>Review Management</span>
                    </a>
                </li>
            </c:if>



            <c:if test="${fn:contains(menu_section, 'Push Notif Management')}">
                <li class="<c:if test="${menu == 'pushnotif'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/push-notif/index" data-id="Push Notif"
                       class="activity-log">
                        <i class="fa fa-envelope"></i> <span>Push Notif Management</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Price Management B2B')}">
                <li class="<c:if test="${menu == 'pricemanagementb2b'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/price-config/index" data-id="pricemanagementb2b" class="activity-log">
                        <i class="fa fa-file-text-o"></i> <span>Price Management B2B</span>
                    </a>
                </li>
            </c:if>  

            <c:if test="${fn:contains(menu_section, 'Pop-Up Management')}">
                <li class="<c:if test="${menu == 'popup'}">active </c:if>">
                    <a href="${pageContext.request.contextPath}/pop-up/index" data-id="Pop-Up" class="activity-log">
                        <i class="fa fa-envelope"></i> <span>Pop-Up Management</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Report')}">
                <li class="<c:if test="${fn:contains(menu, 'report')}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-file-text-o"></i> <span>Report</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'report.finance') || fn:contains(menu_code, 'report.historyfinance') || fn:contains(menu_code, 'report.incentive')}">
                            <li class="<c:if test="${menu == 'report.finance' || menu == 'report.historyfinance' || menu == 'report.incentive'}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-file-text-o"></i> <span>Finance</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'report.finance')}">
                                        <li <c:if test="${menu == 'report.finance'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/report/finance">
                                                <i class="fa fa-dollar"></i> Finance</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'report.historyfinance')}">
                                        <li
                                                <c:if test="${menu == 'report.historyfinance'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/report/history-finance">
                                                <i class="fa fa-history"></i> History Finance</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'report.incentive')}">
                                        <li <c:if test="${menu == 'report.incentive'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/report/incentive">
                                                <i class="fa fa-dollar"></i> <span>Incentive</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.espayTransaction')}">
                            <li <c:if test="${menu == 'report.espayTransaction'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/espay-transaction"
                                   data-id="Report Espay EDC Transaction" class="activity-log">
                                    <i class="fa fa-line-chart"></i> Espay EDC Transaction</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.transaction')}">
                            <li <c:if test="${menu == 'report.transaction'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/transaction"
                                   data-id="Report Transaction" class="activity-log">
                                    <i class="fa fa-line-chart"></i> Transaction</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.reject.history')}">
                            <li <c:if test="${menu == 'report.reject.history'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/reject-history"
                                   data-id="Report Reject History" class="activity-log">
                                    <i class="fa fa-close"></i> Reject History</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.refund.transaction')}">
                            <li <c:if test="${fn:contains(menu, 'report.refund.transaction')}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/refund-transaction"
                                   class="activity-log">
                                    <i class="fa fa-line-chart"></i> Refund as Voucher Transaction</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.insurance.free') || fn:contains(menu_code, 'report.insurance.addon') }">
                            <li class="<c:if test="${menu == 'report.insurance.free' || menu == 'report.insurance.addon'}">active </c:if>treeview">
                                <a href="#">
                                    <i class="fa fa-file-text-o"></i> <span>Insurance</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <c:if test="${fn:contains(menu_code, 'report.insurance.free')}">
                                        <li <c:if test="${menu == 'report.insurance.free'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/insurance/free">
                                                <i class="fa fa-dollar"></i> Insurance Free</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${fn:contains(menu_code, 'report.insurance.addon')}">
                                        <li
                                                <c:if test="${menu == 'report.insurance.addon'}">class="active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/insurance/add-on">
                                                <i class="fa fa-dollar"></i> Insurance Add On</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.commission')}">
                            <li <c:if test="${menu == 'report.commission'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/commision-fee"
                                   data-id="Report Commision Fee" class="activity-log">
                                    <i class="fa fa-usd"></i> <span>Commision Fee</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.audit')}">
                            <li <c:if test="${menu == 'report.audit'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/report/audit" data-id="Report Audit Trail"
                                   class="activity-log">
                                    <i class="fa fa-search-minus"></i> <span>Audit Trail</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'report.voucher')}">
                            <li class="treeview <c:if test="${menu == 'report.voucherpromo' || menu == 'report.voucherregistration' || menu == 'report.voucherreferral'}">active</c:if>">
                                <a href="#">
                                    <i class="fa fa-file-text-o"></i> <span>Redeem Voucher</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li <c:if test="${fn:contains(menu, 'report.voucherpromo')}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/promo">
                                            <i class="fa fa-cut"></i> Promo</a>
                                    </li>
                                    <li
                                            <c:if test="${menu == 'report.voucherregistration'}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/voucher-registration">
                                            <i class="fa fa-registered"></i> <span>Registration</span>
                                        </a>
                                    </li>
                                    <li
                                            <c:if test="${menu == 'report.voucherreferral'}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/voucher-referral">
                                            <i class="fa fa-retweet"></i> <span>Referral</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Angpur Report')}">
                <li class="<c:if test="${fn:contains(menu, 'angpurReport')}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-file-text-o"></i> <span>Angpur Report</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'angpurReport.transaction')}">
                            <li <c:if test="${menu == 'angpurReport.transaction'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/angpur-report/transaction"
                                   data-id="Report Transaction" class="activity-log">
                                    <i class="fa fa-line-chart"></i> Transaction</a>
                            </li>
                        </c:if>

                        <c:if test="${fn:contains(menu_code, 'angpurReport.audit')}">
                            <li <c:if test="${menu == 'angpurReport.audit'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/angpur-report/audit"
                                   data-id="Report Audit Trail" class="activity-log">
                                    <i class="fa fa-search-minus"></i> <span>Audit Trail</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'angpurReport.commission')}">
                            <li <c:if test="${menu == 'angpurReport.commission'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/angpur-report/commision-fee"
                                   data-id="Report Commision Fee" class="activity-log">
                                    <i class="fa fa-usd"></i> <span>Commision Fee</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'angpurReport.voucher')}">
                            <li class="treeview <c:if test="${menu == 'angpurReport.voucherpromo' || menu == 'angpurReport.voucherregistration' || menu == 'angpurReport.voucherreferral'}">active</c:if>">
                                <a href="#">
                                    <i class="fa fa-file-text-o"></i> <span>Redeem Voucher</span>
                                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                <small class="label pull-right bg-red"></small>
                            </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li
                                            <c:if test="${menu == 'angpurReport.voucherpromo'}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/promo">
                                            <i class="fa fa-cut"></i> Promo</a>
                                    </li>
                                    <li
                                            <c:if test="${menu == 'angpurReport.voucherregistration'}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/voucher-registration">
                                            <i class="fa fa-registered"></i> <span>Registration</span>
                                        </a>
                                    </li>
                                    <li
                                            <c:if test="${menu == 'angpurReport.voucherreferral'}">class="active"</c:if>>
                                        <a href="${pageContext.request.contextPath}/redeem/voucher-referral">
                                            <i class="fa fa-retweet"></i> <span>Referral</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Bus Travel Report')}">
                <li class="<c:if test="${fn:contains(menu, 'busTravelReport')}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-file-text-o"></i> <span>Bus Travel Report</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'busTravelReport.finance')}">
                            <li <c:if test="${menu == 'busTravelReport.finance'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/bus-travel-report/finance">
                                    <i class="fa fa-dollar"></i> Finance</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'busTravelReport.transaction')}">
                            <li <c:if test="${menu == 'busTravelReport.transaction'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/bus-travel-report/transaction"
                                   data-id="Report Transaction" class="activity-log">
                                    <i class="fa fa-line-chart"></i> Transaction</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Bank Management')}">
                <li class="<c:if test="${menu == 'bank.account' || fn:contains(menu_section, 'bank.payment')}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-bank"></i> <span>Bank Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'bank.account')}">
                            <li <c:if test="${menu == 'bank.account'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/bank/index" data-id="Bank Account"
                                   class="activity-log">
                                    <i class="fa fa-bank"></i> Bank Account</a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'bank.payment')}">
                            <li <c:if test="${menu == 'bank.payment'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/payment/methods/index"
                                   data-id="Payment Methods" class="activity-log">
                                    <i class="fa fa-usd"></i> Payment Methods</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${fn:contains(menu_section, 'Airline Management')}">
                <li class="<c:if test="${menu == 'airline'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/airline/index" data-id="Airline" class="activity-log">
                        <i class="fa fa-plane"></i> <span>Airline Management</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'Airport Management')}">
                <li class="<c:if test="${menu == 'airport'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/airport/index" data-id="Airport" class="activity-log">
                        <i class="fa fa-plane"></i> <span>Airport Management</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'Angpur Zone Coverage')}">
                <li class="<c:if test="${menu == 'angpur.zone.coverage'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/angpur_zone_coverage/index" data-id="AngpurZoneCoverage"
                       class="activity-log">
                        <i class="fa fa-map-marker"></i> <span>Angpur Zone Coverage</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'Special Price Airport')}">
                <li class="<c:if test="${menu == 'special.price.airport'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/special_price_airport/index"
                       data-id="special.price.airport" class="activity-log">
                        <i class="fa fa-map-marker"></i> <span>Special Price Airport</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'City Management')}">
                <li class="<c:if test="${menu == 'city' || menu == 'city.zona'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-map-marker"></i> <span>City Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'city')}">
                            <li <c:if test="${menu=='city'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/city/index" data-id="City"
                                   class="activity-log">
                                    <i class="fa fa-map-marker"></i> <span>City</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'city.zona')}">
                            <li <c:if test="${menu == 'city.zona'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/city-zone/index" data-id="City"
                                   class="activity-log">
                                    <i class="fa fa-map-marker"></i> <span>City Zona</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'Email CC Management')}">
                <li class="<c:if test="${menu == 'emailcc'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/emailcc/index" data-id="EmailCC" class="activity-log">
                        <i class="fa fa-envelope"></i> <span>Email CC Management</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${fn:contains(menu_section, 'Config VM')}">
                <li class="<c:if test="${menu == 'configVM'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/config-vm/index" data-id="configVM" class="activity-log">
                        <i class="fa fa-cog"></i> <span>Config VM</span>
                    </a>
                </li>
            </c:if>  
            <c:if test="${fn:contains(menu_section,  'User Management VM')}">
                <li class="<c:if test="${menu == 'userManagementVM'}">active </c:if>treeview">
                    <a href="${pageContext.request.contextPath}/user-management-vm/index" data-id="userManagementVM" class="activity-log">
                        <i class="fa fa-cog"></i> <span>User Management VM</span>
                    </a>
                </li>
            </c:if>  
            <c:if test="${fn:contains(menu_section, 'Access Management')}">
                <li class="<c:if test="${menu == 'access.user' || menu == 'access.role' || menu == 'access.userb2b'}">active </c:if>treeview">
                    <a href="#">
                        <i class="fa fa-key"></i> <span>Access Management</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        <small class="label pull-right bg-red"></small>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:if test="${fn:contains(menu_code, 'access.user')}">
                            <li <c:if test="${menu == 'access.user'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/usercms/index" data-id="User CMS"
                                   class="activity-log">
                                    <i class="fa fa-user"></i> <span>User Management</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'access.userb2b')}">
                            <li <c:if test="${menu == 'access.userb2b'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/userb2b/index" data-id="User CMS B2B"
                                   class="activity-log">
                                    <i class="fa fa-user"></i> <span>User B2B Management</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(menu_code, 'access.role')}">
                            <li <c:if test="${menu == 'access.role'}">class="active"</c:if>>
                                <a href="${pageContext.request.contextPath}/role/index" data-id="Role"
                                   class="activity-log">
                                    <i class="fa fa-expeditedssl"></i> <span>Role Management</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>  
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

<script type="text/javascript">
    'use strict';
    $(document).ready(function () {
        $('.activity-log').on('click', function () {
            $.ajax({
                url: "/activity/access",
                type: 'POST',
                data: {'menu-id': $(this).attr('data-id')},
                beforeSend: function () {
                },
                error: function (data) {
                },
                success: function (resp) {
                },
                complete: function (xhr) {
                }
            });
        })
    });
</script>
