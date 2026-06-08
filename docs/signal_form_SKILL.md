---
name: signal-form
description: A reactive, schema-based, and signal-like form validation and widget management library for Flutter.
---

# Signal Form - AI System Instructions & Skill

`signal_form` is a reactive, declarative, schema-based form management library for Flutter. It uses a signal-like reactivity model, capturing fields dynamically within a form context, validating asynchronously with debouncing, and offering rich extensions and widgets.

---

## 1. Core Architecture & Lifecycle

### Declarative Form Setup
Forms are created using the `formCtrl` builder. Every `Field<T>` instantiated inside the builder is automatically tracked and captured by the returning `FormController<T>`.

```dart
final form = formCtrl(() => (
  username: Field<String>('username', 'initial_value')
      .required(message: 'Username is required')
      .minLength(3, message: 'Too short'),
  email: Field<String>('email')
      .required(message: 'Email is required')
      .email(message: 'Invalid email'),
));
```

### FormController State
- `fields`: Direct, typed reference to the object returned by the builder.
- `valid`: `true` if the form has no validation errors.
- `errors`: A read-only `Map<String, String>` mapping dot-notation field paths to their active error messages.
- `isDirty`: `true` if any field's value differs from its `initialValue`.
- `isTouched`: `true` if any field in the form has been touched (user focused/blurred/interacted).
- `isValidating`: `true` if any async validator is currently running.
- `isSubmitting`: `true` if the `submit` operation is currently executing its callback.

### Field State
- `value`: The typed value of the field. Writing to `value` triggers the validation and listener lifecycle.
- `error`: Active validation error string, or `null`.
- `isTouched`: `true` if the field has been interacted with.
- `isDirty`: `true` if the value differs from `initialValue`.
- `isLoading`: `true` if the field is running async validation.
- `exposedRules`: Lists individual validator rules marked with `exposed: true` along with their current validity state (e.g. for dynamic checklist UIs).

### Validation Modes & Performance
Fields support configuration for when automatic validation runs:
- `ValidationMode.onChange` (Default): Validates on every keypress/value assignment. Can be debounced using `field.debounce(duration)`.
- `ValidationMode.onBlur`: Validates only after the field loses focus for the first time.
- `ValidationMode.onSubmit`: Validates only during form submission.

### Form Lifecycle & Global Reactivity
- **Memory Management (Dispose)**: The `FormController` and all its captured fields retain active listeners. You **MUST** call `form.dispose()` inside the `dispose()` method of your `StatefulWidget` to release resources and avoid memory leaks.
- **Global Reactivity**: `FormController` extends `ChangeNotifier`, implementing the `Listenable` interface. When you need to react to global changes (e.g., disabling a submit button if `form.valid` is `false`, checking if the form is dirty with `form.isDirty`, or displaying a loading spinner with `form.isSubmitting`), wrap the target widgets in a `ListenableBuilder` and pass the `form` controller as the `listenable`.

```dart
ListenableBuilder(
  listenable: form,
  builder: (context, _) {
    return ElevatedButton(
      onPressed: form.valid && !form.isSubmitting
          ? () => form.submit((ctrl) => save(ctrl.toJson()))
          : null,
      child: form.isSubmitting
          ? const CircularProgressIndicator()
          : const Text('Submit'),
    );
  },
)
```

---

## 2. Built-in Validators (Extensions)

All built-in validators return `this` to allow fluent method chaining on `Field`.

