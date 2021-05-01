# NetOffice Type Libraries

> Data source for _LateBindingApi.CodeGenerator_ with NetOffice library data.


## Information

Source file: **NetOffice 1.7.4.3.xml**  
NetOffice version: **1.7.4.3**


## Changes

List of fixes done to the NetOffice type library XML files to convert them from
release **v1.7.4.1** to **v1.7.4.3**.

### Fix 01 - Company Name

Changed company name to `https://osdn.net/projects/netoffice`

```diff
-  Company="netoffice.codeplex.com"
+  Company="https://osdn.net/projects/netoffice"
```

### Fix 02 - Version and FileVersion

Changed **Version** and **FileVersion** attributes to value `1.7.4.3`

```diff
-  Version="1.7.3.0" FileVersion="1.7.3.0"
+  Version="1.7.4.3" FileVersion="1.7.4.3"
```

### Fix 03 - Reference _IMsoDispObj class from Publisher data types

Several data types in **Publisher** project were referencing unknown type with
GUID `47ba1a51-3158-48b1-a19d-a7e782faa707`.

These types should inherit from the `_IMsoDispObj` interface which has GUID
`194401bb-e393-488a-8bb6-d3e46cd91189`.

```diff
<Inherited>
-  <Ref Key="_x0034_7ba1a51-3158-48b1-a19d-a7e782faa707">
+  <Ref Key="_x0031_94401bb-e393-488a-8bb6-d3e46cd91189">
...
```

### Fix 04 - Publisher project references

The **Publisher** project references two unknown projects:

```xml
<RefProjects>
  <RefProject Key="_x0035_7c50640-df45-46ae-a8ca-e6d859bff906" />
  <RefProject Key="_x0039_376fe6c-77be-407d-8fb3-6b102ae6a131" />
</RefProjects>
```

The project with key `_x0039_376fe6c-77be-407d-8fb3-6b102ae6a131` (GUID `9376fe6c-77be-407d-8fb3-6b102ae6a131`)
is used in the **PublisherApi.csproj** (release v1.7.4.3):

```xml
<ProjectReference Include="..\Office\OfficeApi.csproj">
  <Project>{9376FE6C-77BE-407D-8FB3-6B102AE6A131}</Project>
  <Name>OfficeApi</Name>
</ProjectReference>
```

The correct project GUID for **OfficeApi** is `79B19A83-A79F-446C-9B7E-9B595E918E40`.
