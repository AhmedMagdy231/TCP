import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/date_filed.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/name_input_filed.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/search_input_filed.dart';
import 'package:tricare_patient_application/core/component/DropDownButtonField/drop_down_button_filed.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/widgets/Down%20Button%20Stack/down_button_stack.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
import 'package:tricare_patient_application/feature/Book/cubit/book_cubit.dart';
import 'package:tricare_patient_application/feature/Search/screen/search%20by%20all/search_result.dart';

import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../generated/l10n.dart';
import '../../../Category/model/category_details_model.dart';
import '../../../Doctor/model/doctor_details_model.dart';
import '../../../Home/model/home_model.dart';
import '../../cubit/search_cubit.dart';
import '../../model/doctor_search_model.dart';

class SearchByAllScreen extends StatefulWidget {
  final List<Specialties> specialties;

  SearchByAllScreen({
    required this.specialties,
  });

  @override
  State<SearchByAllScreen> createState() => _SearchByAllScreenState();
}

class _SearchByAllScreenState extends State<SearchByAllScreen> {
  late TextEditingController nameController;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<String> speciality = [];
  List<String> branches = [];
  String specialityId = '';
  String branchId = '';

  checkFirstTime(){
    return nameController.text.isEmpty && _dateController.text.isEmpty && specialityId.isEmpty && branchId.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Column(

        children: [

          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.03),
              child: Column(
                children: [
                  SizedBox(height: height*0.08,),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: height*0.055,
                          child: NameFiled(
                            controller: nameController,
                            padding: 12,
                            //   hint: 'write name of doctor...',

                          ),
                        ),
                      ),
                      SizedBox(width: width*0.02,),
                      Expanded(
                        child:  SizedBox(
                          height: height*0.055,
                          child: DateField(
                            padding: 12,
                            controller: _dateController,
                            onTap: () => _selectDate(context),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                 children: [
                   Expanded(
                     child: SizedBox(
                       height: height*0.055,
                       child: BuildDropDownButtonField(
                         height: height,
                         width: width,
                         hint: S.of(context).speciality,
                         valid: (value) {
                           int index = speciality
                               .indexWhere((element) => element == value);
                           specialityId = widget.specialties[index].sPECIALTYID!;
                         },
                         item: speciality,
                         onChanged: (value) {},
                       ),
                     ),
                   ),
                   SizedBox(width: width*0.02,),
                   Expanded(
                     child: BlocBuilder<BookCubit, BookState>(
                       buildWhen: (previous, current) =>
                       previous.branchState != current.branchState,
                       builder: (context, state) {
                         return context.read<BookCubit>().branchModel == null
                             ? SizedBox(
                           height: height*0.055,
                           child: Center(
                               child: CircularProgressIndicator(color: Colors.white,)),
                         )
                             : SizedBox(
                           height: height*0.055,
                               child: BuildDropDownButtonField(
                                                        height: height,
                                                        width: width,
                                                        hint: S.of(context).branch,
                                                        valid: (value) {
                               int index = context
                                   .read<BookCubit>()
                                   .branchModel!
                                   .data!
                                   .branches
                                   .indexWhere((element) =>
                               element.branchName == value);
                               branchId = context
                                   .read<BookCubit>()
                                   .branchModel!
                                   .data!
                                   .branches[index]
                                   .branchid!;
                                                        },
                                                        item: List.from(context
                                 .read<BookCubit>()
                                 .branchModel!
                                 .data!
                                 .branches
                                 .map((e) => e.branchName)),
                                                        onChanged: (value) {},
                                                      ),
                             );
                       },
                     ),
                   ),
                 ],
                  ),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    height: height*0.05,
                    width: width,
                    child: InkWell(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        pageNumber =1;
                        _pagingController.itemList=[];
                       _pagingController.refresh();
                       _scrollController.animateTo(
                          0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                S.of(context).search,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),

                            SizedBox(width: width*0.02,),
                            Icon(Icons.search),

                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height*0.03,),

                ],
              ),
            ),
          ),

         checkFirstTime()?
         Expanded(child: BuildEmptyDataWidget(text: S.of(context).youCanFindTheDoctorThatYouNeedUsingThe,)) :
         Expanded(
            child: SearchResultScreen(
            pagingController: _pagingController,
            scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: _selectedDate.add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            DateFormat('yyyy-MM-dd', 'en').format(_selectedDate);
      });
  }




  final PagingController<int, Partners> _pagingController = PagingController(firstPageKey: 0);
  int pageNumber = 1;
  late ScrollController _scrollController;


  @override
  void initState() {


    _scrollController = ScrollController();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    speciality = List.from(widget.specialties.map((e) => e.specialtyTitle));
    nameController = TextEditingController();
 //   _dateController.text = DateFormat('yyyy-MM-dd', 'en').format(_selectedDate);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchPage(int pageKey) async {
    await Future.delayed(Duration(seconds: 1));

    try {
      final response =   await DioHelper.postData(
        data: {

          'search_sec' : 1,
          'search_query' : nameController.text,
          'search_specialtyid' : specialityId,
          'search_branchid': branchId,
          'search_slot_date' : _dateController.text,
          'page': pageNumber,

        },
        url: EndPoints.search_doctor_request,
      );


      final SearchDoctorModel searchDoctorModel = SearchDoctorModel.formJson(response.data);

      if (!searchDoctorModel.hasError) {
        final isLastPage = searchDoctorModel.data!.pageCurrent == searchDoctorModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(searchDoctorModel.data!.partners!);
        } else {
          final nextPageKey =
              pageKey + searchDoctorModel.data!.partners!.length;
          pageNumber++;
          _pagingController.appendPage(
              searchDoctorModel.data!.partners!, nextPageKey);
        }
      }
      else
      {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }


}