### String Validators (`Field<String>`)
- `.required({String message, bool exposed})`: Checks that the value is not null, empty, or whitespace.
- `.notEmpty({String message, bool exposed})`: Checks that trimmed value is not empty (trims value first).
- `.isEmpty({String message, bool exposed})`: Checks that value is empty or null.
- `.minLength(int min, {String message, bool exposed})`
- `.maxLength(int max, {String message, bool exposed})`
- `.length(int count, {String message, bool exposed})`
- `.email({String message, bool exposed})`
- `.validUrl({String message, bool exposed})`: Checks if string is a valid URL format.
- `.httpUrl({String message, bool exposed})`: Checks if string is a valid HTTP/HTTPS URL.
- `.hostname({String message, bool exposed})`: Checks if string is a valid hostname.
- `.pattern(Pattern pattern, {String message, bool exposed})`: Matches a `Pattern` or `RegExp`.
- `.matchesPattern(Pattern pattern, {String message, bool exposed})`: Matches a `Pattern` or `RegExp`.
- `.alphanumeric({String message, bool exposed})`
- `.numeric({String message, bool exposed})`
- `.contains(String substring, {String message, bool exposed})`
- `.startsWith(String prefix, {String message, bool exposed})`
- `.endsWith(String suffix, {String message, bool exposed})`
- `.mustHaveLowercase({String message, bool exposed})`: Requires at least one lowercase character.
- `.mustHaveUppercase({String message, bool exposed})`: Requires at least one uppercase character.
- `.mustHaveNumber({String message, bool exposed})`: Requires at least one digit.
- `.mustHaveNumbers({String message, bool exposed})`: Requires at least one digit.
- `.mustHaveSpecialChar({String message, bool exposed})`: Requires at least one special character.
- `.mustHaveSpecialCharacter({String message, bool exposed})`: Requires at least one special character.
- `.matches(String value, {String message, bool exposed})`: Checks if string is identical to value.
- `.equals(Field<String> Function(ValueOf valueOf) getOtherField, {String message, bool exposed})`: Compares value with another field's value.
- `.validCPF({String message})`: Validates a Brazilian CPF using standard digit verification.
- `.validCNPJ({String message})`: Validates a Brazilian CNPJ using standard digit verification.
- `.validCEP({String message})`: Validates a Brazilian ZIP code (CEP).
- `.validCPFOrCNPJ({String message})`: Validates whether the value is a valid CPF or CNPJ.
- `.validCreditCard({String message})`: Validates credit card number via Luhn's algorithm.
- `.validPhoneBR({String message})`: Validates a Brazilian phone number (with/without DDD).
- `.validPhoneWithCountryCodeBR({String message})`: Validates a Brazilian phone number containing "+55" country code prefix.
- `.hasNoSequentialRepeatedCharacters(int maxRepeats, {String message, bool exposed})`: Fails on character repetitions (e.g., "aaa").
- `.hasNoSequentialCharacters(int maxLength, {String message, bool exposed})`: Fails on alphanumeric sequences (e.g., "123", "abc").
- `.uuid({String message, bool exposed})`: Validates any version of UUID.
- `.uuidv4({String message, bool exposed})`
- `.uuidv6({String message, bool exposed})`
- `.uuidv7({String message, bool exposed})`
- `.guid({String message, bool exposed})`
- `.cuid({String message, bool exposed})`
- `.cuid2({String message, bool exposed})`
- `.nanoid({int length, String message, bool exposed})`
- `.ulid({String message, bool exposed})`
- `.date({String message, bool exposed})`: Validates standard YYYY-MM-DD date.
- `.time({String message, bool exposed})`: Validates standard HH:MM time.
- `.datetime({String message, bool exposed})`
- `.isoDate({String message, bool exposed})`
- `.isoTime({String message, bool exposed})`
- `.isoDatetime({String message, bool exposed})`
- `.isoDuration({String message, bool exposed})`
- `.ipv4({String message, bool exposed})`
- `.ipv6({String message, bool exposed})`
- `.mac({String message, bool exposed})`: Validates MAC addresses.
- `.cidrv4({String message, bool exposed})`
- `.cidrv6({String message, bool exposed})`
- `.base64({String message, bool exposed})`
- `.base64url({String message, bool exposed})`
- `.hex({String message, bool exposed})`
- `.jwt({String message, bool exposed})`
- `.emoji({String message, bool exposed})`
- `.hash(String algorithm, {String message, bool exposed})`: Validates string matching a cryptographic hash format (e.g. MD5, SHA-256).
- `.uppercase({String message, bool exposed})`
- `.lowercase({String message, bool exposed})`
- `.maskCPFOrCNPJ({bool removeMaskOnJson})`: Auto-formats and masks input to a CPF or CNPJ format dynamically.
- `.oneOf(List<String> values, {String message, bool exposed})`: Ensures value is in list of allowed items.
- `.when(bool Function(String?) condition, void Function(Field<String>) builder)`: Conditionally applies validation rules to the string field.

