import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tupy_framework/errors/network_error.dart';
import 'package:tupy_framework/errors/unauthenticated_error.dart';
import 'package:tupy_framework/localization/localization.dart';
import 'package:tupy_framework/ui.dart';
import 'package:tupy_framework/widget/no_internet/no_internet_widget.dart';
import 'package:tupy_framework/widget/unauthenticated/unauthenticated_widget.dart';

import '../stores/data_store.dart';

class DataPage extends StatefulWidget {
  final DataStore store;

  const DataPage({Key? key, required this.store}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DataStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<DataStore, DataState>(
        store: store,
        builder: (context, triple) {
          if (triple.error is NoConnectionError) {
            return NoInternetWidget(
              onTryAgain: () {
                store.tryAgain();
              },
            );
          }
          if (triple.error is UnauthenticatedError) {
            return UnauthenticatedWidget(
              onTryAgain: () {
                store.tryAgain();
              },
            );
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'titles.data'.translate(),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    ...triple.state.data.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.label,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 11),
                                      child: Row(
                                        children: [
                                          e.hasError
                                              ? Icon(
                                                  Icons.error,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .error,
                                                )
                                              : e.completed
                                                  ? Icon(Icons.check,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary)
                                                  : const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child:
                                                          Text('teste'))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (e.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            e.error!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              store.loadSpecificData(e);
                                            },
                                            icon: const Icon(Icons.refresh))
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            bottomSheet: SafeArea(
              child: BottomAppBar(
                color: Theme.of(context).colorScheme.background,
                shape: const CircularNotchedRectangle(),
                clipBehavior: Clip.antiAlias,
                notchMargin: 5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: getBottomButton(),
                  ),
                ),
              ),
            ),
          );
        });
  }

  getBottomButton() {
    if (store.errorLoadData) {
      return ElevatedButtonWidget(
        onPressed: store.tryOnlyErrorData,
        label: 'labels.try_again'.translate(),
        withPadding: false,
      );
    }
    if (store.completeLoadData) {
      return ElevatedButtonWidget(
        onPressed: store.handleClose,
        label: 'labels.close'.translate(),
        withPadding: false,
      );
    }
    return const SizedBox();
  }
}
