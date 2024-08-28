import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/cubit/license_duration_update_cubit.dart';

class LicenseDurationUpdate extends StatelessWidget {
  const LicenseDurationUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lisans Süresi Uzatma"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lisans Bitiş Tarihini Seçin:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            BlocBuilder<LicenseDurationUpdateCubit, LicenseDurationUpdateState>(
              builder: (context, state) {
                String buttonText = "Tarihi Seçin";
                if (state is LicenseDurationUpdateSelected) {
                  buttonText =
                      DateFormat('dd/MM/yyyy').format(state.selectedEndDate);
                }
                return ElevatedButton(
                  onPressed: () => context
                      .read<LicenseDurationUpdateCubit>()
                      .selectEndDate(context),
                  child: Text(buttonText),
                );
              },
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => context
                    .read<LicenseDurationUpdateCubit>()
                    .updateEndDate(context),
                child: Text("Güncelle"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