### Numeric Validators (`Field<num>`, `Field<int>`, `Field<double>`)
- `.required({String message, bool exposed})`
- `.min(value, {String message, bool exposed})`: Lower bound (inclusive).
- `.max(value, {String message, bool exposed})`: Upper bound (inclusive).
- `.range(min, max, {String message, bool exposed})`: Bounds range (inclusive).
- `.positive({String message, bool exposed})`: Value must be > 0.
- `.negative({String message, bool exposed})`: Value must be < 0.
- `.nonZero({String message, bool exposed})`: Value must not be 0.
- `.greaterThan(limit, {String message, bool exposed})`: Value must be > limit.
- `.lessThan(limit, {String message, bool exposed})`: Value must be < limit.
- `.nonnegative({String message, bool exposed})`: Value must be >= 0.
- `.multipleOf(factor, {String message, bool exposed})`
- `.step(stepValue, {String message, bool exposed})`: Value must be a multiple of `stepValue`.
- `.even({String message, bool exposed})`: Value must be an even integer (available on `Field<int>`).
- `.odd({String message, bool exposed})`: Value must be an odd integer (available on `Field<int>`).

### DateTime Validators (`Field<DateTime>`)
- `.required({String message, bool exposed})`
- `.after(DateTime? Function(ValueOf) getOtherDate, {String message, bool exposed})`
- `.afterDate(DateTime date, {String message, bool exposed})`
- `.before(DateTime? Function(ValueOf) getOtherDate, {String message, bool exposed})`
- `.beforeDate(DateTime date, {String message, bool exposed})`
- `.inPast({String message, bool exposed})`
- `.inFuture({String message, bool exposed})`
- `.between(DateTime start, DateTime end, {String message, bool exposed})`
- `.greaterThanOrEqualTo(DateTime date, {String message, bool exposed})`
- `.greaterThan(DateTime date, {String message, bool exposed})`
- `.lessThanOrEqualTo(DateTime date, {String message, bool exposed})`
- `.lessThan(DateTime date, {String message, bool exposed})`
- `.inclusiveBetween(DateTime start, DateTime end, {String message, bool exposed})`
- `.exclusiveBetween(DateTime start, DateTime end, {String message, bool exposed})`

### DateTimeRange Validators (`Field<DateTimeRange>`)
- `.required({String message, bool exposed})`
- `.minDuration(Duration duration, {String message, bool exposed})`
- `.maxDuration(Duration duration, {String message, bool exposed})`
- `.startsAfter(DateTime date, {String message, bool exposed})`
- `.startsBefore(DateTime date, {String message, bool exposed})`
- `.endsAfter(DateTime date, {String message, bool exposed})`
- `.endsBefore(DateTime date, {String message, bool exposed})`

### Boolean Validators (`Field<bool>`)
- `.required({String message, bool exposed})`
- `.mustBeTrue({String message, bool exposed})`
- `.mustBeFalse({String message, bool exposed})`

### List/Iterable Validators (`Field<List<T>>`)
- `.required({String message, bool exposed})`
- `.minItems(int count, {String message, bool exposed})`
- `.maxItems(int count, {String message, bool exposed})`
- `.itemCount(int count, {String message, bool exposed})`
- `.contains(T item, {String message, bool exposed})`
- **List Mutations**:
  - `.addItem(item)`
  - `.removeItem(item)`
  - `.removeAt(index)`
  - `.clear()`

### Generic Validators (`Field<T>`)
- `.must(bool Function(T?) isValid, {String message, bool exposed})`
- `.mustWith(bool Function(T?, ValueOf) isValid, {String message, bool exposed})`
- `.equalTo(T value, {String message, bool exposed})`
- `.isNull({String message, bool exposed})`
- `.isNotNull({String message, bool exposed})`

---

## 3. Conditional, Cross-Field & Nested Validation

