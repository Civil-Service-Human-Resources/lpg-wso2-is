
INSERT INTO um_user (um_user_name, um_user_password, um_salt_value, um_require_change, um_changed_time, um_tenant_id)
  VALUES ('test@lpg.dev.cshr.digital', 'CpfcMRB1+ErcVc4On0/58md9xOC6cxMl/WOg71v5TA4=', 'tApkvY3NRkg2EMmxO50kLA==', 'f', '2018-01-18 15:36:19.407', -1234);

INSERT INTO um_user_attribute (um_attr_name, um_attr_value, um_profile_id, um_user_id, um_tenant_id) VALUES ('uid', 'test@lpg.dev.cshr.digital', 'default', 2, -1234);
INSERT INTO um_user_attribute (um_attr_name, um_attr_value, um_profile_id, um_user_id, um_tenant_id) VALUES ('scimId', 'f6bb29cb-876f-45fa-b851-34f6569d35d2', 'default', 2, -1234);
INSERT INTO um_user_attribute (um_attr_name, um_attr_value, um_profile_id, um_user_id, um_tenant_id) VALUES ('uid', 'lastModifiedDate', '2018-01-18T15:36:19', 2, -1234);
INSERT INTO um_user_attribute (um_attr_name, um_attr_value, um_profile_id, um_user_id, um_tenant_id) VALUES ('uid', 'createdDate', '2018-01-18T15:36:19', 2, -1234);