### ValueOf Signature & Paths
- **Signature**: The `ValueOf` parameter is a generic typedef function:
  `typedef ValueOf = Field<T> Function<T>(String path);`
  It returns the actual **`Field<T>`** instance, *not* its raw value. Therefore, you must access `.value` (e.g., `valueOf<bool>('hasDiscount').value == true`) to read the current value. You can also inspect other field states, such as `valueOf<T>('path').error` or `valueOf<T>('path').isDirty`.
- **Nested Fields in formGroup**: When resolving a nested field using `valueOf` (or `getField` / `tryGetField`), use the **full dot-notation path** (e.g., `'personal.name'`). If a field is placed inside nested `formGroup` scopes, join all scope names with dots, preceding the field's local name.

### Conditional Validation (`applyWhen`)
Validators can be conditionally skipped depending on the state of other fields in the form.

```dart
final form = formCtrl(() => (
  hasCoupon: Field<bool>('hasCoupon', false),
  couponCode: Field<String>('couponCode')
      .applyWhen(
        (valueOf) => valueOf<bool>('hasCoupon').value == true,
        (f) => f.required(message: 'Coupon code is required'),
      ),
));
```

### Dynamic Sibling Validation
Use `.mustWith` to perform complex checks across sibling fields.

> [!TIP]
> For password confirmation (or any other string equality comparison), **prefer using the built-in `.equals()` validator** instead of writing a custom `.mustWith()`:
> ```dart
> final confirmPassword = Field<String>('confirmPassword')
>   ..equals(
>     (valueOf) => valueOf<String>('password'),
>     message: 'As senhas não coincidem',
>   );
> ```

### Iterables Validation (`applyEach`)
Validate each item within a list field:
```dart
final tags = Field<List<String>>('tags')
  ..applyEach<String>(
    (itemField) => itemField.minLength(3, message: 'Tag is too short'),
    formatError: (index, error) => 'Tag #$index: $error',
  );
```

### Nested Group Serialization (`formGroup`)
Prefix fields inside namespaces to organize structure and create nested JSON structures.
```dart
final form = formCtrl(() => (
  personal: formGroup('personal', () => (
    name: Field<String>('name'),
    age: Field<int>('age'),
  )),
));
// form.toJson() output:
// { "personal": { "name": "...", "age": ... } }
```

### Conditional Group Validation (`formGroup` + `applyWhen:`)
Pass `applyWhen:` to `formGroup` to apply a shared condition to every field in the group. All fields inside only validate when the condition returns `true`.
```dart
final form = formCtrl(() => (
  hasBilling: Field<bool>('hasBilling', false),
  billing: formGroup('billing', () => (
    address: Field<String>('address').required(),
    city: Field<String>('city').required(),
  ), applyWhen: (valueOf) => valueOf<bool>('hasBilling').value == true),
));
// address and city are validated only when hasBilling is true
```
- **Equivalent to**: calling `.applyWhen(condition, ...)` on every field inside the group manually.
- **Composable**: fields inside the group can have their own additional `applyWhen` conditions; both conditions must be true for the validator to run.

### Conditional Routing (`switchWith`)
Route an entire set of validators based on a key derived from another field. Only the matching case runs; the rest are skipped.
```dart
final form = formCtrl(() => (
  country: Field<String>('country', 'BR')
      .oneOf(['BR', 'US', 'EU'], message: 'Invalid country'),
  doc: Field<String>('doc').switchWith<String>(
    (valueOf) => valueOf<String>('country').value,
    {
      'BR': (f) => f.validCPF(message: 'Invalid CPF'),
      'US': (f) => f.addValidator('Invalid SSN', (v) => v == null || v.length != 9),
      'EU': (f) => f.addValidator('Invalid VAT', (v) => v == null || v.length < 5),
    },
    orElse: (f) => f.required(message: 'Document required'),
    dependsOn: ['country'],
  ),
));
```
- **`orElse`**: builder that runs when the selector returns a key not present in the map.
- **`dependsOn: List<String>`**: field paths that, when changed, immediately clear the field's current error and re-schedule validation (in `onChange` mode). Required when the key selector reads a field that is not a direct ancestor — otherwise the routing may show a stale error.
- **Typed keys**: `K` can be any type. Using a Dart 3 `sealed class` or `enum` as the key gives compile-time exhaustiveness — the IDE warns if a new subtype is added without a corresponding map entry.
```dart
sealed class Country { const Country(); }
final class BR extends Country { const BR(); }
final class US extends Country { const US(); }
final class EU extends Country { const EU(); }

Field<String>('doc').switchWith<Country>(
  (valueOf) => switch (valueOf<String>('country').value) {
    'BR' => const BR(),
    'US' => const US(),
    'EU' => const EU(),
    _    => null,
  },
  {
    const BR(): (f) => f.validCPF(message: 'Invalid CPF'),
    const US(): (f) => f.addValidator('Invalid SSN', (v) => v == null || v.length != 9),
    const EU(): (f) => f.addValidator('Invalid VAT', (v) => v == null || v.length < 5),
  },
  dependsOn: ['country'],
)
// const objects of the same type are canonicalized by Dart —
// const BR() == const BR() is true without overriding operator==
```

---

## 4. Built-in Form Widgets

The library provides 12+ reactive widgets, all binding directly to a backing `Field<T>`.

| Widget | Field Type | Key Feature |
| :--- | :--- | :--- |
| `SignalTextField` | `Field<String>` | Standard input with decoration & obfuscating support. |
| `SignalCheckbox` | `Field<bool>` | Single checkbox (wraps `CheckboxListTile`). |
| `SignalSwitch` | `Field<bool>` | Single switch (wraps `SwitchListTile`). |
| `SignalRadioGroup<T>` | `Field<T>` | Group of radio buttons. |
| `SignalCheckboxGroup<T>` | `Field<List<T>>` | Stacks checkboxes for multi-select. |
| `SignalDropdown<T>` | `Field<T>` | Dropdown selection form field. |
| `SignalDateTimePicker` | `Field<DateTime>` | Date selection via calendar picker dialog. |
| `SignalDateRangePicker` | `Field<DateTimeRange>` | Range of date selection via calendar dialog. |
| `SignalSlider` | `Field<double>` | Slidable single value picker. |
| `SignalRangeSlider` | `Field<RangeValues>` | Range slider picker. |
| `SignalChoiceChip<T>` | `Field<T>` | Single choice chip group. |
| `SignalFilterChip<T>` | `Field<List<T>>` | Multiple choice chip group. |

---

## 5. Writing Custom Validators (Sync & Async)

Write extensions on `Field<T>` to package custom business logic as a reusable validator.

### Custom Synchronous Validator
Synchronous validators evaluate immediately. Return `true` in `hasError` when the validation fails.

```dart
extension EmailDomainValidator on Field<String> {
  Field<String> emailDomain(String domain, {String message = '', bool exposed = false}) {
    return addValidator(
      message,
      (val) {
        if (val == null || !val.contains('@')) return false;
        final parts = val.split('@');
        return parts.last != domain; // Return true to indicate error
      },
      exposedMessage: exposed,
    );
  }
}
```

### Custom Asynchronous Validator
Async validators are executed only after all sync validators pass. Debounce should be applied to prevent API spam.

```dart
extension UsernameUniquenessValidator on Field<String> {
  Field<String> uniqueUsername(ApiUser api, {String message = '', bool exposed = false}) {
    return addValidatorAsync(
      message,
      (val) async {
        if (val == null || val.isEmpty) return false;
        // Fails if username exists (returns true to indicate error)
        return await api.checkUsernameExists(val);
      },
    );
  }
}
```

> [!NOTE]
> The library automatically handles asynchronous race conditions. If the field's value changes while an asynchronous validator is running, the older/outdated validation result is silently discarded, preventing stale errors from overwriting newer states. Do not implement custom `CancelToken`s or manual version checks.

---

## 6. Vanilla Usage (Custom Design Systems)

If the built-in widgets do not fit your styling, use `ListenableBuilder` to render native fields, third-party libraries, or custom widgets.

### Vanilla TextField Implementation
Attach a `FocusNode` to trigger `touch()` on focus loss.

```dart
class CustomVanillaInput extends StatefulWidget {
  final Field<String> field;
  const CustomVanillaInput({super.key, required this.field});

  @override
  State<CustomVanillaInput> createState() => _CustomVanillaInputState();
}

class _CustomVanillaInputState extends State<CustomVanillaInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.field.value ?? '');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.field.touch();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.field,
      builder: (context, _) {
        // Keep controller value in sync with external programmatic field updates
        if (_controller.text != widget.field.value) {
          _controller.text = widget.field.value ?? '';
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (val) => widget.field.value = val,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: widget.field.isTouched ? widget.field.error : null,
              ),
            ),
            if (widget.field.isLoading)
              const LinearProgressIndicator(),
          ],
        );
      },
    );
  }
}
```

---

## 7. Form Submission & Server-Side Validation

### Form Submission Cycle
Calling `form.submit()` automatically:
1. Calls `touchAll()` on the form fields.
2. Validates all fields. If any is invalid, aborts and scrolls/focuses to the first error.
3. Sets `isSubmitting` to `true`.
4. Executes the onSubmit callback.
5. Handles exceptions and resets `isSubmitting`.

```dart
ElevatedButton(
  onPressed: () => form.submit((ctrl) async {
    try {
      await api.registerUser(ctrl.toJson());
    } on ApiException catch (e) {
      // Map server-side validation errors back to specific form fields
      if (e.fieldErrors.containsKey('email')) {
        ctrl.fields.email.invalidate(
          'Email already taken',
          shouldFocus: true,
          shouldScroll: true,
        );
      }
    }
  }),
  child: const Text('Submit'),
);
```

### Focus Node & Scrolling on Error
When `form.submit()` or `form.trigger(shouldFocus: true, shouldScroll: true)` fails validation:
1. The form controller identifies the first invalid field.
2. If that field has an associated `FocusNode` assigned to its `focusNode` property, the controller requests focus on it via `node.requestFocus()`.
3. If `shouldScroll` is `true`, it obtains the widget's `BuildContext` from `node.context` and automatically scrolls it into view using `Scrollable.ensureVisible(context)`.
4. **Built-in Widgets**: Widgets like `SignalTextField`, `SignalDropdown`, etc., automatically create and register their `FocusNode` to the backing `Field`'s `focusNode` property during mounting. No manual scroll controllers or scopes are needed.
5. **Vanilla/Custom Widgets**: If you are using custom widgets, you must manually assign a `FocusNode` to the field (`field.focusNode = myFocusNode`) and pass it to your input widget.

### Data Extraction & DTOs (`toJson()`)
- **Nested Maps**: `form.toJson()` returns a nested `Map<String, dynamic>` where dot-notation fields are automatically expanded (e.g., `'address.city'` becomes `{'address': {'city': '...'}}`).
- **Omit nulls**: Pass `omitNulls: true` to strip null leaf values **and** prune any nested groups that become empty as a result. Useful for PATCH payloads where absent fields should not overwrite existing data.
  ```dart
  form.toJson();                 // { name: 'John', address: null }
  form.toJson(omitNulls: true);  // { name: 'John' }  ← address removed
  ```
- **Non-Primitive Types**:
  - `DateTime`: If a field's type is `DateTime` and no custom transformer is defined, it is automatically serialized into its ISO 8601 string representation via `toIso8601String()`.
  - `List<T>` / `Iterable<T>`: If list items contain complex types, you must define a custom transformer. Otherwise, they are serialized as-is.
- **Custom Transformers**: Use `transformToJson(dynamic Function(T?) transformer)` to define custom serialization for enums, entity objects, or special formats:
```dart
final form = formCtrl(() => (
  status: Field<UserStatus>('status')
      .transformToJson((status) => status?.name),
  tags: Field<List<Tag>>('tags')
      .transformToJson((tags) => tags?.map((t) => t.id).toList()),
));
```

---

## 8. Form Editing, Patching & Reset (CRUD)

### Patching Existing Data (Edição)
To populate a form with existing data (e.g., loading an entity from an API), use `form.patchValue(Map<String, dynamic> values)`.
- It takes a map of dot-notation paths to values and assigns them to matching fields.
- Non-matching paths are silently ignored.
- The updates are batched, notifying listeners exactly **once** after all fields are updated.

```dart
// Fetching user from API and editing
final userData = await api.getUser(userId);
form.patchValue({
  'username': userData.name,
  'email': userData.email,
  'personal.age': userData.age,
});
```

### Resetting Forms
- **Global Reset**: Call `form.reset()` to restore all fields in the form to their `initialValue` and clear all validation errors in a single batched operation. If `form.onReset` is set, it will be executed.
- **Single Field Reset**: Call `form.resetField('path')` to restore a single field by its dot-notation path to its initial state.

---

## 9. AI Guidelines & Best Practices (Do's and Don't)

- **DO NOT** create a `TextEditingController` or `FocusNode` manually when using built-in widgets like `SignalTextField`. The widgets handle their creation, listener attachment, and disposal automatically.
- **ALWAYS** call `form.dispose()` inside the `dispose` method of a `StatefulWidget` to prevent memory leaks and release resources.
- **ALWAYS** use `ListenableBuilder` when rendering a vanilla Flutter widget attached to a `Field<T>` or when reacting to global `FormController` changes.
- **DO NOT** call `.validate()` or `form.trigger()` manually on every `onChanged`. Rely on the field's `ValidationMode` (default is `onChange`).
- **PREFER** fluently chaining built-in validators instead of writing custom `.must()` or `.mustWith()` functions if a built-in equivalent exists.
- **ALWAYS** use full dot-notation paths (e.g., `'address.street'`) when calling `valueOf`, `getField`, `tryGetField`, `patchValue`, or `resetField`.

---

## 10. Complete E2E Example

Here is a complete, production-ready `StatefulWidget` demonstrating form initialization, patching existing data on start, rendering form inputs, listening to global validation/submission states, and disposing the controller properly.

```dart
import 'package:flutter/material.dart';
import 'package:signal_form/signal_form.dart';

class EditProfilePage extends StatefulWidget {
  final String userId;
  final ApiService api;

  const EditProfilePage({
    super.key,
    required this.userId,
    required this.api,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // 1. Declare the form controller
  late final FormController form;
  bool _isLoadingData = true;

  @override
  void initState() {
    super.initState();

    // 2. Initialize the form controller with fields and validators
    form = formCtrl(() => (
      username: Field<String>('username')
          .required(message: 'Username is required')
          .minLength(3, message: 'Must be at least 3 characters'),
      email: Field<String>('email')
          .required(message: 'Email is required')
          .email(message: 'Invalid email address'),
      personal: formGroup('personal', () => (
        age: Field<int>('age')
            .required(message: 'Age is required')
            .min(18, message: 'Must be at least 18 years old'),
      )),
    ));

    _loadUserData();
  }

  // 3. Simulating CRUD Edit scenario: Fetching and patching values on start
  Future<void> _loadUserData() async {
    try {
      final user = await widget.api.getUser(widget.userId);
      
      // Patch values in a single batched operation
      form.patchValue({
        'username': user.username,
        'email': user.email,
        'personal.age': user.age,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoadingData = false);
      }
    }
  }

  // 4. Dispose the FormController to prevent memory leaks!
  @override
  void dispose() {
    form.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingData) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 5. Use built-in widgets (they auto-register FocusNodes)
            SignalTextField(
              field: form.fields.username,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            SignalTextField(
              field: form.fields.email,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            
            // Nested field under formGroup
            SignalTextField(
              field: form.fields.personal.fields.age,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 32),

            // 6. ListenableBuilder reacts to global form validation & submit state
            ListenableBuilder(
              listenable: form,
              builder: (context, _) {
                final isSubmitting = form.isSubmitting;
                
                return ElevatedButton(
                  // Button is disabled if form is invalid or currently submitting
                  onPressed: form.valid && !isSubmitting
                      ? _onSubmit
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save Profile'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    // 7. submit() touches all fields and auto-scrolls/focuses on first error
    await form.submit((ctrl) async {
      try {
        await widget.api.updateUser(widget.userId, ctrl.toJson());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully!')),
        );
      } on ApiException catch (e) {
        // Map backend errors back to fields
        if (e.errors.containsKey('email')) {
          ctrl.fields.email.invalidate(
            e.errors['email']!,
            shouldFocus: true,
            shouldScroll: true,
          );
        }
      }
    });
  }
}
```

