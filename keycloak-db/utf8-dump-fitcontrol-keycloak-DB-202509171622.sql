--
-- PostgreSQL database cluster dump
--

-- Started on 2025-09-17 16:22:56

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE keycloak;
ALTER ROLE keycloak WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-17 16:22:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-09-17 16:22:56

--
-- PostgreSQL database dump complete
--

--
-- Database "fitcontrol-keycloak-DB" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-17 16:22:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4301 (class 1262 OID 16384)
-- Name: fitcontrol-keycloak-DB; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE "fitcontrol-keycloak-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "fitcontrol-keycloak-DB" OWNER TO keycloak;

\connect -reuse-previous=on "dbname='fitcontrol-keycloak-DB'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 249 (class 1259 OID 17021)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- TOC entry 276 (class 1259 OID 17464)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- TOC entry 252 (class 1259 OID 17036)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- TOC entry 251 (class 1259 OID 17031)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- TOC entry 250 (class 1259 OID 17026)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- TOC entry 253 (class 1259 OID 17041)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- TOC entry 277 (class 1259 OID 17479)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- TOC entry 217 (class 1259 OID 16402)
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- TOC entry 236 (class 1259 OID 16760)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- TOC entry 288 (class 1259 OID 17728)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- TOC entry 287 (class 1259 OID 17603)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- TOC entry 237 (class 1259 OID 16770)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- TOC entry 265 (class 1259 OID 17269)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- TOC entry 266 (class 1259 OID 17283)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- TOC entry 289 (class 1259 OID 17769)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- TOC entry 267 (class 1259 OID 17288)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- TOC entry 285 (class 1259 OID 17524)
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- TOC entry 284 (class 1259 OID 17519)
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- TOC entry 218 (class 1259 OID 16421)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- TOC entry 219 (class 1259 OID 16424)
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- TOC entry 290 (class 1259 OID 17785)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- TOC entry 220 (class 1259 OID 16429)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- TOC entry 278 (class 1259 OID 17484)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- TOC entry 279 (class 1259 OID 17489)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- TOC entry 292 (class 1259 OID 17811)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- TOC entry 280 (class 1259 OID 17498)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- TOC entry 281 (class 1259 OID 17507)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- TOC entry 282 (class 1259 OID 17510)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- TOC entry 283 (class 1259 OID 17516)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- TOC entry 240 (class 1259 OID 16806)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- TOC entry 286 (class 1259 OID 17581)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- TOC entry 262 (class 1259 OID 17208)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- TOC entry 261 (class 1259 OID 17205)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- TOC entry 241 (class 1259 OID 16811)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- TOC entry 242 (class 1259 OID 16820)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- TOC entry 246 (class 1259 OID 16924)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- TOC entry 247 (class 1259 OID 16929)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- TOC entry 301 (class 1259 OID 18010)
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO keycloak;

--
-- TOC entry 260 (class 1259 OID 17202)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL,
    description character varying(255)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- TOC entry 221 (class 1259 OID 16437)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- TOC entry 245 (class 1259 OID 16921)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- TOC entry 259 (class 1259 OID 17193)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- TOC entry 258 (class 1259 OID 17188)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- TOC entry 298 (class 1259 OID 17973)
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- TOC entry 299 (class 1259 OID 17984)
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- TOC entry 272 (class 1259 OID 17407)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- TOC entry 238 (class 1259 OID 16795)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- TOC entry 239 (class 1259 OID 16801)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- TOC entry 222 (class 1259 OID 16443)
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- TOC entry 223 (class 1259 OID 16460)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- TOC entry 264 (class 1259 OID 17217)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- TOC entry 244 (class 1259 OID 16913)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- TOC entry 224 (class 1259 OID 16468)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- TOC entry 297 (class 1259 OID 17919)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- TOC entry 226 (class 1259 OID 16478)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- TOC entry 243 (class 1259 OID 16829)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- TOC entry 227 (class 1259 OID 16488)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- TOC entry 257 (class 1259 OID 17152)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- TOC entry 256 (class 1259 OID 17145)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- TOC entry 294 (class 1259 OID 17850)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- TOC entry 274 (class 1259 OID 17434)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- TOC entry 273 (class 1259 OID 17419)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- TOC entry 268 (class 1259 OID 17357)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- TOC entry 293 (class 1259 OID 17826)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- TOC entry 271 (class 1259 OID 17393)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- TOC entry 269 (class 1259 OID 17365)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- TOC entry 270 (class 1259 OID 17379)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- TOC entry 295 (class 1259 OID 17868)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- TOC entry 300 (class 1259 OID 18001)
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- TOC entry 296 (class 1259 OID 17878)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- TOC entry 228 (class 1259 OID 16491)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- TOC entry 275 (class 1259 OID 17449)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- TOC entry 302 (class 1259 OID 18017)
-- Name: server_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO keycloak;

--
-- TOC entry 229 (class 1259 OID 16497)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- TOC entry 248 (class 1259 OID 16934)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- TOC entry 291 (class 1259 OID 17801)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- TOC entry 230 (class 1259 OID 16502)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- TOC entry 231 (class 1259 OID 16510)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- TOC entry 254 (class 1259 OID 17046)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- TOC entry 255 (class 1259 OID 17051)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- TOC entry 232 (class 1259 OID 16515)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- TOC entry 263 (class 1259 OID 17214)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- TOC entry 233 (class 1259 OID 16520)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- TOC entry 234 (class 1259 OID 16523)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- TOC entry 235 (class 1259 OID 16537)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- TOC entry 4242 (class 0 OID 17021)
-- Dependencies: 249
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- TOC entry 4269 (class 0 OID 17464)
-- Dependencies: 276
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4245 (class 0 OID 17036)
-- Dependencies: 252
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
2edca0f1-a50a-4325-acda-f56cf97b4879	\N	auth-cookie	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6592fa50-d55c-4e93-8153-eb5f38628242	2	10	f	\N	\N
2b633c7a-8e5a-4d52-9438-b5f129d68b2e	\N	auth-spnego	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6592fa50-d55c-4e93-8153-eb5f38628242	3	20	f	\N	\N
5fee345f-cd4a-4ed2-8d8b-ac6c77eedd99	\N	identity-provider-redirector	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6592fa50-d55c-4e93-8153-eb5f38628242	2	25	f	\N	\N
76ebcbcb-8724-40d1-b40f-324cf465f651	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6592fa50-d55c-4e93-8153-eb5f38628242	2	30	t	8e841c15-b8e2-48e4-8aea-bbb7ba54e80d	\N
dbb3f5f8-93f0-4086-bc72-65d93948ba4c	\N	auth-username-password-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	8e841c15-b8e2-48e4-8aea-bbb7ba54e80d	0	10	f	\N	\N
41e7c648-e95b-4a21-a6c6-db66a770f384	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	8e841c15-b8e2-48e4-8aea-bbb7ba54e80d	1	20	t	a3fce0a6-adc8-4696-bb33-2bb932509f76	\N
ec901d3b-4f1a-4898-880a-fcab8bc16300	\N	conditional-user-configured	f63a6b35-ce9c-442a-bf20-081b5ada87c0	a3fce0a6-adc8-4696-bb33-2bb932509f76	0	10	f	\N	\N
470798ec-4a97-4c94-bea1-6981e05fac9d	\N	auth-otp-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	a3fce0a6-adc8-4696-bb33-2bb932509f76	2	20	f	\N	\N
a3dfcf04-3546-4066-a7c0-465599659bb3	\N	webauthn-authenticator	f63a6b35-ce9c-442a-bf20-081b5ada87c0	a3fce0a6-adc8-4696-bb33-2bb932509f76	3	30	f	\N	\N
0f9b435c-d775-4f40-86bc-82c1a2ecfaa7	\N	auth-recovery-authn-code-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	a3fce0a6-adc8-4696-bb33-2bb932509f76	3	40	f	\N	\N
d26ad1d6-d046-4c57-acc1-5bf79590a87a	\N	direct-grant-validate-username	f63a6b35-ce9c-442a-bf20-081b5ada87c0	2c3b107f-87eb-415d-969d-cf09a06c0295	0	10	f	\N	\N
08ccfb70-b9b2-41df-a16c-3ed742fefc87	\N	direct-grant-validate-password	f63a6b35-ce9c-442a-bf20-081b5ada87c0	2c3b107f-87eb-415d-969d-cf09a06c0295	0	20	f	\N	\N
120024ca-0c14-4c5b-9484-9f3164b78477	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	2c3b107f-87eb-415d-969d-cf09a06c0295	1	30	t	37800230-ff85-4a29-8bd2-e17fd9b11f6b	\N
272b9c67-d08a-4d79-a519-37ac00a6f715	\N	conditional-user-configured	f63a6b35-ce9c-442a-bf20-081b5ada87c0	37800230-ff85-4a29-8bd2-e17fd9b11f6b	0	10	f	\N	\N
a16474b5-b0de-4c85-85ac-69f37d71bd9b	\N	direct-grant-validate-otp	f63a6b35-ce9c-442a-bf20-081b5ada87c0	37800230-ff85-4a29-8bd2-e17fd9b11f6b	0	20	f	\N	\N
16ed5c93-2912-452d-a791-1a9499074661	\N	registration-page-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	e1eb4a3f-5ba2-4bee-a512-dee50f2903b0	0	10	t	9d8e264f-e064-4ca5-a3d1-424739db3a9c	\N
b8a4c989-d01d-4d70-b3a0-f7054513ca3a	\N	registration-user-creation	f63a6b35-ce9c-442a-bf20-081b5ada87c0	9d8e264f-e064-4ca5-a3d1-424739db3a9c	0	20	f	\N	\N
9837c2fd-db1d-4bdb-8d21-868f8ba02643	\N	registration-password-action	f63a6b35-ce9c-442a-bf20-081b5ada87c0	9d8e264f-e064-4ca5-a3d1-424739db3a9c	0	50	f	\N	\N
c227c607-3375-4371-8820-850c95a96dfa	\N	registration-recaptcha-action	f63a6b35-ce9c-442a-bf20-081b5ada87c0	9d8e264f-e064-4ca5-a3d1-424739db3a9c	3	60	f	\N	\N
d8072572-5850-4d04-8a56-14d8152260fe	\N	registration-terms-and-conditions	f63a6b35-ce9c-442a-bf20-081b5ada87c0	9d8e264f-e064-4ca5-a3d1-424739db3a9c	3	70	f	\N	\N
f8d088ee-13ee-4e97-83bc-c75adf006787	\N	reset-credentials-choose-user	f63a6b35-ce9c-442a-bf20-081b5ada87c0	e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	0	10	f	\N	\N
62831458-c377-49fc-b0f4-ad29cdae4cbe	\N	reset-credential-email	f63a6b35-ce9c-442a-bf20-081b5ada87c0	e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	0	20	f	\N	\N
a2388099-4edf-44ad-8018-ae814e9293f7	\N	reset-password	f63a6b35-ce9c-442a-bf20-081b5ada87c0	e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	0	30	f	\N	\N
0c338a7e-7964-422a-92dc-04b3310242fc	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	1	40	t	1c2f9d8e-8d96-417c-91ff-58027ac13583	\N
bfa6c650-548f-49bd-b5eb-62784dfdf379	\N	conditional-user-configured	f63a6b35-ce9c-442a-bf20-081b5ada87c0	1c2f9d8e-8d96-417c-91ff-58027ac13583	0	10	f	\N	\N
a5d2fd8e-c80e-4955-a062-928ae0e3f0cb	\N	reset-otp	f63a6b35-ce9c-442a-bf20-081b5ada87c0	1c2f9d8e-8d96-417c-91ff-58027ac13583	0	20	f	\N	\N
a50a5da6-761f-4410-84f9-9abaff14342c	\N	client-secret	f63a6b35-ce9c-442a-bf20-081b5ada87c0	87bb08ab-cbef-4549-976a-c2deefbe1e40	2	10	f	\N	\N
388d8a8e-9c1a-421f-bf84-5681764da529	\N	client-jwt	f63a6b35-ce9c-442a-bf20-081b5ada87c0	87bb08ab-cbef-4549-976a-c2deefbe1e40	2	20	f	\N	\N
5908b196-c846-4df4-b101-283aecadbe4e	\N	client-secret-jwt	f63a6b35-ce9c-442a-bf20-081b5ada87c0	87bb08ab-cbef-4549-976a-c2deefbe1e40	2	30	f	\N	\N
76e1f689-87cf-42fc-a799-fcb3892223fd	\N	client-x509	f63a6b35-ce9c-442a-bf20-081b5ada87c0	87bb08ab-cbef-4549-976a-c2deefbe1e40	2	40	f	\N	\N
8abb3c59-e952-44b3-b57c-830705ce37cc	\N	idp-review-profile	f63a6b35-ce9c-442a-bf20-081b5ada87c0	85847db3-799e-44c4-8623-06c18e491027	0	10	f	\N	cec5a588-7888-4b90-af48-9621a3ffd1b1
d34b2bd3-cbb4-44ba-a01b-f552c3646967	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	85847db3-799e-44c4-8623-06c18e491027	0	20	t	ed242753-754f-4d37-ab59-15ff0c951f2f	\N
045107b7-1e0f-455a-963f-acd204f414ec	\N	idp-create-user-if-unique	f63a6b35-ce9c-442a-bf20-081b5ada87c0	ed242753-754f-4d37-ab59-15ff0c951f2f	2	10	f	\N	a3603023-c538-402f-b1d8-e54652cb1b12
6cbc99aa-6d07-416e-88f5-b5e3181e6d5c	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	ed242753-754f-4d37-ab59-15ff0c951f2f	2	20	t	47cb0780-aecc-49d0-9ed3-a96c74233daa	\N
9f0a4bc5-e14f-4cfa-ab76-59d84e8e0217	\N	idp-confirm-link	f63a6b35-ce9c-442a-bf20-081b5ada87c0	47cb0780-aecc-49d0-9ed3-a96c74233daa	0	10	f	\N	\N
bb80991a-d630-4a98-aa0b-23ab18abd69b	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	47cb0780-aecc-49d0-9ed3-a96c74233daa	0	20	t	6f5a6d25-b564-4a68-bad5-dfd640cf21a0	\N
c6f3d88f-df13-4db9-9224-60240c71509d	\N	idp-email-verification	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6f5a6d25-b564-4a68-bad5-dfd640cf21a0	2	10	f	\N	\N
d44d04c9-dee9-475b-a6f7-eb26ee1444d7	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6f5a6d25-b564-4a68-bad5-dfd640cf21a0	2	20	t	13791ded-e14b-4f26-8c90-45035a8900ca	\N
122aa47d-38c2-46cb-9134-1148c6840e43	\N	idp-username-password-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	13791ded-e14b-4f26-8c90-45035a8900ca	0	10	f	\N	\N
726f5396-6436-4f0a-8cff-4948544bff8c	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	13791ded-e14b-4f26-8c90-45035a8900ca	1	20	t	fccc95f6-7e0a-4647-9207-f5cca570f4f3	\N
137f4ad4-8fb4-4d3c-a6cd-df208ec6984c	\N	conditional-user-configured	f63a6b35-ce9c-442a-bf20-081b5ada87c0	fccc95f6-7e0a-4647-9207-f5cca570f4f3	0	10	f	\N	\N
3bb60090-99ee-471e-b4fa-9d543cf7cee9	\N	auth-otp-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	fccc95f6-7e0a-4647-9207-f5cca570f4f3	2	20	f	\N	\N
c5a54896-e106-41ff-ace2-42808cafb392	\N	webauthn-authenticator	f63a6b35-ce9c-442a-bf20-081b5ada87c0	fccc95f6-7e0a-4647-9207-f5cca570f4f3	3	30	f	\N	\N
ffdab24f-8daf-4a44-929e-ca924c63d75f	\N	auth-recovery-authn-code-form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	fccc95f6-7e0a-4647-9207-f5cca570f4f3	3	40	f	\N	\N
9f585667-9659-499c-b594-b37e59418cad	\N	http-basic-authenticator	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6215e0a7-cdb8-4add-a1d3-e2a3fb49c775	0	10	f	\N	\N
57b3d083-d718-4972-acd1-7cd0a5bfda2f	\N	docker-http-basic-authenticator	f63a6b35-ce9c-442a-bf20-081b5ada87c0	39d58a93-0b54-431b-aee2-efd6ead963da	0	10	f	\N	\N
bf7d7383-74b6-41bf-b26d-2b9342ac5ffa	\N	idp-email-verification	52cc0a6b-3160-4f03-bd34-7be149371f52	18aad5bd-e827-4250-b3dc-167442d85b95	2	10	f	\N	\N
cc66385a-1d80-4c60-b691-4fba8232f5c4	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	18aad5bd-e827-4250-b3dc-167442d85b95	2	20	t	a7f5368f-690f-4eb3-8343-5b72e51e9ff6	\N
ff317ecc-b92c-4cf9-ade3-cda9e3cb8455	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	481c1862-94de-4bdd-a173-008df133238a	0	10	f	\N	\N
d83383e5-9a51-4e18-8e57-f23f38d13c95	\N	auth-otp-form	52cc0a6b-3160-4f03-bd34-7be149371f52	481c1862-94de-4bdd-a173-008df133238a	2	20	f	\N	\N
f06f4180-8b55-4cfb-8f31-09848d8e9bfd	\N	webauthn-authenticator	52cc0a6b-3160-4f03-bd34-7be149371f52	481c1862-94de-4bdd-a173-008df133238a	3	30	f	\N	\N
e532fd6f-35fa-4173-b1f3-fc76757927cd	\N	auth-recovery-authn-code-form	52cc0a6b-3160-4f03-bd34-7be149371f52	481c1862-94de-4bdd-a173-008df133238a	3	40	f	\N	\N
b22f74d8-1276-4ea0-a41e-42a0cf9e9b27	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	391a359c-3551-4274-aacc-d2511eee059f	0	10	f	\N	\N
e5a4c78a-3584-4dcc-a17a-50df6331526d	\N	organization	52cc0a6b-3160-4f03-bd34-7be149371f52	391a359c-3551-4274-aacc-d2511eee059f	2	20	f	\N	\N
c5ef1f42-f381-4368-aa59-0ce46fe55034	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	44556832-8bf1-488b-a140-c26435408cfc	0	10	f	\N	\N
cd2238f3-87a4-459b-8805-7ec523a2f7e6	\N	direct-grant-validate-otp	52cc0a6b-3160-4f03-bd34-7be149371f52	44556832-8bf1-488b-a140-c26435408cfc	0	20	f	\N	\N
c0a65772-1f92-4ad8-a722-d2b73dba0aab	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	baeb271d-21e1-408e-a157-3c49a22f18a1	0	10	f	\N	\N
e043bb6a-a639-4bb2-9151-d880d99a8d66	\N	idp-add-organization-member	52cc0a6b-3160-4f03-bd34-7be149371f52	baeb271d-21e1-408e-a157-3c49a22f18a1	0	20	f	\N	\N
1a19faad-0953-4dc2-b2fa-5dd9469ce100	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	82a90256-35c4-40f2-b93d-ca9796ad0ba4	0	10	f	\N	\N
16cde6c8-8b43-445b-a300-072ea8a217e9	\N	auth-otp-form	52cc0a6b-3160-4f03-bd34-7be149371f52	82a90256-35c4-40f2-b93d-ca9796ad0ba4	2	20	f	\N	\N
d51d58b5-2110-401d-a57c-3d5fb2935e84	\N	webauthn-authenticator	52cc0a6b-3160-4f03-bd34-7be149371f52	82a90256-35c4-40f2-b93d-ca9796ad0ba4	3	30	f	\N	\N
248af4e9-27db-4c51-b588-1856339c1918	\N	auth-recovery-authn-code-form	52cc0a6b-3160-4f03-bd34-7be149371f52	82a90256-35c4-40f2-b93d-ca9796ad0ba4	3	40	f	\N	\N
701aaec7-a92c-4fb4-9d99-7dc5317910d5	\N	idp-confirm-link	52cc0a6b-3160-4f03-bd34-7be149371f52	c3a48209-6b61-4e75-b277-7507ddbfa62b	0	10	f	\N	\N
c5894719-1f67-4cb0-92c3-f5533a020a62	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	c3a48209-6b61-4e75-b277-7507ddbfa62b	0	20	t	18aad5bd-e827-4250-b3dc-167442d85b95	\N
6a69c4cb-1bb4-4fde-b064-513359f4d23d	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	aea29b2a-7ae2-43c9-9a36-2cdad0d2dd52	1	10	t	391a359c-3551-4274-aacc-d2511eee059f	\N
b6eece52-aa1f-402e-b674-4f726703e70c	\N	conditional-user-configured	52cc0a6b-3160-4f03-bd34-7be149371f52	c4a2333d-00f5-4ebe-92f5-50ac97929759	0	10	f	\N	\N
fbd67b36-bc6e-4143-bb24-9d88583b7fde	\N	reset-otp	52cc0a6b-3160-4f03-bd34-7be149371f52	c4a2333d-00f5-4ebe-92f5-50ac97929759	0	20	f	\N	\N
efb0efb3-87c9-48b8-91f3-620c4f46fbf9	\N	idp-create-user-if-unique	52cc0a6b-3160-4f03-bd34-7be149371f52	9e2b3029-1e11-47d3-bde5-88b22a92fbb8	2	10	f	\N	1ebb3ee7-e408-4144-8371-99ff611567e2
e2523dad-c87d-479c-ad60-49df1008696c	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	9e2b3029-1e11-47d3-bde5-88b22a92fbb8	2	20	t	c3a48209-6b61-4e75-b277-7507ddbfa62b	\N
c9ef9f27-693f-4aea-a772-efced2729542	\N	idp-username-password-form	52cc0a6b-3160-4f03-bd34-7be149371f52	a7f5368f-690f-4eb3-8343-5b72e51e9ff6	0	10	f	\N	\N
cc1f0025-b9c7-4ba9-9310-4cba38f96e7f	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	a7f5368f-690f-4eb3-8343-5b72e51e9ff6	1	20	t	82a90256-35c4-40f2-b93d-ca9796ad0ba4	\N
61e0b8b3-5bf5-4136-ad60-772d7485ba7f	\N	auth-cookie	52cc0a6b-3160-4f03-bd34-7be149371f52	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	2	10	f	\N	\N
d234eb15-11fa-457c-96ab-5f6042eeb3a8	\N	auth-spnego	52cc0a6b-3160-4f03-bd34-7be149371f52	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	3	20	f	\N	\N
44c052c8-41ba-48e3-bffe-661cc1c084e9	\N	identity-provider-redirector	52cc0a6b-3160-4f03-bd34-7be149371f52	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	2	25	f	\N	\N
c2915fd9-2825-4639-a59f-501429f980cf	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	2	26	t	aea29b2a-7ae2-43c9-9a36-2cdad0d2dd52	\N
e6b09d6a-0e77-46f9-b1a2-18b3b81a528d	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	2	30	t	047680ac-006e-408c-8e28-4b5e6738c17d	\N
86038c21-b2de-4051-8fc0-8d3db836d919	\N	client-secret	52cc0a6b-3160-4f03-bd34-7be149371f52	14742762-15e4-49cd-8309-ad600ffaa55b	2	10	f	\N	\N
55e7552d-e44d-4fd7-8ff3-7ae8c7da9d28	\N	client-jwt	52cc0a6b-3160-4f03-bd34-7be149371f52	14742762-15e4-49cd-8309-ad600ffaa55b	2	20	f	\N	\N
6d06b455-f734-487e-938c-02b09400f296	\N	client-secret-jwt	52cc0a6b-3160-4f03-bd34-7be149371f52	14742762-15e4-49cd-8309-ad600ffaa55b	2	30	f	\N	\N
65445848-952c-44fb-8015-b56c792ca922	\N	client-x509	52cc0a6b-3160-4f03-bd34-7be149371f52	14742762-15e4-49cd-8309-ad600ffaa55b	2	40	f	\N	\N
6a283cf2-d9f8-46ca-837f-fd5872f49191	\N	direct-grant-validate-username	52cc0a6b-3160-4f03-bd34-7be149371f52	fc9099f0-7d7f-48de-8920-be428e4e5cb6	0	10	f	\N	\N
e9fc4f06-df60-432b-852d-fbee2f4734db	\N	direct-grant-validate-password	52cc0a6b-3160-4f03-bd34-7be149371f52	fc9099f0-7d7f-48de-8920-be428e4e5cb6	0	20	f	\N	\N
c0a14650-4c9a-4c64-9a6a-3959288b20e8	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	fc9099f0-7d7f-48de-8920-be428e4e5cb6	1	30	t	44556832-8bf1-488b-a140-c26435408cfc	\N
7f057bb1-c531-404c-8023-2a295c5c6f1e	\N	docker-http-basic-authenticator	52cc0a6b-3160-4f03-bd34-7be149371f52	9cbb2d8d-feb7-47d2-96cb-1416304b2faa	0	10	f	\N	\N
cfe5a45e-81cc-48db-a0ee-d30b164336fc	\N	idp-review-profile	52cc0a6b-3160-4f03-bd34-7be149371f52	30ccdcbe-3663-447f-9322-c9c7ce56cc8b	0	10	f	\N	68e2335a-7d4e-4358-b549-eda10d64f614
14e9a1ed-daf0-4275-8f57-10f3894ddd00	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	30ccdcbe-3663-447f-9322-c9c7ce56cc8b	0	20	t	9e2b3029-1e11-47d3-bde5-88b22a92fbb8	\N
55b3f2bb-d106-496d-bc66-e605623f39dc	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	30ccdcbe-3663-447f-9322-c9c7ce56cc8b	1	50	t	baeb271d-21e1-408e-a157-3c49a22f18a1	\N
5aa99130-b306-43fd-b62b-be0ad8ca7826	\N	auth-username-password-form	52cc0a6b-3160-4f03-bd34-7be149371f52	047680ac-006e-408c-8e28-4b5e6738c17d	0	10	f	\N	\N
f3024afc-6f4f-4619-ab98-04f300499072	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	047680ac-006e-408c-8e28-4b5e6738c17d	1	20	t	481c1862-94de-4bdd-a173-008df133238a	\N
cd1d3791-e09d-4046-9bbe-3ec8f134cf1b	\N	registration-page-form	52cc0a6b-3160-4f03-bd34-7be149371f52	5fef84ea-06d5-4c83-9a93-722832b16312	0	10	t	690a2e52-8e07-4664-a85c-b950937a51de	\N
42e655e7-5099-4689-aee9-0246c56acbd6	\N	registration-user-creation	52cc0a6b-3160-4f03-bd34-7be149371f52	690a2e52-8e07-4664-a85c-b950937a51de	0	20	f	\N	\N
eb90441c-d9cb-4242-a3b0-471e03c20ee8	\N	registration-password-action	52cc0a6b-3160-4f03-bd34-7be149371f52	690a2e52-8e07-4664-a85c-b950937a51de	0	50	f	\N	\N
245b5bb1-7354-49d3-9409-f23ab2cfcb77	\N	registration-recaptcha-action	52cc0a6b-3160-4f03-bd34-7be149371f52	690a2e52-8e07-4664-a85c-b950937a51de	3	60	f	\N	\N
c198101b-e93b-451b-9fc9-2a54da493c0f	\N	registration-terms-and-conditions	52cc0a6b-3160-4f03-bd34-7be149371f52	690a2e52-8e07-4664-a85c-b950937a51de	3	70	f	\N	\N
ad1d415a-fed5-4ed9-a0e7-231b5b2aee3d	\N	reset-credentials-choose-user	52cc0a6b-3160-4f03-bd34-7be149371f52	9910f55c-678d-4997-97bd-7e30691886cc	0	10	f	\N	\N
401d6c18-8c8a-4813-90dc-d14217ea106b	\N	reset-credential-email	52cc0a6b-3160-4f03-bd34-7be149371f52	9910f55c-678d-4997-97bd-7e30691886cc	0	20	f	\N	\N
e379a773-81af-4e27-9ed0-f7c8bfc112e6	\N	reset-password	52cc0a6b-3160-4f03-bd34-7be149371f52	9910f55c-678d-4997-97bd-7e30691886cc	0	30	f	\N	\N
a59404a0-97c8-47ca-9d3a-96e0bb1e292e	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	9910f55c-678d-4997-97bd-7e30691886cc	1	40	t	c4a2333d-00f5-4ebe-92f5-50ac97929759	\N
0fb79a6e-e161-4b4b-ad84-b82375ed3859	\N	http-basic-authenticator	52cc0a6b-3160-4f03-bd34-7be149371f52	43802f19-0093-499a-9955-b7e405b4b41e	0	10	f	\N	\N
\.


--
-- TOC entry 4244 (class 0 OID 17031)
-- Dependencies: 251
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
6592fa50-d55c-4e93-8153-eb5f38628242	browser	Browser based authentication	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
8e841c15-b8e2-48e4-8aea-bbb7ba54e80d	forms	Username, password, otp and other auth forms.	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
a3fce0a6-adc8-4696-bb33-2bb932509f76	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
2c3b107f-87eb-415d-969d-cf09a06c0295	direct grant	OpenID Connect Resource Owner Grant	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
37800230-ff85-4a29-8bd2-e17fd9b11f6b	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
e1eb4a3f-5ba2-4bee-a512-dee50f2903b0	registration	Registration flow	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
9d8e264f-e064-4ca5-a3d1-424739db3a9c	registration form	Registration form	f63a6b35-ce9c-442a-bf20-081b5ada87c0	form-flow	f	t
e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	reset credentials	Reset credentials for a user if they forgot their password or something	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
1c2f9d8e-8d96-417c-91ff-58027ac13583	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
87bb08ab-cbef-4549-976a-c2deefbe1e40	clients	Base authentication for clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	client-flow	t	t
85847db3-799e-44c4-8623-06c18e491027	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
ed242753-754f-4d37-ab59-15ff0c951f2f	User creation or linking	Flow for the existing/non-existing user alternatives	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
47cb0780-aecc-49d0-9ed3-a96c74233daa	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
6f5a6d25-b564-4a68-bad5-dfd640cf21a0	Account verification options	Method with which to verity the existing account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
13791ded-e14b-4f26-8c90-45035a8900ca	Verify Existing Account by Re-authentication	Reauthentication of existing account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
fccc95f6-7e0a-4647-9207-f5cca570f4f3	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	f	t
6215e0a7-cdb8-4add-a1d3-e2a3fb49c775	saml ecp	SAML ECP Profile Authentication Flow	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
39d58a93-0b54-431b-aee2-efd6ead963da	docker auth	Used by Docker clients to authenticate against the IDP	f63a6b35-ce9c-442a-bf20-081b5ada87c0	basic-flow	t	t
18aad5bd-e827-4250-b3dc-167442d85b95	Account verification options	Method with which to verity the existing account	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
481c1862-94de-4bdd-a173-008df133238a	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
391a359c-3551-4274-aacc-d2511eee059f	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
44556832-8bf1-488b-a140-c26435408cfc	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
baeb271d-21e1-408e-a157-3c49a22f18a1	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
82a90256-35c4-40f2-b93d-ca9796ad0ba4	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
c3a48209-6b61-4e75-b277-7507ddbfa62b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
aea29b2a-7ae2-43c9-9a36-2cdad0d2dd52	Organization	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
c4a2333d-00f5-4ebe-92f5-50ac97929759	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
9e2b3029-1e11-47d3-bde5-88b22a92fbb8	User creation or linking	Flow for the existing/non-existing user alternatives	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
a7f5368f-690f-4eb3-8343-5b72e51e9ff6	Verify Existing Account by Re-authentication	Reauthentication of existing account	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
eb4a6ff7-5e8a-421c-af5c-3ee32936e540	browser	Browser based authentication	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
14742762-15e4-49cd-8309-ad600ffaa55b	clients	Base authentication for clients	52cc0a6b-3160-4f03-bd34-7be149371f52	client-flow	t	t
fc9099f0-7d7f-48de-8920-be428e4e5cb6	direct grant	OpenID Connect Resource Owner Grant	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
9cbb2d8d-feb7-47d2-96cb-1416304b2faa	docker auth	Used by Docker clients to authenticate against the IDP	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
30ccdcbe-3663-447f-9322-c9c7ce56cc8b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
047680ac-006e-408c-8e28-4b5e6738c17d	forms	Username, password, otp and other auth forms.	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	f	t
5fef84ea-06d5-4c83-9a93-722832b16312	registration	Registration flow	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
690a2e52-8e07-4664-a85c-b950937a51de	registration form	Registration form	52cc0a6b-3160-4f03-bd34-7be149371f52	form-flow	f	t
9910f55c-678d-4997-97bd-7e30691886cc	reset credentials	Reset credentials for a user if they forgot their password or something	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
43802f19-0093-499a-9955-b7e405b4b41e	saml ecp	SAML ECP Profile Authentication Flow	52cc0a6b-3160-4f03-bd34-7be149371f52	basic-flow	t	t
\.


--
-- TOC entry 4243 (class 0 OID 17026)
-- Dependencies: 250
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
cec5a588-7888-4b90-af48-9621a3ffd1b1	review profile config	f63a6b35-ce9c-442a-bf20-081b5ada87c0
a3603023-c538-402f-b1d8-e54652cb1b12	create unique user config	f63a6b35-ce9c-442a-bf20-081b5ada87c0
1ebb3ee7-e408-4144-8371-99ff611567e2	create unique user config	52cc0a6b-3160-4f03-bd34-7be149371f52
68e2335a-7d4e-4358-b549-eda10d64f614	review profile config	52cc0a6b-3160-4f03-bd34-7be149371f52
\.


--
-- TOC entry 4246 (class 0 OID 17041)
-- Dependencies: 253
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
a3603023-c538-402f-b1d8-e54652cb1b12	false	require.password.update.after.registration
cec5a588-7888-4b90-af48-9621a3ffd1b1	missing	update.profile.on.first.login
1ebb3ee7-e408-4144-8371-99ff611567e2	false	require.password.update.after.registration
68e2335a-7d4e-4358-b549-eda10d64f614	missing	update.profile.on.first.login
\.


--
-- TOC entry 4270 (class 0 OID 17479)
-- Dependencies: 277
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4210 (class 0 OID 16402)
-- Dependencies: 217
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
15c530bf-fc36-4c36-8494-d7aa47c90c31	t	f	master-realm	0	f	\N	\N	t	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
6d5de729-47f7-4d46-983a-51120b7008d8	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	t	f	broker	0	f	\N	\N	t	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
3429101c-5b88-40e4-995c-b603e5ff503b	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	t	t	admin-cli	0	t	\N	\N	f	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
73496781-6c99-4431-8252-6d9446bdd618	t	f	fitcontrol-realm	0	f	\N	\N	t	\N	f	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	0	f	f	fitcontrol Realm	f	client-secret	\N	\N	\N	t	f	f	f
2d483f57-f672-417b-a3fa-c784fc389ff0	t	f	account	0	t	\N	/realms/fitcontrol/account/	f	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	t	f	account-console	0	t	\N	/realms/fitcontrol/account/	f	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ad017007-5668-4635-89c5-125490162661	t	t	admin-cli	0	t	\N	\N	f	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	t	f	broker	0	f	\N	\N	t	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	t	t	fitcontrol-client	0	f	**********	http://host.docker.internal:8083/fitcontrol/tracker	f	http://host.docker.internal:8083/fitcontrol/tracker/	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	-1	f	f	fitcontrol-client	f	client-secret			\N	f	f	f	t
468a8d58-a07a-4288-b293-8e740a5c7922	t	t	fitcontrol-frontend-client	0	t	\N		f	http://localhost:4200	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	-1	f	f	fitcontrol-frontend-client	f	client-secret	http://localhost:4200		\N	t	f	f	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	t	t	fitcontrol-admin-client	0	f	KVUeX10hdNbqiOfeYLvXCrme5LfMH7Nx		f		f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	-1	t	f	fitcontrol-admin-client	t	client-secret			\N	f	f	f	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	f	realm-management	0	f	\N	\N	t	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
1c573beb-cddf-487d-827c-572abdcda65a	t	t	security-admin-console	0	t	\N	/admin/fitcontrol/console/	f	\N	f	52cc0a6b-3160-4f03-bd34-7be149371f52	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- TOC entry 4229 (class 0 OID 16760)
-- Dependencies: 236
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
6d5de729-47f7-4d46-983a-51120b7008d8	post.logout.redirect.uris	+
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	post.logout.redirect.uris	+
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	pkce.code.challenge.method	S256
3429101c-5b88-40e4-995c-b603e5ff503b	post.logout.redirect.uris	+
3429101c-5b88-40e4-995c-b603e5ff503b	pkce.code.challenge.method	S256
3429101c-5b88-40e4-995c-b603e5ff503b	client.use.lightweight.access.token.enabled	true
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	client.use.lightweight.access.token.enabled	true
2d483f57-f672-417b-a3fa-c784fc389ff0	realm_client	false
2d483f57-f672-417b-a3fa-c784fc389ff0	post.logout.redirect.uris	+
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	realm_client	false
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	post.logout.redirect.uris	+
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	pkce.code.challenge.method	S256
ad017007-5668-4635-89c5-125490162661	realm_client	false
ad017007-5668-4635-89c5-125490162661	client.use.lightweight.access.token.enabled	true
ad017007-5668-4635-89c5-125490162661	post.logout.redirect.uris	+
89105ce1-82fb-49c7-a1b4-9761fbf076e8	realm_client	true
89105ce1-82fb-49c7-a1b4-9761fbf076e8	post.logout.redirect.uris	+
bd7aec72-c51e-41fc-afe5-3a95bb122794	client.secret.creation.time	1755241774
bd7aec72-c51e-41fc-afe5-3a95bb122794	request.object.signature.alg	any
bd7aec72-c51e-41fc-afe5-3a95bb122794	request.object.encryption.alg	any
bd7aec72-c51e-41fc-afe5-3a95bb122794	client.introspection.response.allow.jwt.claim.enabled	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	standard.token.exchange.enabled	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	frontchannel.logout.session.required	true
bd7aec72-c51e-41fc-afe5-3a95bb122794	post.logout.redirect.uris	http://localhost:4200##http://localhost:4200/*
bd7aec72-c51e-41fc-afe5-3a95bb122794	oauth2.device.authorization.grant.enabled	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	use.jwks.url	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	backchannel.logout.revoke.offline.tokens	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	use.refresh.tokens	true
bd7aec72-c51e-41fc-afe5-3a95bb122794	realm_client	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	oidc.ciba.grant.enabled	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	client.use.lightweight.access.token.enabled	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	backchannel.logout.session.required	true
bd7aec72-c51e-41fc-afe5-3a95bb122794	request.object.required	not required
bd7aec72-c51e-41fc-afe5-3a95bb122794	client_credentials.use_refresh_token	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	access.token.header.type.rfc9068	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	tls.client.certificate.bound.access.tokens	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	require.pushed.authorization.requests	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	acr.loa.map	{}
bd7aec72-c51e-41fc-afe5-3a95bb122794	display.on.consent.screen	false
bd7aec72-c51e-41fc-afe5-3a95bb122794	request.object.encryption.enc	any
bd7aec72-c51e-41fc-afe5-3a95bb122794	token.response.type.bearer.lower-case	false
468a8d58-a07a-4288-b293-8e740a5c7922	realm_client	false
468a8d58-a07a-4288-b293-8e740a5c7922	oidc.ciba.grant.enabled	false
468a8d58-a07a-4288-b293-8e740a5c7922	backchannel.logout.session.required	false
468a8d58-a07a-4288-b293-8e740a5c7922	standard.token.exchange.enabled	false
468a8d58-a07a-4288-b293-8e740a5c7922	frontchannel.logout.session.required	true
468a8d58-a07a-4288-b293-8e740a5c7922	oauth2.device.authorization.grant.enabled	false
468a8d58-a07a-4288-b293-8e740a5c7922	display.on.consent.screen	false
468a8d58-a07a-4288-b293-8e740a5c7922	pkce.code.challenge.method	S256
468a8d58-a07a-4288-b293-8e740a5c7922	backchannel.logout.revoke.offline.tokens	false
468a8d58-a07a-4288-b293-8e740a5c7922	post.logout.redirect.uris	+
36dc6c95-b2b0-409d-92b8-75f9194ebc45	realm_client	true
36dc6c95-b2b0-409d-92b8-75f9194ebc45	post.logout.redirect.uris	+
1c573beb-cddf-487d-827c-572abdcda65a	realm_client	false
1c573beb-cddf-487d-827c-572abdcda65a	client.use.lightweight.access.token.enabled	true
1c573beb-cddf-487d-827c-572abdcda65a	post.logout.redirect.uris	+
1c573beb-cddf-487d-827c-572abdcda65a	pkce.code.challenge.method	S256
de942f08-1fe1-42f7-a73d-8586a3e7f12f	client.secret.creation.time	1755867508
de942f08-1fe1-42f7-a73d-8586a3e7f12f	standard.token.exchange.enabled	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	oauth2.device.authorization.grant.enabled	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	oidc.ciba.grant.enabled	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	backchannel.logout.session.required	true
de942f08-1fe1-42f7-a73d-8586a3e7f12f	backchannel.logout.revoke.offline.tokens	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	realm_client	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	display.on.consent.screen	false
de942f08-1fe1-42f7-a73d-8586a3e7f12f	frontchannel.logout.session.required	true
\.


--
-- TOC entry 4281 (class 0 OID 17728)
-- Dependencies: 288
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4280 (class 0 OID 17603)
-- Dependencies: 287
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 16770)
-- Dependencies: 237
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4258 (class 0 OID 17269)
-- Dependencies: 265
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	offline_access	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect built-in scope: offline_access	openid-connect
ae23303f-f983-491a-b5ee-09149e999ae8	role_list	f63a6b35-ce9c-442a-bf20-081b5ada87c0	SAML role list	saml
304f13ef-ac06-4719-b8af-2dcb772b3fad	saml_organization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	Organization Membership	saml
9bfdf796-8923-46ae-b834-4d4950dd5b6b	profile	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect built-in scope: profile	openid-connect
173317b9-8e02-4a8f-b456-02c25de72658	email	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect built-in scope: email	openid-connect
4588b911-5b8f-4a63-a58f-027f81412204	address	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect built-in scope: address	openid-connect
96374be7-30a9-4037-9a21-71cc6a2f96e1	phone	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect built-in scope: phone	openid-connect
0d1b9de7-e54d-461f-b813-da5bfc391098	roles	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect scope for add user roles to the access token	openid-connect
58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	web-origins	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect scope for add allowed web origins to the access token	openid-connect
e0cf9fe7-d0c4-45b8-a13a-8316729696d7	microprofile-jwt	f63a6b35-ce9c-442a-bf20-081b5ada87c0	Microprofile - JWT built-in scope	openid-connect
a14e6985-6c11-4cab-8217-2246d1ef253a	acr	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
c92ef9d0-878a-49cf-b3af-f7c34327b197	basic	f63a6b35-ce9c-442a-bf20-081b5ada87c0	OpenID Connect scope for add all basic claims to the token	openid-connect
008ee7ef-d593-4ea8-93c0-b63d3a139cb8	service_account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	Specific scope for a client enabled for service accounts	openid-connect
faf93f27-aa4b-4577-a75a-2f6920473135	organization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	Additional claims about the organization a subject belongs to	openid-connect
6b23af8d-fdf8-4968-881c-8b7c573466db	role_list	52cc0a6b-3160-4f03-bd34-7be149371f52	SAML role list	saml
b11444a9-46cd-4d1f-9c7b-945561490332	profile	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect built-in scope: profile	openid-connect
1246ad8e-5149-4c9f-b3c5-043502659916	acr	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
37b20652-2240-4cfe-9074-9832585e0c8e	service_account	52cc0a6b-3160-4f03-bd34-7be149371f52	Specific scope for a client enabled for service accounts	openid-connect
dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	microprofile-jwt	52cc0a6b-3160-4f03-bd34-7be149371f52	Microprofile - JWT built-in scope	openid-connect
1b2e785e-2476-4100-b4a3-40370fc918d3	organization	52cc0a6b-3160-4f03-bd34-7be149371f52	Additional claims about the organization a subject belongs to	openid-connect
320f1520-b55b-42b5-9d25-ba92efbc546a	saml_organization	52cc0a6b-3160-4f03-bd34-7be149371f52	Organization Membership	saml
18a131d4-b2cf-42c5-95c6-67aecb1f88e0	phone	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect built-in scope: phone	openid-connect
a381f838-94b9-46cb-8474-a04e3c552cb2	roles	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect scope for add user roles to the access token	openid-connect
d38fe61c-420c-4202-a560-2f005d860f62	address	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect built-in scope: address	openid-connect
8cae3849-dbf6-4004-bf86-ba8637c26b3f	web-origins	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect scope for add allowed web origins to the access token	openid-connect
a642f163-4a82-4a2f-92ed-fc51e8ad99ab	email	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect built-in scope: email	openid-connect
427153d7-e3e7-4cf3-aebd-1d25c667b5e4	offline_access	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect built-in scope: offline_access	openid-connect
ed0dd91f-6fcf-465d-9445-ee9fff253107	basic	52cc0a6b-3160-4f03-bd34-7be149371f52	OpenID Connect scope for add all basic claims to the token	openid-connect
\.


--
-- TOC entry 4259 (class 0 OID 17283)
-- Dependencies: 266
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	true	display.on.consent.screen
a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	${offlineAccessScopeConsentText}	consent.screen.text
ae23303f-f983-491a-b5ee-09149e999ae8	true	display.on.consent.screen
ae23303f-f983-491a-b5ee-09149e999ae8	${samlRoleListScopeConsentText}	consent.screen.text
304f13ef-ac06-4719-b8af-2dcb772b3fad	false	display.on.consent.screen
9bfdf796-8923-46ae-b834-4d4950dd5b6b	true	display.on.consent.screen
9bfdf796-8923-46ae-b834-4d4950dd5b6b	${profileScopeConsentText}	consent.screen.text
9bfdf796-8923-46ae-b834-4d4950dd5b6b	true	include.in.token.scope
173317b9-8e02-4a8f-b456-02c25de72658	true	display.on.consent.screen
173317b9-8e02-4a8f-b456-02c25de72658	${emailScopeConsentText}	consent.screen.text
173317b9-8e02-4a8f-b456-02c25de72658	true	include.in.token.scope
4588b911-5b8f-4a63-a58f-027f81412204	true	display.on.consent.screen
4588b911-5b8f-4a63-a58f-027f81412204	${addressScopeConsentText}	consent.screen.text
4588b911-5b8f-4a63-a58f-027f81412204	true	include.in.token.scope
96374be7-30a9-4037-9a21-71cc6a2f96e1	true	display.on.consent.screen
96374be7-30a9-4037-9a21-71cc6a2f96e1	${phoneScopeConsentText}	consent.screen.text
96374be7-30a9-4037-9a21-71cc6a2f96e1	true	include.in.token.scope
0d1b9de7-e54d-461f-b813-da5bfc391098	true	display.on.consent.screen
0d1b9de7-e54d-461f-b813-da5bfc391098	${rolesScopeConsentText}	consent.screen.text
0d1b9de7-e54d-461f-b813-da5bfc391098	false	include.in.token.scope
58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	false	display.on.consent.screen
58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a		consent.screen.text
58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	false	include.in.token.scope
e0cf9fe7-d0c4-45b8-a13a-8316729696d7	false	display.on.consent.screen
e0cf9fe7-d0c4-45b8-a13a-8316729696d7	true	include.in.token.scope
a14e6985-6c11-4cab-8217-2246d1ef253a	false	display.on.consent.screen
a14e6985-6c11-4cab-8217-2246d1ef253a	false	include.in.token.scope
c92ef9d0-878a-49cf-b3af-f7c34327b197	false	display.on.consent.screen
c92ef9d0-878a-49cf-b3af-f7c34327b197	false	include.in.token.scope
008ee7ef-d593-4ea8-93c0-b63d3a139cb8	false	display.on.consent.screen
008ee7ef-d593-4ea8-93c0-b63d3a139cb8	false	include.in.token.scope
faf93f27-aa4b-4577-a75a-2f6920473135	true	display.on.consent.screen
faf93f27-aa4b-4577-a75a-2f6920473135	${organizationScopeConsentText}	consent.screen.text
faf93f27-aa4b-4577-a75a-2f6920473135	true	include.in.token.scope
6b23af8d-fdf8-4968-881c-8b7c573466db	${samlRoleListScopeConsentText}	consent.screen.text
6b23af8d-fdf8-4968-881c-8b7c573466db	true	display.on.consent.screen
b11444a9-46cd-4d1f-9c7b-945561490332	true	include.in.token.scope
b11444a9-46cd-4d1f-9c7b-945561490332	${profileScopeConsentText}	consent.screen.text
b11444a9-46cd-4d1f-9c7b-945561490332	true	display.on.consent.screen
1246ad8e-5149-4c9f-b3c5-043502659916	false	include.in.token.scope
1246ad8e-5149-4c9f-b3c5-043502659916	false	display.on.consent.screen
37b20652-2240-4cfe-9074-9832585e0c8e	false	include.in.token.scope
37b20652-2240-4cfe-9074-9832585e0c8e	false	display.on.consent.screen
dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	true	include.in.token.scope
dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	false	display.on.consent.screen
1b2e785e-2476-4100-b4a3-40370fc918d3	true	include.in.token.scope
1b2e785e-2476-4100-b4a3-40370fc918d3	${organizationScopeConsentText}	consent.screen.text
1b2e785e-2476-4100-b4a3-40370fc918d3	true	display.on.consent.screen
320f1520-b55b-42b5-9d25-ba92efbc546a	false	display.on.consent.screen
18a131d4-b2cf-42c5-95c6-67aecb1f88e0	true	include.in.token.scope
18a131d4-b2cf-42c5-95c6-67aecb1f88e0	${phoneScopeConsentText}	consent.screen.text
18a131d4-b2cf-42c5-95c6-67aecb1f88e0	true	display.on.consent.screen
a381f838-94b9-46cb-8474-a04e3c552cb2	false	include.in.token.scope
a381f838-94b9-46cb-8474-a04e3c552cb2	${rolesScopeConsentText}	consent.screen.text
a381f838-94b9-46cb-8474-a04e3c552cb2	true	display.on.consent.screen
d38fe61c-420c-4202-a560-2f005d860f62	true	include.in.token.scope
d38fe61c-420c-4202-a560-2f005d860f62	${addressScopeConsentText}	consent.screen.text
d38fe61c-420c-4202-a560-2f005d860f62	true	display.on.consent.screen
8cae3849-dbf6-4004-bf86-ba8637c26b3f	false	include.in.token.scope
8cae3849-dbf6-4004-bf86-ba8637c26b3f		consent.screen.text
8cae3849-dbf6-4004-bf86-ba8637c26b3f	false	display.on.consent.screen
a642f163-4a82-4a2f-92ed-fc51e8ad99ab	true	include.in.token.scope
a642f163-4a82-4a2f-92ed-fc51e8ad99ab	${emailScopeConsentText}	consent.screen.text
a642f163-4a82-4a2f-92ed-fc51e8ad99ab	true	display.on.consent.screen
427153d7-e3e7-4cf3-aebd-1d25c667b5e4	${offlineAccessScopeConsentText}	consent.screen.text
427153d7-e3e7-4cf3-aebd-1d25c667b5e4	true	display.on.consent.screen
ed0dd91f-6fcf-465d-9445-ee9fff253107	false	include.in.token.scope
ed0dd91f-6fcf-465d-9445-ee9fff253107	false	display.on.consent.screen
\.


--
-- TOC entry 4282 (class 0 OID 17769)
-- Dependencies: 289
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
6d5de729-47f7-4d46-983a-51120b7008d8	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
6d5de729-47f7-4d46-983a-51120b7008d8	0d1b9de7-e54d-461f-b813-da5bfc391098	t
6d5de729-47f7-4d46-983a-51120b7008d8	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
6d5de729-47f7-4d46-983a-51120b7008d8	173317b9-8e02-4a8f-b456-02c25de72658	t
6d5de729-47f7-4d46-983a-51120b7008d8	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
6d5de729-47f7-4d46-983a-51120b7008d8	a14e6985-6c11-4cab-8217-2246d1ef253a	t
6d5de729-47f7-4d46-983a-51120b7008d8	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
6d5de729-47f7-4d46-983a-51120b7008d8	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
6d5de729-47f7-4d46-983a-51120b7008d8	faf93f27-aa4b-4577-a75a-2f6920473135	f
6d5de729-47f7-4d46-983a-51120b7008d8	4588b911-5b8f-4a63-a58f-027f81412204	f
6d5de729-47f7-4d46-983a-51120b7008d8	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	0d1b9de7-e54d-461f-b813-da5bfc391098	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	173317b9-8e02-4a8f-b456-02c25de72658	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	a14e6985-6c11-4cab-8217-2246d1ef253a	t
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	faf93f27-aa4b-4577-a75a-2f6920473135	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	4588b911-5b8f-4a63-a58f-027f81412204	f
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	0d1b9de7-e54d-461f-b813-da5bfc391098	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	173317b9-8e02-4a8f-b456-02c25de72658	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	a14e6985-6c11-4cab-8217-2246d1ef253a	t
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	faf93f27-aa4b-4577-a75a-2f6920473135	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	4588b911-5b8f-4a63-a58f-027f81412204	f
1b9a03f8-fcc0-4ada-8ce8-4b7fac02f35b	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	0d1b9de7-e54d-461f-b813-da5bfc391098	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	173317b9-8e02-4a8f-b456-02c25de72658	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	a14e6985-6c11-4cab-8217-2246d1ef253a	t
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	faf93f27-aa4b-4577-a75a-2f6920473135	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	4588b911-5b8f-4a63-a58f-027f81412204	f
91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
15c530bf-fc36-4c36-8494-d7aa47c90c31	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	0d1b9de7-e54d-461f-b813-da5bfc391098	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	173317b9-8e02-4a8f-b456-02c25de72658	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	a14e6985-6c11-4cab-8217-2246d1ef253a	t
15c530bf-fc36-4c36-8494-d7aa47c90c31	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
15c530bf-fc36-4c36-8494-d7aa47c90c31	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
15c530bf-fc36-4c36-8494-d7aa47c90c31	faf93f27-aa4b-4577-a75a-2f6920473135	f
15c530bf-fc36-4c36-8494-d7aa47c90c31	4588b911-5b8f-4a63-a58f-027f81412204	f
15c530bf-fc36-4c36-8494-d7aa47c90c31	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
3429101c-5b88-40e4-995c-b603e5ff503b	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
3429101c-5b88-40e4-995c-b603e5ff503b	0d1b9de7-e54d-461f-b813-da5bfc391098	t
3429101c-5b88-40e4-995c-b603e5ff503b	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
3429101c-5b88-40e4-995c-b603e5ff503b	173317b9-8e02-4a8f-b456-02c25de72658	t
3429101c-5b88-40e4-995c-b603e5ff503b	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
3429101c-5b88-40e4-995c-b603e5ff503b	a14e6985-6c11-4cab-8217-2246d1ef253a	t
3429101c-5b88-40e4-995c-b603e5ff503b	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
3429101c-5b88-40e4-995c-b603e5ff503b	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
3429101c-5b88-40e4-995c-b603e5ff503b	faf93f27-aa4b-4577-a75a-2f6920473135	f
3429101c-5b88-40e4-995c-b603e5ff503b	4588b911-5b8f-4a63-a58f-027f81412204	f
3429101c-5b88-40e4-995c-b603e5ff503b	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
2d483f57-f672-417b-a3fa-c784fc389ff0	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
2d483f57-f672-417b-a3fa-c784fc389ff0	1246ad8e-5149-4c9f-b3c5-043502659916	t
2d483f57-f672-417b-a3fa-c784fc389ff0	b11444a9-46cd-4d1f-9c7b-945561490332	t
2d483f57-f672-417b-a3fa-c784fc389ff0	a381f838-94b9-46cb-8474-a04e3c552cb2	t
2d483f57-f672-417b-a3fa-c784fc389ff0	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
2d483f57-f672-417b-a3fa-c784fc389ff0	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
2d483f57-f672-417b-a3fa-c784fc389ff0	d38fe61c-420c-4202-a560-2f005d860f62	f
2d483f57-f672-417b-a3fa-c784fc389ff0	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
2d483f57-f672-417b-a3fa-c784fc389ff0	1b2e785e-2476-4100-b4a3-40370fc918d3	f
2d483f57-f672-417b-a3fa-c784fc389ff0	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
2d483f57-f672-417b-a3fa-c784fc389ff0	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	1246ad8e-5149-4c9f-b3c5-043502659916	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	b11444a9-46cd-4d1f-9c7b-945561490332	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	a381f838-94b9-46cb-8474-a04e3c552cb2	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	d38fe61c-420c-4202-a560-2f005d860f62	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	1b2e785e-2476-4100-b4a3-40370fc918d3	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
ad017007-5668-4635-89c5-125490162661	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
ad017007-5668-4635-89c5-125490162661	1246ad8e-5149-4c9f-b3c5-043502659916	t
ad017007-5668-4635-89c5-125490162661	b11444a9-46cd-4d1f-9c7b-945561490332	t
ad017007-5668-4635-89c5-125490162661	a381f838-94b9-46cb-8474-a04e3c552cb2	t
ad017007-5668-4635-89c5-125490162661	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
ad017007-5668-4635-89c5-125490162661	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
ad017007-5668-4635-89c5-125490162661	d38fe61c-420c-4202-a560-2f005d860f62	f
ad017007-5668-4635-89c5-125490162661	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
ad017007-5668-4635-89c5-125490162661	1b2e785e-2476-4100-b4a3-40370fc918d3	f
ad017007-5668-4635-89c5-125490162661	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
ad017007-5668-4635-89c5-125490162661	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	1246ad8e-5149-4c9f-b3c5-043502659916	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	b11444a9-46cd-4d1f-9c7b-945561490332	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	a381f838-94b9-46cb-8474-a04e3c552cb2	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
89105ce1-82fb-49c7-a1b4-9761fbf076e8	d38fe61c-420c-4202-a560-2f005d860f62	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	1b2e785e-2476-4100-b4a3-40370fc918d3	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
89105ce1-82fb-49c7-a1b4-9761fbf076e8	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	1246ad8e-5149-4c9f-b3c5-043502659916	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	b11444a9-46cd-4d1f-9c7b-945561490332	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	a381f838-94b9-46cb-8474-a04e3c552cb2	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
bd7aec72-c51e-41fc-afe5-3a95bb122794	d38fe61c-420c-4202-a560-2f005d860f62	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	1b2e785e-2476-4100-b4a3-40370fc918d3	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
bd7aec72-c51e-41fc-afe5-3a95bb122794	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
468a8d58-a07a-4288-b293-8e740a5c7922	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
468a8d58-a07a-4288-b293-8e740a5c7922	1246ad8e-5149-4c9f-b3c5-043502659916	t
468a8d58-a07a-4288-b293-8e740a5c7922	b11444a9-46cd-4d1f-9c7b-945561490332	t
468a8d58-a07a-4288-b293-8e740a5c7922	a381f838-94b9-46cb-8474-a04e3c552cb2	t
468a8d58-a07a-4288-b293-8e740a5c7922	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
468a8d58-a07a-4288-b293-8e740a5c7922	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
468a8d58-a07a-4288-b293-8e740a5c7922	d38fe61c-420c-4202-a560-2f005d860f62	f
468a8d58-a07a-4288-b293-8e740a5c7922	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
468a8d58-a07a-4288-b293-8e740a5c7922	1b2e785e-2476-4100-b4a3-40370fc918d3	f
468a8d58-a07a-4288-b293-8e740a5c7922	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
468a8d58-a07a-4288-b293-8e740a5c7922	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	1246ad8e-5149-4c9f-b3c5-043502659916	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	b11444a9-46cd-4d1f-9c7b-945561490332	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	a381f838-94b9-46cb-8474-a04e3c552cb2	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
36dc6c95-b2b0-409d-92b8-75f9194ebc45	d38fe61c-420c-4202-a560-2f005d860f62	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	1b2e785e-2476-4100-b4a3-40370fc918d3	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
36dc6c95-b2b0-409d-92b8-75f9194ebc45	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	b11444a9-46cd-4d1f-9c7b-945561490332	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	1246ad8e-5149-4c9f-b3c5-043502659916	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	a381f838-94b9-46cb-8474-a04e3c552cb2	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
de942f08-1fe1-42f7-a73d-8586a3e7f12f	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
1c573beb-cddf-487d-827c-572abdcda65a	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
1c573beb-cddf-487d-827c-572abdcda65a	1246ad8e-5149-4c9f-b3c5-043502659916	t
1c573beb-cddf-487d-827c-572abdcda65a	b11444a9-46cd-4d1f-9c7b-945561490332	t
1c573beb-cddf-487d-827c-572abdcda65a	a381f838-94b9-46cb-8474-a04e3c552cb2	t
1c573beb-cddf-487d-827c-572abdcda65a	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
1c573beb-cddf-487d-827c-572abdcda65a	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
1c573beb-cddf-487d-827c-572abdcda65a	d38fe61c-420c-4202-a560-2f005d860f62	f
1c573beb-cddf-487d-827c-572abdcda65a	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
1c573beb-cddf-487d-827c-572abdcda65a	1b2e785e-2476-4100-b4a3-40370fc918d3	f
1c573beb-cddf-487d-827c-572abdcda65a	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
1c573beb-cddf-487d-827c-572abdcda65a	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	d38fe61c-420c-4202-a560-2f005d860f62	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	1b2e785e-2476-4100-b4a3-40370fc918d3	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
de942f08-1fe1-42f7-a73d-8586a3e7f12f	37b20652-2240-4cfe-9074-9832585e0c8e	t
\.


--
-- TOC entry 4260 (class 0 OID 17288)
-- Dependencies: 267
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	401ad7e6-172c-4e37-91a0-3399eac35374
427153d7-e3e7-4cf3-aebd-1d25c667b5e4	a0bc4abc-d628-4fea-aa8c-a8797e654c24
\.


--
-- TOC entry 4278 (class 0 OID 17524)
-- Dependencies: 285
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
705e6f10-6053-4be9-84ff-3ff94870dfb2	Trusted Hosts	f63a6b35-ce9c-442a-bf20-081b5ada87c0	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
9cbd942e-3db2-4563-8b6b-bb93658d0c51	Consent Required	f63a6b35-ce9c-442a-bf20-081b5ada87c0	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
ad20a34f-55f8-46f5-92d3-f3040b1a9cd1	Full Scope Disabled	f63a6b35-ce9c-442a-bf20-081b5ada87c0	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
7e683129-17aa-4c06-9b44-efff6bc228ff	Max Clients Limit	f63a6b35-ce9c-442a-bf20-081b5ada87c0	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
324e3646-19f7-4a6b-ad82-432c10b44e17	Allowed Protocol Mapper Types	f63a6b35-ce9c-442a-bf20-081b5ada87c0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
f9f9a187-123e-41b6-a9f3-d21ed4970989	Allowed Client Scopes	f63a6b35-ce9c-442a-bf20-081b5ada87c0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	anonymous
03250481-cc90-46de-a94a-c5a3326d2b3a	Allowed Protocol Mapper Types	f63a6b35-ce9c-442a-bf20-081b5ada87c0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	authenticated
a384443c-dfc8-4d60-aa48-bdb96f23b0bd	Allowed Client Scopes	f63a6b35-ce9c-442a-bf20-081b5ada87c0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	authenticated
8e2510cf-6878-4f3c-b1fe-092a387ee1fc	rsa-generated	f63a6b35-ce9c-442a-bf20-081b5ada87c0	rsa-generated	org.keycloak.keys.KeyProvider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N
ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	rsa-enc-generated	f63a6b35-ce9c-442a-bf20-081b5ada87c0	rsa-enc-generated	org.keycloak.keys.KeyProvider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N
e74c2981-5271-4db1-9310-4577800f6b09	hmac-generated-hs512	f63a6b35-ce9c-442a-bf20-081b5ada87c0	hmac-generated	org.keycloak.keys.KeyProvider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N
cb3f85e1-af28-444c-8d08-6c99b403b42c	aes-generated	f63a6b35-ce9c-442a-bf20-081b5ada87c0	aes-generated	org.keycloak.keys.KeyProvider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N
68fff03f-1574-4b3c-8320-709c85d65c0c	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N
45f70439-82e0-4103-af0d-c0bcf1ef23a4	Allowed Client Scopes	52cc0a6b-3160-4f03-bd34-7be149371f52	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	authenticated
e0112c66-74bb-4862-aeef-4ee2b40bbd01	Max Clients Limit	52cc0a6b-3160-4f03-bd34-7be149371f52	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
604ff0fa-9431-44a1-a3be-ed3139184162	Allowed Protocol Mapper Types	52cc0a6b-3160-4f03-bd34-7be149371f52	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	authenticated
5753341d-1b94-4e20-a1ed-79232a5d1917	Trusted Hosts	52cc0a6b-3160-4f03-bd34-7be149371f52	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
9449306e-c949-47ab-9469-f1f391ac3015	Consent Required	52cc0a6b-3160-4f03-bd34-7be149371f52	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
b003f432-6238-4033-8510-3e5d4544f68f	Allowed Protocol Mapper Types	52cc0a6b-3160-4f03-bd34-7be149371f52	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
29aa572d-77de-4272-a3f8-8dc49d8ba97f	Allowed Client Scopes	52cc0a6b-3160-4f03-bd34-7be149371f52	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
9bc9461a-87e8-4a1d-b812-0d2e220a7920	Full Scope Disabled	52cc0a6b-3160-4f03-bd34-7be149371f52	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	anonymous
843a0474-5818-43d2-9a76-b7c6f61f0632	aes-generated	52cc0a6b-3160-4f03-bd34-7be149371f52	aes-generated	org.keycloak.keys.KeyProvider	52cc0a6b-3160-4f03-bd34-7be149371f52	\N
2aac972f-6bb4-4c2c-a5d5-1524fbb39e0d	rsa-generated	52cc0a6b-3160-4f03-bd34-7be149371f52	rsa-generated	org.keycloak.keys.KeyProvider	52cc0a6b-3160-4f03-bd34-7be149371f52	\N
84d83390-6d3f-4d27-ada6-ae332d7963c4	rsa-enc-generated	52cc0a6b-3160-4f03-bd34-7be149371f52	rsa-enc-generated	org.keycloak.keys.KeyProvider	52cc0a6b-3160-4f03-bd34-7be149371f52	\N
8b872b98-ac0a-46de-80a9-243faacc8226	hmac-generated-hs512	52cc0a6b-3160-4f03-bd34-7be149371f52	hmac-generated	org.keycloak.keys.KeyProvider	52cc0a6b-3160-4f03-bd34-7be149371f52	\N
5875653e-5a41-491b-93ba-db6d80d7e466	fitcontrol-user-provider-provider	52cc0a6b-3160-4f03-bd34-7be149371f52	fitcontrol-user-provider	org.keycloak.storage.UserStorageProvider	52cc0a6b-3160-4f03-bd34-7be149371f52	\N
\.


--
-- TOC entry 4277 (class 0 OID 17519)
-- Dependencies: 284
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
2c54643f-fd82-4299-9087-a85c1682a51b	705e6f10-6053-4be9-84ff-3ff94870dfb2	host-sending-registration-request-must-match	true
a31b5d2b-9ff3-416f-9a7b-541b0e134db2	705e6f10-6053-4be9-84ff-3ff94870dfb2	client-uris-must-match	true
858b4812-e69a-4243-85e7-a407da79c481	a384443c-dfc8-4d60-aa48-bdb96f23b0bd	allow-default-scopes	true
2ea5ccad-f9b3-460e-b056-c9863c57173d	f9f9a187-123e-41b6-a9f3-d21ed4970989	allow-default-scopes	true
7eda393b-f767-4215-8e3b-c08cd186cbd5	7e683129-17aa-4c06-9b44-efff6bc228ff	max-clients	200
b18ab149-9fa3-433a-a56b-dd425e6e0c5e	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	saml-user-property-mapper
ef7fbd7b-2c9f-49a4-a044-cf35b0c06674	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	saml-role-list-mapper
e3607c44-60a3-4b38-b5ea-c839b774ee9e	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5663486b-f9a9-41ae-b7ba-9cfbba69bfac	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8e3af525-a057-4ac5-9acd-c51e34fee3b3	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	oidc-full-name-mapper
1ae028ff-9c0b-43f5-87c4-82bc9195b35d	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	oidc-address-mapper
92af7527-5371-4339-89e0-79e1493f2682	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
807456a5-5247-43d1-8295-637cce38ce98	03250481-cc90-46de-a94a-c5a3326d2b3a	allowed-protocol-mapper-types	saml-user-attribute-mapper
c8bb59a8-f644-4419-ba88-45459c55aab7	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	saml-user-attribute-mapper
adb7106c-8002-42b1-8855-ed7be64a53bc	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8ce51535-f9ec-48e6-b973-d847ddcbebe0	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	saml-role-list-mapper
66459adc-38a6-4bb9-b374-0ef4a7024893	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	oidc-address-mapper
79f2ebf0-cbd1-4be7-b93a-92e0de2e552a	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	saml-user-property-mapper
cb72508a-ae68-42c5-9938-98f8e08d1363	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fe55cdbb-5a8e-4f87-ae06-8644befdd61d	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
c857a82e-6134-4eec-9f24-139c0eee627f	324e3646-19f7-4a6b-ad82-432c10b44e17	allowed-protocol-mapper-types	oidc-full-name-mapper
e7801b25-6237-4bd4-9a63-2c86737ffe50	68fff03f-1574-4b3c-8320-709c85d65c0c	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
de63f48c-a269-496c-b0b6-f03992fe7274	cb3f85e1-af28-444c-8d08-6c99b403b42c	kid	3a227dd9-dbc0-4b9d-90c8-d54bd17d0aff
71b218ab-c321-4b88-9e66-80b6031edb50	cb3f85e1-af28-444c-8d08-6c99b403b42c	secret	k2_E_8vIvO8qUETW0dP2bg
9e1ad68a-c502-438e-ae29-712d5d9284d6	cb3f85e1-af28-444c-8d08-6c99b403b42c	priority	100
2a37f517-5802-4a38-86c0-6ed2e36da0f7	8e2510cf-6878-4f3c-b1fe-092a387ee1fc	certificate	MIICmzCCAYMCBgGY0KThaDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwODIyMDcxNzAzWhcNMzUwODIyMDcxODQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCHuF1vLXH8lNw16xVDj3hrUaO9iqGeDkWseQsIGq39fB6Y2xfouxhEhPHYu0kGwrpC3kWBll/jOAxi/aWZp8pOF3dK6KqX7L6RyCSeceZ8IOZjCSIDgP/0G6v8op6z9Z8U+6ng9Hd04MBHg4vpRLhdjBN4hjtLvxSkrtlq/E0mN2mDxOCEx4TZwBjsO6e70OOO4ZiqlsCBPAXfs27IkgWa3nuPCTjnp5UZfU6BeVx9yvusI51kibGiTsLTz3qczPKiPDjdN7UgCNF6BYE+EWW7NFZdYwkIh3562cWdjxE/Ch3COG9W3+JpeSseKorrmGKmbovx44XJe3v6Xe/eYStAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADOhsUq33isdxooKLWRBVwy8GFrEm/ypB62mLwk5LS8zz38dPWN24DZC9loKWoWGQWHO9uGO8oe/uBE/BnGTiUfJU0EYozu6T8lLL8s2BxwjU/pmq/icmeXYt1OgFkR3Ut8u+ciYIabn029EYCXGFCBwpYOsS/OBSaDFdbZXonKGYQDGrkER8RxQB2GShi67TrOu/jSJzsLRntCWmzRDOpWeZZVRYj7lvMGRFszc+oq06eFXL0buZpbn3qIC3WXGqVq4lhQIBFvfVlATQGbSjSLGmtxsCPMDFDXthVUy6yMIwDmIb95X3g6wLc6rObIZKbLtj90iqk2S0RSXkalaQqk=
0fd021c5-464e-4a57-ba9d-ee959cbae3d1	8e2510cf-6878-4f3c-b1fe-092a387ee1fc	priority	100
9a0ab434-8e5e-49a2-8c83-154a15107cc4	8e2510cf-6878-4f3c-b1fe-092a387ee1fc	keyUse	SIG
0969958d-cca3-41c1-a728-63efc1a82bfd	8e2510cf-6878-4f3c-b1fe-092a387ee1fc	privateKey	MIIEowIBAAKCAQEAwh7hdby1x/JTcNesVQ494a1GjvYqhng5FrHkLCBqt/XwemNsX6LsYRITx2LtJBsK6Qt5FgZZf4zgMYv2lmafKThd3Suiql+y+kcgknnHmfCDmYwkiA4D/9Bur/KKes/WfFPup4PR3dODAR4OL6US4XYwTeIY7S78UpK7ZavxNJjdpg8TghMeE2cAY7Dunu9DjjuGYqpbAgTwF37NuyJIFmt57jwk456eVGX1OgXlcfcr7rCOdZImxok7C0896nMzyojw43Te1IAjRegWBPhFluzRWXWMJCId+etnFnY8RPwodwjhvVt/iaXkrHiqK65hipm6L8eOFyXt7+l3v3mErQIDAQABAoIBAB2qSPOsa047RM+bkfkslD3a9EuwKFcE49qJRHCO4qgqxD172Kmz1PJPqCiiAFHydQQgrfg077PrlC5WMJCS7bNHqyZ7vt/RAKG5QWvJAv0OMZpDPajyFV/gWy31v35dqS42SGQeo7GF24EN9gaHcD92x5J7YSpL8iDvTgaPVGzgRGI1O2P8H5pKJHXo5szhRmLeWoS0ncQVEhChOlEzElu2i77p74dgp6GQ+frPS5kSLNnGRc+C6xjzKjbCwaqCFoPsWVyZx/Vj21kcK9Yv31KWeoNTbUsoPeDC9FwoSrEuBqrr22qBZaZZwNb7nJXvPeN9tDU5mrBPoQLpYAOL9rECgYEA5fW7gqMlxWy2HP2ICOOups2SECK8qPQpXS73STgXnwEvmwAAQ4ffNXPeATXMXvu05eUAMnBtRrW3v7ZlzMmT+gJ+splxUj3iQUrtY/PS4F2XEFy8Vw5pzegEJFdZtH9rZxMzqZhnZhrA/g3atxknGw6zlCF7TEmbniTvacME9xECgYEA2Bo1wl066/fIjspuyeNoJf4PTmlO78+VHHQUIvQm6QrIKDpUsFFlrXBY7rl1RSTpDGfJ5Ipmi40yqRtjN2rqbwFr7IIG9cYiC9mlr/fcYvGT1shwn7D6CSAP4wltHYWOGdoDfSmhK0ZbWiY9FZJ6f9SgFlMqAEeFqgQOtBVqi90CgYAnds9yMOt3gRuTyBLDa8d6SscpS7zSxewfWMMJZr3vBLYVxJ9G95dfxf2weXoURuAZn/4zqcWnH+Jj3TqFNYbWnfz+S4T+Fy6wA9rPj3V+GbGmFjQgQJH5yzqCvhbf+goFi28PSN9dz3OVZe1GBOQIKbK51jEhu3QgZLhNjzFX8QKBgBEQaMRTRk7RvxV/aKYqfdPaLu07JY+MLbMUe26TJutp/YonqP5PPx8l6u/W1yrBkmF3ZJrWTuigGqr9zaTXnXFshFAlqFUJ8zBKXGn7wXxSpSDlrPb/K49C594+pU4aeLET5QiiG+bl5FrHADXO3jtv18BLitqAy040idCwjDxFAoGBALYh/z7ooN2Nw4XzRusIBdwpfhKKo9tq+rqzT3Ght8F4vVPnD3DzfXFWyqejYV0lGAP1Au99+1B6CMUUP5EA+iyt8imcLOtvRHHKQQkOuRDep6zGxeuACodv2RkUhyZrJd+mjIi3SLkn6pYV2G6/qTTjebfwty5OVn4q52NgCEF2
6415ea8c-9993-4b91-976b-f71ec47a07b6	e74c2981-5271-4db1-9310-4577800f6b09	secret	um6MiAVLBeF6Vpb9_X5ZXKnqNCEpaD9qENCfZx8cCs1fDOxMm3Bj6h2NPP88dILCpi8sONu3gcU-80t2jD1MaoOxfvGC8qkPK3ONUZtOG9K8Lg9s4B2nAlH9uhX6FYXLLgGuDNVk6bwQOJBXWiibW7GvCD2qEqbRZjf6hgiCIcU
130f5e91-aa51-4368-a085-2d0d65a2a359	e74c2981-5271-4db1-9310-4577800f6b09	priority	100
d31b8f99-bc15-49ac-88ec-715ce2969a78	e74c2981-5271-4db1-9310-4577800f6b09	algorithm	HS512
da51834d-4a56-4283-be17-c92788788f13	e74c2981-5271-4db1-9310-4577800f6b09	kid	ec64b39b-cc4b-4dc4-bc81-85503b9b98cf
3913fcd0-2fd8-419b-aed6-3d03c6f5be1b	ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	priority	100
013ec8f0-d345-4972-89c3-82107833a56e	ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	privateKey	MIIEpAIBAAKCAQEAwU0xGJn2sL8YjUrusRyU6M3O/Oyz0s7f/B1UxXyvUhRGgwZLOxhR2BsJFxy606JO1rtFxdCQFx9A2X07Mz0jOMrw9QYMg6RNzMrsswyCVxshjsZ4/WCU2altxvN8cm4ZGO1pQVClB3IqexgkzcbsGQFtJRiW25K/0WbgiqiohL30Kj2KVvLetFDPezUSiXJE5pMRKr6U8iWlOfyINwtAN45MFsMHCwU9RydiEAtnYKr9yqRjVYuv68GtN2t95jTuoevRmxfnp8/QRUbHp24bdZnPaD4Xws28v29fbzLSJRIAplqU5O4FzbgctEYlXWtLNZ7XY/LDoDspEbc1hO3zUwIDAQABAoIBAEnh0CcgCdsKXz756fuF+iB1MW0Yp66mZZP+Pf1xp60OlNjVmgGPTRD1XGcaEwp62flXANcX3UsJJgc6x1rRPlohrzFny3axYQ8qbIgO+u6CLzRcBbiKprn++Td2rxUpoawWagmN4lXTPAtqcf64zlrMYcQw/tAT6f8GfEJjLm31ZZpah52p99d+tkASOoVMSGYxA29Z+0QBt5Q11187MTQZo+8OLutASY+5PeiUt7GQcGLsNI7z76Et7N4PLwsUxRCTof9UB9U431rSjB9CirL7oGFeL4GbWnuX62LyehbjSEM5O1K6juAKzOulT46+v1GqMzvwMNiTEsHrGInTHpkCgYEA9tBdQ9ZLUN27spIkcn2Um+SsrSNYPxNCoKH4d3QzPyXgRMtueSF3nW+y+B3VAsAd2djRrgUPH0m1bOFA7kp9SuZNmdHr0EJo1sEGNPqemXzAtTzPAXsgF+d3T46tp/2K+Vyx6yABwPLXc7jJjiewMnaUkSDKvkYHOBDoz2DYXLcCgYEAyH72hksq3YIjsb78BANAn4ySDJVHgXV9CYAJGRRVAAtIoChOJY1BK7On/NGyRDoa4bSO/F9KTrPqurXtRVENWlw1Hr9PRu/TE1sWUvx1ToJYHL7CXFHOxrFVWaAtOLGV0LKc5Pa0orBIuF58M0INkjdyTfd+WeeQ+woL7cLAukUCgYAI0PaT5sK398OtpETDBjNZwjhc0udjEWgO3tpGQhNWjR7OtkmS8BwatpO5Ay/Jsl0em/0ZbzrUDkj5w64TFPwWwdVBylrXDJg8G5cCK3Wg2/DySGLIlcJWuEDtyZXwa0EcmTANyw3k+4ewrYgdmNNVaiDyci5rz4qQeSInzjjMTwKBgQC7s7lCUp7nz41xO5aefxkCBc05gIv4FDEiMr7Rvuow519vqSw4Fb0cl84+b2cQXsGJ6ssuVFuxwNiRQf7HNTFmFgsZJQuoIqAeb9k/ieCcxoSNLL2zRldqRtzb0oxjlkXmo0ElTh4gbR83lCV8q2sfJ0+Y1Ipyyss9atNuHTTnbQKBgQDoyLzasTggv9KNn0FevYNpJqM/xZZ92rYRj13muYbd1RXwlS6YGZZFBGOPX+FnOqJfT+SG8sqrXZY60/E2I+LxXpROrzskeiibphDWNBPh1sknWFwLkkJMkZVUH03inYOf/fkIo/5AfPCGQjEvU0Zf+SRpHlZlgZc4cS7k6XNMGg==
f741203e-bcfa-484a-b836-2bfa16c93a41	ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	certificate	MIICmzCCAYMCBgGY0KTh8zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwODIyMDcxNzAzWhcNMzUwODIyMDcxODQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBTTEYmfawvxiNSu6xHJTozc787LPSzt/8HVTFfK9SFEaDBks7GFHYGwkXHLrTok7Wu0XF0JAXH0DZfTszPSM4yvD1BgyDpE3MyuyzDIJXGyGOxnj9YJTZqW3G83xybhkY7WlBUKUHcip7GCTNxuwZAW0lGJbbkr/RZuCKqKiEvfQqPYpW8t60UM97NRKJckTmkxEqvpTyJaU5/Ig3C0A3jkwWwwcLBT1HJ2IQC2dgqv3KpGNVi6/rwa03a33mNO6h69GbF+enz9BFRsenbht1mc9oPhfCzby/b19vMtIlEgCmWpTk7gXNuBy0RiVda0s1ntdj8sOgOykRtzWE7fNTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACHFzV26bOTUZChrWUITsmuHmJMFnIsBIKwTpNqIVWT5ZpvsgOyZit4n9CZjXf/uez9KFBkojgVcQrgD9B98IKyBezDTbQIuAn3WuM6f3PyKFbRWQad42L9trKL9I/sCLLBt3Kp3AigULpQeCquaA9RoRGLxa4C8BR/qpLxbeEFyl7zNdX7jcDJ22CHgggAR4QjuWinyLEqwhgOZ0mSZAsIzr0JTrxKxhxV8IrxEIbGDq8RDa9JzHes4jAqd5YVcdDvDD3uIdbnjYcVnf2C/Oq45y0WK9kobJa0DyWaiO+eAygLDSDZFoRBEyFwUDqdA52IqlnJ70i8i+akPVw0EOQI=
8aceed11-94b4-41e7-b10c-ef81d94bc295	ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	algorithm	RSA-OAEP
86f4c1e6-4377-4861-8322-b1cf3363c76b	ba49c2af-5b36-4ec6-8932-e8d496ac7cc8	keyUse	ENC
25fe8bed-ee6e-4997-b450-211007ae2907	5753341d-1b94-4e20-a1ed-79232a5d1917	host-sending-registration-request-must-match	true
fb8b097c-5f1e-4467-bb8c-87c957eacbdc	5753341d-1b94-4e20-a1ed-79232a5d1917	client-uris-must-match	true
ddcb0bdb-ef22-4596-8188-316828fd1e4e	45f70439-82e0-4103-af0d-c0bcf1ef23a4	allow-default-scopes	true
4fe17937-a84d-47db-b48b-18a24e8c5c0e	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	oidc-full-name-mapper
3cc06242-9b6e-4721-a18d-2367761b4df5	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	saml-user-attribute-mapper
25389b0f-b863-4db3-aeba-97926a81679a	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
22c291fc-5256-4ef7-9fcf-ae1d2ccfef46	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	saml-user-property-mapper
e079b51f-d568-418a-9e35-4ce7ffd12f82	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	oidc-address-mapper
ec765e1b-d2c7-4346-a462-7d369495ae2b	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
77607cb9-2558-4996-94e9-e042e7a26947	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	saml-role-list-mapper
6d51b3b1-d86d-4789-ad53-ffaebd2a5ab5	b003f432-6238-4033-8510-3e5d4544f68f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9895db51-f568-4a7e-a18d-ed37efd98aed	e0112c66-74bb-4862-aeef-4ee2b40bbd01	max-clients	200
79c05648-cf58-4e17-9ad3-6b996b28946f	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
75e110c5-e8cd-414c-96d3-c6f42f4c426a	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
4fb05702-babb-4e24-b976-aa863c952a09	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	saml-user-attribute-mapper
1c7265b6-ee16-4330-8b19-3ffc91067f45	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	oidc-full-name-mapper
629cf4fb-a7a0-4e4b-9920-cdfe14b4b9f1	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
daaeb6d9-b654-4f0f-951b-92cb990c846d	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	saml-user-property-mapper
ead4899c-eb5d-4d0e-b1b6-1902bb1b3842	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	saml-role-list-mapper
35fe016f-e767-427c-b947-3fc513ef8935	604ff0fa-9431-44a1-a3be-ed3139184162	allowed-protocol-mapper-types	oidc-address-mapper
9e228459-c1c8-4577-9a18-2f22d1b0fbec	843a0474-5818-43d2-9a76-b7c6f61f0632	priority	100
8a503c90-ba33-41c6-8b65-140153364718	843a0474-5818-43d2-9a76-b7c6f61f0632	kid	e91ca4e6-02ff-49a7-b105-ff32c68afed4
8bf75453-a490-414c-8cf4-6ead2f1c7d7d	843a0474-5818-43d2-9a76-b7c6f61f0632	secret	IC1mZK6eI3U7V_H_SF70dQ
f185d69b-8c6c-43a7-baca-7e4d75fd8b47	2aac972f-6bb4-4c2c-a5d5-1524fbb39e0d	certificate	MIICozCCAYsCBgGY0LpK/jANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApmaXRjb250cm9sMB4XDTI1MDgyMjA3NDAyNloXDTM1MDgyMjA3NDIwNlowFTETMBEGA1UEAwwKZml0Y29udHJvbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKl5mVa+EO4vUnZ/zFDZtvNLjfF6IxpKyX8n9SajORXbH+wl7ypS0R22hwJlI2XigMCxvRDdDepao1AjjKc+n7LpNWLI1aPk5uSG9KOfjDpA0aDCz9nFEe7AFRstu1DafZUEr0qkidfj5ZJb3KGRMydSKGZY3AWCzKM0T2OZiHdA70d6+JiKM1IBMwGK7Tq4cFwCdg5lQTc3KMF25/KOpKi9GA92G8b832PMaA0hLFSqsVGm6OmxxiCAsKFmn3Wg6feSKVX4OeC3UA9dfJLbSKBFGyPxG7ctnuP4ymyJaKj1iRxPmmTxeu2m4ZFlpdhdKNxcqLQHWLWA6UnTTL8vbA8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAdAyfygqS1s3oHT1ArTevgeRHkbM4nWZG/pc2zLY3MISMsIxkFM553BfpfD+x8xGqL52jwuslLLWUJ6ubdibos1g1vnWXb54N9FlrxAE2A6RmDjVwtiQIp0SuRQwL4I4Or5J9+X9TT60y1SsfwjqA6NjBkw5+MQWs6vjQETf2hrDNw6xz/2IDAdn8feRIFCu7QLNUo2MbDwmQU90zDyEEsLeusDAffXLN+4jxlCDtOQMYkuZ/0nSsxyrh9ztk84RqZp6RDrUIUOP6Bqy+ZhDM0b83iTuyysTluAGY4No2J97UIYqOrq9RVhJp257glMszYoR3Zj92eE29r8qGdlIPqg==
b5f9d94c-698f-4544-9356-c3d080037cc5	2aac972f-6bb4-4c2c-a5d5-1524fbb39e0d	priority	100
805a8d96-929d-4117-947d-6fe1660b731f	2aac972f-6bb4-4c2c-a5d5-1524fbb39e0d	privateKey	MIIEoAIBAAKCAQEAqXmZVr4Q7i9Sdn/MUNm280uN8XojGkrJfyf1JqM5Fdsf7CXvKlLRHbaHAmUjZeKAwLG9EN0N6lqjUCOMpz6fsuk1YsjVo+Tm5Ib0o5+MOkDRoMLP2cUR7sAVGy27UNp9lQSvSqSJ1+PlklvcoZEzJ1IoZljcBYLMozRPY5mId0DvR3r4mIozUgEzAYrtOrhwXAJ2DmVBNzcowXbn8o6kqL0YD3YbxvzfY8xoDSEsVKqxUabo6bHGIICwoWafdaDp95IpVfg54LdQD118kttIoEUbI/Ebty2e4/jKbIloqPWJHE+aZPF67abhkWWl2F0o3FyotAdYtYDpSdNMvy9sDwIDAQABAoH/Fi1TY4Z7sK+AmwEeO3ZB+pRofrD85vPiakFQUz4IulNyWfSc12z+8GRyRl31w99f+ddIZmyG5aP2uwXr4fbP7xmVYtflHQ1XKZB/cunt77GLvP3BNT4UmqmIGYZifLIavOVgCuR9JUMtR3m95Waaywp1Pu9h21bCcJjnyqDMus4NmwedMNxNk2R8U+YdjM4k8CybiYbU8oCQEjaSjkpqghJI6T+d9WQ2pF8TO6vCkLKvOO7oHYliFftSSWSbCPU8KbjmRUpwAiQrbWLn6dGxYRCdyW9Me2w7LTT432JLHsAmd+7BdID5VsszOn8xBjoJK+tXhI7ydaNMJgJ8JUfhAoGBAOqm86KRIkC5qh4hKVwC/TAuLZh0WroZyHTgIpPRpNVz7dYpnNYPoaIiEYmQiCG7Wh2P1r/0Mi0Wi8zSSaql50IcFSClGCBLtluW5UOMTz4pVUledr0TcCKJbOpqbxq8lSuOJPwb5HdK4b/otzu242lqR1LNGZRLWyw0amve8XphAoGBALjkq93lNlKaqqwHeO1PQ1FsWj9UPTNBFr7IS5bZXKa20NcLzZgxj2rZ6uGCW/Wwj5/UBKp/e8nGNo2yum+hY4hdubDdRaxPoBKDgSOhe/IGKSrI6IV71popWRESfGD/JPxb3HzBVic5j1b7PGYl6+pAwSxaUWDvOrNA6cTxUNxvAoGAbSLDM/wOk04HGkZQJzRYr9z6ZerP+7hcLEfGrTuXT5PArZfjEwhoI7F2uKWZOx8ZNaCdv9+CqsfOs6+mhZDt8yh+hxViGDs+kHCpJvaOMJomyZ3+2ce9osKJ/qkMDcJiGsTc3MjYRMd2IbzJ5CMWuAOvMoqj9/3oZLHoQU2KwGECgYBZRjCmJ7KfGAcooUMGcqsyeXrp8SbLxLXS0KuO3s0ZwlP8Qbq3rdZt5WLAGE2GyAXRSnImUP/YYVid+pqCpA6HHZo3h9/IX3oO9mg4aBSMu+TMv81mBnGMZkKXN7HOs+OL5l8D7eZHckd/3DdBqzXKGhIr9EAu6dQSEVnOuiYtCQKBgFw6hknMmQKOd52AExq0SPkruQD1x56jS+QdDmmTTBXPDhGxPaEpflxxXxGoJG7/cHbpQmSX7OQzpgzc6G4Cp0MD3kjdNWjt2sFMiYGlH0H1xIW4zlfqcWFiRJn0zVdiGLYP62DlZ2BQzNmgFCapTl6rb6CFI//P2Ha62l2vypnc
bf8fcba7-1376-4f05-9bd1-4a8d3bd69b45	84d83390-6d3f-4d27-ada6-ae332d7963c4	certificate	MIICozCCAYsCBgGY0LpLizANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApmaXRjb250cm9sMB4XDTI1MDgyMjA3NDAyNloXDTM1MDgyMjA3NDIwNlowFTETMBEGA1UEAwwKZml0Y29udHJvbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJXmZ4371r82sMHzgteOTjaxQfUjnBN9WvdsfnTcLAVID54OoYlHzB8yQEz3ogvDCQHvQF6BnV2MlQ5O09TjONPQRRjVf6KL1JKhcvrshpnIEBD8UQcgvpfBlx7UgFyasq3WKVUkLH8fIqYiyZC4rN5TuljZECy9guZ4nry7Dw2106v3x5IFd1crbsvOPiB7nN2GekyvgE+Igvm+d8M0eY6tHyYIVR6jldRvPNiM0wkyZJIAh/vy6/+JcBrJ/w65D5/XWXiNQ9Etb7QT4JMYHAbWQy7avR1VsZSlIsWk0w6uqIHkwSKYO5K04BQi1B73Ripu0NVcg2ILeRGdZiOCeikCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAdeW1HItHrBkbcxXwaT/q5sw630aWtA6bGyCudhy9fVy2xuUxrHQcUfoXZLEWEnal1JpPp+GtjK3xYjIB42aq6yI3CgXCb/Oaw4E3BDerElQgtyVjcZaycMFgynyuCYDjBRwAN41L4PQmMosMhqvOGsMOq+UZwI+ScC8kC0tHfa9fJ86Bd5yydRIZqU/u7bwIKOF7Phw/y0gXORkunhRyEvcm79eyuYC1DirvfheNZK9UdXf7nAZEJv5eMcCZS4Tpu+LPDVvLI4NZC7gWZJgk2S+YY7yLpH8ReOBZvEP7AipH5TQkbwXKoAV/0yAKzKEVrjyWJmVYCeNXxKZhmQ+dQg==
3566d913-a853-4590-8028-b0779f6b7541	84d83390-6d3f-4d27-ada6-ae332d7963c4	algorithm	RSA-OAEP
b87022e5-0a69-479e-bf06-5c25b2bd1168	84d83390-6d3f-4d27-ada6-ae332d7963c4	priority	100
9f7491fe-c6f8-416d-b44e-3eadf63077bf	84d83390-6d3f-4d27-ada6-ae332d7963c4	privateKey	MIIEowIBAAKCAQEAleZnjfvWvzawwfOC145ONrFB9SOcE31a92x+dNwsBUgPng6hiUfMHzJATPeiC8MJAe9AXoGdXYyVDk7T1OM409BFGNV/oovUkqFy+uyGmcgQEPxRByC+l8GXHtSAXJqyrdYpVSQsfx8ipiLJkLis3lO6WNkQLL2C5nievLsPDbXTq/fHkgV3Vytuy84+IHuc3YZ6TK+AT4iC+b53wzR5jq0fJghVHqOV1G882IzTCTJkkgCH+/Lr/4lwGsn/DrkPn9dZeI1D0S1vtBPgkxgcBtZDLtq9HVWxlKUixaTTDq6ogeTBIpg7krTgFCLUHvdGKm7Q1VyDYgt5EZ1mI4J6KQIDAQABAoIBAEgJOhGfCXPJrgb+5Y1+SzL4WziZnMs27izCPEEff54oI60y3ckxsjP5u7HhPUQGvcDqv5XLFxtaUFVYZ29CpNARoesNyrEMHqM6qB1S5lpnrOTkxHG2+DDIrT15JJicFSr6JNHQOPv8M/P/+rqsLRMIzKAe7Cl8BziHlc0f3duZneys4ptBhEo9sv2FIR8997yJNiYy+0PHeoX4mpVljosXok5UVIbZm0AieLhKA5IcM4X7Mzz3HXelsE1OXt7NytcM4HIOfLCPQz56/0NzlzwL9elvk5mHmuHa5dfoRYeyX9yBcEUM4Q5tntVLMrGJTWHz9h3/6vkRdbPpIM9mrOMCgYEAxjlep4+lXwPGgs9mZ/l4eZ8FMFUh/ZjOypSls2mNMkjWY/4I+PuJirO+LDEnEf91weTT6ixAnGFKqeHPnrf4xI8t4Ut/Vh90OzyZA/WKlzr9W50/tt71wagbObLZ8rfAOM2HeI659msHN8XuGaQcLiypOkf0m4z6YALsdzUnsI8CgYEAwZdMp6Bg2sqpkYC7IZXD3L8Z0ivbpSn0r3IpgMAWID0vRkxtiqV43Egg/YNxkuqddC0roZHBVj+wtvDzar7xml8CiVTfN3R+GdHgxQgC/jN0UvQ2GQgWaZYP+o0SOVFBJX04B18kY5GousDr/+krpZgZVZ98uxTb6mStyCJLlccCgYBib6DqsvHbgkN1OEtRfNhwBSENhGlRxy2B+lljBBqjCvq0QzXvdvIxl9rrlSkizeqLc/gshPc88S+jt0hkOFXoPnX5OIWungYZWJlgFvJQ8XFZqng2dvgxyCpk98U1vDxPuPj6TF5a2YGHF9qKjy2TXIhZMdxt1o+LWEhXVmU0TwKBgQCtpu1A0/DtcatHdITnrHLjuZwM1gCRmB//nNUzw5pVUuzsDzSXkLToS98j6Ntg4QlaJAamSJt3pWv7vglrcFpCkgUxcStFkD5pJMWNmBEvOrKWkq9QJtwL3Gr64b4+Ie/hFADFRAfdNNR4qQNJLDxVryjSkFyPaDeYerUT+Ad7EwKBgH0mUoFul62C+4x20zzGp07Hl11mbLu30E0X02+dSOLXyllmcZsjMAzKxZ5HRjosPTm9bFyFxCZRh4yeXWxi/+3ScxpfNt0QtIePNGaogqVRE41vkiM3vnyJ8aXhDxY5SKQ+ltLYAAa/sI4/bzY14IyXRkt8Ox/2jDKZmanbZ8Wr
59c9b1a1-0ec5-4c01-a10f-bca2eb28820e	29aa572d-77de-4272-a3f8-8dc49d8ba97f	allow-default-scopes	true
3c25c4f8-e772-42b7-8b8f-0fab66b21374	8b872b98-ac0a-46de-80a9-243faacc8226	kid	cb8c0248-2bf7-4527-a51d-f56f44f209fd
94b91da3-9d3c-4ed2-bdcd-8e173a25ae7d	8b872b98-ac0a-46de-80a9-243faacc8226	algorithm	HS512
dc8433c1-fd91-42bd-ae74-41bb621077bb	8b872b98-ac0a-46de-80a9-243faacc8226	secret	CN6qhU0YykDLR1Jfj2nPvv6V5xgTIIw5MXSCt9O6qF2jGg6XWcRRtChvfvhlW1A3P-JFT6_T9W7NeYtGssOMend-dqQ4nlJquMH0ihgtV4i1j3PqGAW8nlUnhviUOVcvZaSSVUe98hoRGNC6TAfJGSbtASTW9WNIyiU9c4kcU70
5b1e63d1-036a-44e5-8a85-f15c7db7f7d9	8b872b98-ac0a-46de-80a9-243faacc8226	priority	100
e22d3877-950f-40a0-8742-3ef815bea022	5875653e-5a41-491b-93ba-db6d80d7e466	serverPort	3306
e10c845d-4e6d-400a-bea5-ff03b78dc80f	5875653e-5a41-491b-93ba-db6d80d7e466	db-url	spring.datasource.url=jdbc:mariadb://172.17.0.2:3306/fitcontroldb
b6453f9f-151e-4939-a96a-d6fb271b3651	5875653e-5a41-491b-93ba-db6d80d7e466	enabled	true
dceef9f3-9a38-4d0e-85d5-b7572698e506	5875653e-5a41-491b-93ba-db6d80d7e466	db	fitcontroldb
246f42e0-543e-45bf-b918-77fa339f7d42	5875653e-5a41-491b-93ba-db6d80d7e466	db-username	root
9460d8da-115e-4057-ae9b-0d4da3c12e67	5875653e-5a41-491b-93ba-db6d80d7e466	cachePolicy	DEFAULT
f2159b35-1e09-4518-ad9e-9d35e42da040	5875653e-5a41-491b-93ba-db6d80d7e466	serverHost	172.17.0.2
e80e0137-6b0a-4ff4-99cc-e32f967da803	5875653e-5a41-491b-93ba-db6d80d7e466	dbDriver	mariadb
bccc124f-54a4-4fdc-bfd7-35ca20ae9664	5875653e-5a41-491b-93ba-db6d80d7e466	db-password	root
\.


--
-- TOC entry 4211 (class 0 OID 16421)
-- Dependencies: 218
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
102fc681-f49b-4005-803b-1c4beeb3c0f0	49c21d63-5e89-4314-86fe-88b06f8be80b
102fc681-f49b-4005-803b-1c4beeb3c0f0	f989f50b-d7ef-4e5b-88de-19a7967dcbef
102fc681-f49b-4005-803b-1c4beeb3c0f0	0f24cff9-58ba-4fcd-9e1e-5b2e64677ae6
102fc681-f49b-4005-803b-1c4beeb3c0f0	3ad00395-37a5-4c50-96b4-d4246ea1cedd
102fc681-f49b-4005-803b-1c4beeb3c0f0	d5507959-08a5-4b06-af11-326d41aa7524
102fc681-f49b-4005-803b-1c4beeb3c0f0	31e9b78b-7e84-4d61-a75d-5303f4fc184f
102fc681-f49b-4005-803b-1c4beeb3c0f0	440920bd-9abc-4799-96ea-808964d4653a
102fc681-f49b-4005-803b-1c4beeb3c0f0	1ba023b8-1523-4b26-a244-2df3b073223f
102fc681-f49b-4005-803b-1c4beeb3c0f0	9fe6f087-ed89-4bb6-a419-8294422ab289
102fc681-f49b-4005-803b-1c4beeb3c0f0	d4ab3cc4-a8f8-4384-94b6-cfb95dad0c21
102fc681-f49b-4005-803b-1c4beeb3c0f0	c90e4eec-90c7-439e-9df2-b150dbbc18c4
102fc681-f49b-4005-803b-1c4beeb3c0f0	701d7f18-f0c5-44d5-ab64-ddd1f761a330
102fc681-f49b-4005-803b-1c4beeb3c0f0	417aedd1-68b7-43f6-b79c-2ee6994419db
102fc681-f49b-4005-803b-1c4beeb3c0f0	1ff23271-6fe0-4b22-bb30-37dfad4518c1
102fc681-f49b-4005-803b-1c4beeb3c0f0	befb309a-87be-4609-b16b-b5cc3a449a4a
102fc681-f49b-4005-803b-1c4beeb3c0f0	69e332da-3d15-43d1-b78b-3180229f4e4f
102fc681-f49b-4005-803b-1c4beeb3c0f0	3cf06a09-a5fc-4a09-a747-1ccf38456c35
102fc681-f49b-4005-803b-1c4beeb3c0f0	b8cc1653-a715-4992-ae8f-f322fbb25681
2b9e655b-fbb4-4ddb-8066-005238e7b023	7fac06c0-fcf4-4630-8d69-9df6ad132ec6
3ad00395-37a5-4c50-96b4-d4246ea1cedd	b8cc1653-a715-4992-ae8f-f322fbb25681
3ad00395-37a5-4c50-96b4-d4246ea1cedd	befb309a-87be-4609-b16b-b5cc3a449a4a
d5507959-08a5-4b06-af11-326d41aa7524	69e332da-3d15-43d1-b78b-3180229f4e4f
2b9e655b-fbb4-4ddb-8066-005238e7b023	4343dc85-03cb-4e5c-b9cb-762165aee7c3
4343dc85-03cb-4e5c-b9cb-762165aee7c3	42211328-003e-45bb-b95b-5acb832d6388
5cd438f6-dcb9-4d07-8970-5c76dc799f1e	783d2cbd-4f01-47b8-a684-5d8f7db7b92f
102fc681-f49b-4005-803b-1c4beeb3c0f0	fc9b683b-5aee-4427-80d3-f1c8bfa9e9c6
2b9e655b-fbb4-4ddb-8066-005238e7b023	401ad7e6-172c-4e37-91a0-3399eac35374
2b9e655b-fbb4-4ddb-8066-005238e7b023	e04a8375-b7f8-415c-ab98-6db60e93c737
102fc681-f49b-4005-803b-1c4beeb3c0f0	673a7543-9b77-46a2-a0ef-ae4ee8aa26c3
102fc681-f49b-4005-803b-1c4beeb3c0f0	20209c15-b3c2-493c-9661-1b09254e3757
102fc681-f49b-4005-803b-1c4beeb3c0f0	b07cc427-da93-41d8-b53c-6871c3a98bd1
102fc681-f49b-4005-803b-1c4beeb3c0f0	3f56e8e2-9391-4a49-b140-b732fe79159d
102fc681-f49b-4005-803b-1c4beeb3c0f0	08e87dc6-7b0b-4ef6-8ed4-51558cd85585
102fc681-f49b-4005-803b-1c4beeb3c0f0	8c9b8a39-fab0-45d7-8a2f-2a810dad8e39
102fc681-f49b-4005-803b-1c4beeb3c0f0	8644f330-85ff-4b0e-bb04-9f77407ef3e7
102fc681-f49b-4005-803b-1c4beeb3c0f0	800da64f-014d-4894-89d4-c5dcd219bfd6
102fc681-f49b-4005-803b-1c4beeb3c0f0	974b5a10-8182-40eb-9c5d-f66d4a1bc0f8
102fc681-f49b-4005-803b-1c4beeb3c0f0	5c610f63-6baa-41fa-bd80-7c0b9e2ce56e
102fc681-f49b-4005-803b-1c4beeb3c0f0	479d25bc-37ce-499d-bd0d-e99014fab1dc
102fc681-f49b-4005-803b-1c4beeb3c0f0	389bc88a-3045-4407-b759-48bad89537ce
102fc681-f49b-4005-803b-1c4beeb3c0f0	9bdd9caf-0c72-41d9-848e-aaead9f28638
102fc681-f49b-4005-803b-1c4beeb3c0f0	0bf761b5-c19a-4bb2-a656-1dd3636ea2b9
102fc681-f49b-4005-803b-1c4beeb3c0f0	24f6241a-ada7-452c-aac7-1f15fa0bcb60
102fc681-f49b-4005-803b-1c4beeb3c0f0	430574de-791b-4086-84e1-fbe5c63fc552
102fc681-f49b-4005-803b-1c4beeb3c0f0	484e7cca-f03d-4b7a-a05f-520aef7fa961
3f56e8e2-9391-4a49-b140-b732fe79159d	24f6241a-ada7-452c-aac7-1f15fa0bcb60
b07cc427-da93-41d8-b53c-6871c3a98bd1	484e7cca-f03d-4b7a-a05f-520aef7fa961
b07cc427-da93-41d8-b53c-6871c3a98bd1	0bf761b5-c19a-4bb2-a656-1dd3636ea2b9
1da362cf-eb25-4f60-8437-f3b1cfa7ab90	4efce423-7f71-4594-b48e-f65029190664
39791e72-2e1d-4baf-bb61-d1ec254cbac7	82b12358-ecd9-4dc3-9bbb-fb6c317702c3
39791e72-2e1d-4baf-bb61-d1ec254cbac7	669cd91b-bfa1-4d4e-a1dd-c943fd24aff6
4e65e7dc-9501-46b7-ae64-e69c1995884c	76413cbc-53b2-4d51-8774-b22bf6ae3bc7
723419b9-b362-47ce-aaf0-13161015448a	75a6d74a-43ac-4350-834e-37107702f9b8
83291856-53b3-4ab2-a8d2-c46bd2a4217b	64ead543-a31f-4593-9bd4-11942fdc2442
c475beff-e2df-4596-abda-0f80a72b667f	c11838aa-258b-4d7c-bb03-5db344a42dbe
c475beff-e2df-4596-abda-0f80a72b667f	954041c5-3708-40b3-8482-8e0413e78398
c475beff-e2df-4596-abda-0f80a72b667f	0d38f27b-59f8-474d-884f-446b0c07556b
c475beff-e2df-4596-abda-0f80a72b667f	64ead543-a31f-4593-9bd4-11942fdc2442
c475beff-e2df-4596-abda-0f80a72b667f	d1f8d321-95db-4bb8-8ace-6da8e2a3dd05
c475beff-e2df-4596-abda-0f80a72b667f	1e4e9640-c617-4f9b-900c-5a6b2839184b
c475beff-e2df-4596-abda-0f80a72b667f	a312bdbb-6e6a-403a-ba45-0015788507e5
c475beff-e2df-4596-abda-0f80a72b667f	28b7ba2f-f515-493a-a144-305ac5bf65d7
c475beff-e2df-4596-abda-0f80a72b667f	39791e72-2e1d-4baf-bb61-d1ec254cbac7
c475beff-e2df-4596-abda-0f80a72b667f	1ea1e4b7-8570-4b98-acfc-cbd14b30eb09
c475beff-e2df-4596-abda-0f80a72b667f	33217aec-7b6b-4943-b606-e10543674efc
c475beff-e2df-4596-abda-0f80a72b667f	e7ddc29f-0a4e-4a5c-a30b-6323f2e1f1e2
c475beff-e2df-4596-abda-0f80a72b667f	1d8340b8-ab8e-4926-8d2e-e40a6ef9e1fb
c475beff-e2df-4596-abda-0f80a72b667f	97fbdc3e-d025-44dc-9150-22246966f9e5
c475beff-e2df-4596-abda-0f80a72b667f	83291856-53b3-4ab2-a8d2-c46bd2a4217b
c475beff-e2df-4596-abda-0f80a72b667f	82b12358-ecd9-4dc3-9bbb-fb6c317702c3
c475beff-e2df-4596-abda-0f80a72b667f	f67f2b0d-1586-4248-addf-71f658bc3c26
c475beff-e2df-4596-abda-0f80a72b667f	669cd91b-bfa1-4d4e-a1dd-c943fd24aff6
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	eb4c5ad7-9974-44d8-a437-cfa15786d38d
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	1da362cf-eb25-4f60-8437-f3b1cfa7ab90
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	d725b16a-bd57-4205-b8a3-5991ae1ac2f0
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	a0bc4abc-d628-4fea-aa8c-a8797e654c24
102fc681-f49b-4005-803b-1c4beeb3c0f0	e2e9b38e-ddba-4de1-b7ce-ca136a2f4b75
\.


--
-- TOC entry 4212 (class 0 OID 16424)
-- Dependencies: 219
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
4e3a88b7-0402-4657-b93a-c4326e9183a8	\N	password	3e7468da-8567-4ace-9c97-47a381ed9f6b	1755847123757	\N	{"value":"Fbv+d3Otb6b+9HAA05Ur3P1u/w3aNHFqYyOlHh4KutU=","salt":"t/JkHjDzlHdezxQ5GOd2nQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
912175cd-0df0-40bb-896c-13b77d4b896b	\N	password	55a89212-970f-4a11-b9e9-1d34c6daffc5	1755848585084	My password	{"value":"QtDp+iClaWZO9KUQUMBDgySHOYpojsxZQOKvpzw5YuE=","salt":"vKQWGkSZg3SAnWid35JD7A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
\.


--
-- TOC entry 4209 (class 0 OID 16394)
-- Dependencies: 216
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-08-22 07:18:34.093252	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	5847113373
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-08-22 07:18:34.111465	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	5847113373
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-08-22 07:18:34.211249	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	5847113373
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-08-22 07:18:34.219199	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5847113373
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-08-22 07:18:34.372881	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	5847113373
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-08-22 07:18:34.379785	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	5847113373
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-08-22 07:18:34.506181	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	5847113373
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-08-22 07:18:34.511783	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	5847113373
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-08-22 07:18:34.520892	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	5847113373
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-08-22 07:18:34.659054	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	5847113373
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-08-22 07:18:34.732279	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5847113373
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-08-22 07:18:34.735767	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5847113373
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-08-22 07:18:34.753082	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5847113373
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-08-22 07:18:34.775239	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	5847113373
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-08-22 07:18:34.777359	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-08-22 07:18:34.780623	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	5847113373
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-08-22 07:18:34.784507	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	5847113373
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-08-22 07:18:34.830846	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	5847113373
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-08-22 07:18:34.885252	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	5847113373
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-08-22 07:18:34.893416	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	5847113373
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-08-22 07:18:34.897551	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	5847113373
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-08-22 07:18:34.902132	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	5847113373
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-08-22 07:18:34.994697	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	5847113373
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-08-22 07:18:35.003726	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	5847113373
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-08-22 07:18:35.006528	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	5847113373
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-08-22 07:18:35.398104	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	5847113373
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-08-22 07:18:35.469641	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	5847113373
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-08-22 07:18:35.473477	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	5847113373
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-08-22 07:18:35.53856	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	5847113373
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-08-22 07:18:35.55398	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	5847113373
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-08-22 07:18:35.579276	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	5847113373
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-08-22 07:18:35.587924	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	5847113373
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-08-22 07:18:35.59589	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-08-22 07:18:35.598989	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	5847113373
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-08-22 07:18:35.628172	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	5847113373
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-08-22 07:18:35.634655	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	5847113373
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-08-22 07:18:35.641462	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5847113373
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-08-22 07:18:35.646004	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	5847113373
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-08-22 07:18:35.65122	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	5847113373
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-08-22 07:18:35.65296	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	5847113373
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-08-22 07:18:35.655106	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	5847113373
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-08-22 07:18:35.661548	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	5847113373
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-08-22 07:18:36.999012	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	5847113373
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-08-22 07:18:37.004749	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	5847113373
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-08-22 07:18:37.012458	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	5847113373
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-08-22 07:18:37.018661	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	5847113373
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-08-22 07:18:37.021533	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	5847113373
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-08-22 07:18:37.1646	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	5847113373
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-08-22 07:18:37.17145	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	5847113373
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-08-22 07:18:37.226059	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	5847113373
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-08-22 07:18:37.491489	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	5847113373
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-08-22 07:18:37.497698	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-08-22 07:18:37.502037	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	5847113373
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-08-22 07:18:37.505737	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	5847113373
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-08-22 07:18:37.514846	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	5847113373
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-08-22 07:18:37.521302	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	5847113373
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-08-22 07:18:37.568616	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	5847113373
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-08-22 07:18:37.923112	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	5847113373
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-08-22 07:18:37.948887	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	5847113373
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-08-22 07:18:37.956667	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	5847113373
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-08-22 07:18:37.969879	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	5847113373
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-08-22 07:18:37.978152	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	5847113373
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-08-22 07:18:37.983742	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	5847113373
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-08-22 07:18:37.988914	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	5847113373
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-08-22 07:18:37.993483	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	5847113373
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-08-22 07:18:38.033403	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	5847113373
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-08-22 07:18:38.062004	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	5847113373
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-08-22 07:18:38.067581	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	5847113373
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-08-22 07:18:38.103237	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	5847113373
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-08-22 07:18:38.110217	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	5847113373
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-08-22 07:18:38.114804	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	5847113373
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-08-22 07:18:38.121407	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5847113373
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-08-22 07:18:38.127884	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5847113373
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-08-22 07:18:38.130704	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5847113373
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-08-22 07:18:38.146159	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	5847113373
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-08-22 07:18:38.182239	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	5847113373
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-08-22 07:18:38.190889	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	5847113373
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-08-22 07:18:38.193305	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	5847113373
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-08-22 07:18:38.210126	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	5847113373
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-08-22 07:18:38.212498	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	5847113373
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-08-22 07:18:38.240825	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	5847113373
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-08-22 07:18:38.242786	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5847113373
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-08-22 07:18:38.247821	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5847113373
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-08-22 07:18:38.249545	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5847113373
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-08-22 07:18:38.276176	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5847113373
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-08-22 07:18:38.280708	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	5847113373
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-08-22 07:18:38.287537	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	5847113373
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-08-22 07:18:38.297203	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	5847113373
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.30405	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	5847113373
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.310146	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	5847113373
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.338428	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.344668	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	5847113373
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.346639	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	5847113373
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.355557	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	5847113373
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.359135	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	5847113373
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-08-22 07:18:38.366045	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	5847113373
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.43997	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.442079	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.453907	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.486765	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.489982	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.522611	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	5847113373
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-08-22 07:18:38.529482	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	5847113373
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-08-22 07:18:38.537997	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	5847113373
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-08-22 07:18:38.570056	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	5847113373
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-08-22 07:18:38.605227	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	5847113373
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-08-22 07:18:38.649295	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	5847113373
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-08-22 07:18:38.654904	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	5847113373
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-08-22 07:18:38.697337	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	5847113373
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-08-22 07:18:38.699948	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	5847113373
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-08-22 07:18:38.709097	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-08-22 07:18:38.717155	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	5847113373
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-08-22 07:18:38.759489	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	5847113373
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-08-22 07:18:38.764896	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	5847113373
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-08-22 07:18:38.771016	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	5847113373
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-08-22 07:18:38.774635	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	5847113373
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-08-22 07:18:38.781925	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	5847113373
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-08-22 07:18:38.788482	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5847113373
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-08-22 07:18:38.909707	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	5847113373
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-08-22 07:18:38.91419	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	5847113373
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-08-22 07:18:38.920228	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-08-22 07:18:38.948246	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-08-22 07:18:38.952424	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	5847113373
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-08-22 07:18:38.954561	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-08-22 07:18:38.957464	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:38.963166	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:38.989684	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.13332	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.262704	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.383544	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.491982	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.494451	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.553322	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5847113373
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.58938	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	5847113373
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.610807	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	5847113373
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.614242	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	5847113373
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-08-22 07:18:39.694938	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	5847113373
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.709932	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	5847113373
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.726878	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	5847113373
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.7657	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	5847113373
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.7726	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	5847113373
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.783516	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	5847113373
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.825653	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	5847113373
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:39.908036	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	5847113373
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:40.044756	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	5847113373
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:40.05535	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	5847113373
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-08-22 07:18:40.060763	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	5847113373
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-08-22 07:18:40.072497	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	5847113373
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-08-22 07:18:40.081348	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	5847113373
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-08-22 07:18:40.085848	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	5847113373
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-08-22 07:18:40.09722	151	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.29.1	\N	\N	5847113373
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-08-22 07:18:40.102024	152	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.29.1	\N	\N	5847113373
26.2.6-39866-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-08-22 07:18:40.106966	153	EXECUTED	9:1dc67ccee24f30331db2cba4f372e40e	customChange		\N	4.29.1	\N	\N	5847113373
26.2.6-39866-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-08-22 07:18:40.114038	154	EXECUTED	9:b70b76f47210cf0a5f4ef0e219eac7cd	addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	5847113373
26.2.6-40088-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-08-22 07:18:40.118599	155	EXECUTED	9:cc7e02ed69ab31979afb1982f9670e8f	customChange		\N	4.29.1	\N	\N	5847113373
26.2.6-40088-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-08-22 07:18:40.12517	156	EXECUTED	9:5bb848128da7bc4595cc507383325241	addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	5847113373
26.3.0-groups-description	keycloak	META-INF/jpa-changelog-26.3.0.xml	2025-08-22 07:18:40.132666	157	EXECUTED	9:e1a3c05574326fb5b246b73b9a4c4d49	addColumn tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5847113373
\.


--
-- TOC entry 4208 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- TOC entry 4283 (class 0 OID 17785)
-- Dependencies: 290
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
f63a6b35-ce9c-442a-bf20-081b5ada87c0	a577e3cb-87ce-4fad-ae9f-e4b27f735e5c	f
f63a6b35-ce9c-442a-bf20-081b5ada87c0	ae23303f-f983-491a-b5ee-09149e999ae8	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	304f13ef-ac06-4719-b8af-2dcb772b3fad	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	9bfdf796-8923-46ae-b834-4d4950dd5b6b	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	173317b9-8e02-4a8f-b456-02c25de72658	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	4588b911-5b8f-4a63-a58f-027f81412204	f
f63a6b35-ce9c-442a-bf20-081b5ada87c0	96374be7-30a9-4037-9a21-71cc6a2f96e1	f
f63a6b35-ce9c-442a-bf20-081b5ada87c0	0d1b9de7-e54d-461f-b813-da5bfc391098	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	e0cf9fe7-d0c4-45b8-a13a-8316729696d7	f
f63a6b35-ce9c-442a-bf20-081b5ada87c0	a14e6985-6c11-4cab-8217-2246d1ef253a	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	c92ef9d0-878a-49cf-b3af-f7c34327b197	t
f63a6b35-ce9c-442a-bf20-081b5ada87c0	faf93f27-aa4b-4577-a75a-2f6920473135	f
52cc0a6b-3160-4f03-bd34-7be149371f52	6b23af8d-fdf8-4968-881c-8b7c573466db	t
52cc0a6b-3160-4f03-bd34-7be149371f52	320f1520-b55b-42b5-9d25-ba92efbc546a	t
52cc0a6b-3160-4f03-bd34-7be149371f52	b11444a9-46cd-4d1f-9c7b-945561490332	t
52cc0a6b-3160-4f03-bd34-7be149371f52	a642f163-4a82-4a2f-92ed-fc51e8ad99ab	t
52cc0a6b-3160-4f03-bd34-7be149371f52	a381f838-94b9-46cb-8474-a04e3c552cb2	t
52cc0a6b-3160-4f03-bd34-7be149371f52	8cae3849-dbf6-4004-bf86-ba8637c26b3f	t
52cc0a6b-3160-4f03-bd34-7be149371f52	1246ad8e-5149-4c9f-b3c5-043502659916	t
52cc0a6b-3160-4f03-bd34-7be149371f52	ed0dd91f-6fcf-465d-9445-ee9fff253107	t
52cc0a6b-3160-4f03-bd34-7be149371f52	427153d7-e3e7-4cf3-aebd-1d25c667b5e4	f
52cc0a6b-3160-4f03-bd34-7be149371f52	d38fe61c-420c-4202-a560-2f005d860f62	f
52cc0a6b-3160-4f03-bd34-7be149371f52	18a131d4-b2cf-42c5-95c6-67aecb1f88e0	f
52cc0a6b-3160-4f03-bd34-7be149371f52	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51	f
52cc0a6b-3160-4f03-bd34-7be149371f52	1b2e785e-2476-4100-b4a3-40370fc918d3	f
\.


--
-- TOC entry 4213 (class 0 OID 16429)
-- Dependencies: 220
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- TOC entry 4271 (class 0 OID 17484)
-- Dependencies: 278
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- TOC entry 4272 (class 0 OID 17489)
-- Dependencies: 279
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4285 (class 0 OID 17811)
-- Dependencies: 292
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4273 (class 0 OID 17498)
-- Dependencies: 280
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4274 (class 0 OID 17507)
-- Dependencies: 281
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4275 (class 0 OID 17510)
-- Dependencies: 282
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4276 (class 0 OID 17516)
-- Dependencies: 283
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4233 (class 0 OID 16806)
-- Dependencies: 240
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4279 (class 0 OID 17581)
-- Dependencies: 286
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4255 (class 0 OID 17208)
-- Dependencies: 262
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4254 (class 0 OID 17205)
-- Dependencies: 261
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4234 (class 0 OID 16811)
-- Dependencies: 241
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- TOC entry 4235 (class 0 OID 16820)
-- Dependencies: 242
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4239 (class 0 OID 16924)
-- Dependencies: 246
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4240 (class 0 OID 16929)
-- Dependencies: 247
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4294 (class 0 OID 18010)
-- Dependencies: 301
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- TOC entry 4253 (class 0 OID 17202)
-- Dependencies: 260
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type, description) FROM stdin;
\.


--
-- TOC entry 4214 (class 0 OID 16437)
-- Dependencies: 221
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
2b9e655b-fbb4-4ddb-8066-005238e7b023	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	${role_default-roles}	default-roles-master	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	\N
102fc681-f49b-4005-803b-1c4beeb3c0f0	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	${role_admin}	admin	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	\N
49c21d63-5e89-4314-86fe-88b06f8be80b	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	${role_create-realm}	create-realm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	\N
f989f50b-d7ef-4e5b-88de-19a7967dcbef	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_create-client}	create-client	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
0f24cff9-58ba-4fcd-9e1e-5b2e64677ae6	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-realm}	view-realm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
3ad00395-37a5-4c50-96b4-d4246ea1cedd	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-users}	view-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
d5507959-08a5-4b06-af11-326d41aa7524	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-clients}	view-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
31e9b78b-7e84-4d61-a75d-5303f4fc184f	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-events}	view-events	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
440920bd-9abc-4799-96ea-808964d4653a	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-identity-providers}	view-identity-providers	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
1ba023b8-1523-4b26-a244-2df3b073223f	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_view-authorization}	view-authorization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
9fe6f087-ed89-4bb6-a419-8294422ab289	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-realm}	manage-realm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
d4ab3cc4-a8f8-4384-94b6-cfb95dad0c21	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-users}	manage-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
c90e4eec-90c7-439e-9df2-b150dbbc18c4	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-clients}	manage-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
701d7f18-f0c5-44d5-ab64-ddd1f761a330	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-events}	manage-events	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
417aedd1-68b7-43f6-b79c-2ee6994419db	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-identity-providers}	manage-identity-providers	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
1ff23271-6fe0-4b22-bb30-37dfad4518c1	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_manage-authorization}	manage-authorization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
befb309a-87be-4609-b16b-b5cc3a449a4a	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_query-users}	query-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
69e332da-3d15-43d1-b78b-3180229f4e4f	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_query-clients}	query-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
3cf06a09-a5fc-4a09-a747-1ccf38456c35	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_query-realms}	query-realms	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
b8cc1653-a715-4992-ae8f-f322fbb25681	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_query-groups}	query-groups	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
7fac06c0-fcf4-4630-8d69-9df6ad132ec6	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_view-profile}	view-profile	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
4343dc85-03cb-4e5c-b9cb-762165aee7c3	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_manage-account}	manage-account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
42211328-003e-45bb-b95b-5acb832d6388	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_manage-account-links}	manage-account-links	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
9dbb79e9-199f-4548-b4d5-04d3d75e30c1	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_view-applications}	view-applications	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
783d2cbd-4f01-47b8-a684-5d8f7db7b92f	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_view-consent}	view-consent	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
5cd438f6-dcb9-4d07-8970-5c76dc799f1e	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_manage-consent}	manage-consent	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
bf2138ae-cb83-471a-b2ab-58eaf6166810	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_view-groups}	view-groups	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
d468440d-3e0e-4b4a-a960-37f39f6a3ee9	6d5de729-47f7-4d46-983a-51120b7008d8	t	${role_delete-account}	delete-account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	6d5de729-47f7-4d46-983a-51120b7008d8	\N
d5dda61d-e3a7-4bf8-94ca-6cc1d563dad8	91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	t	${role_read-token}	read-token	f63a6b35-ce9c-442a-bf20-081b5ada87c0	91cc79fd-b1e4-42f8-a37e-3587fa1da7c5	\N
fc9b683b-5aee-4427-80d3-f1c8bfa9e9c6	15c530bf-fc36-4c36-8494-d7aa47c90c31	t	${role_impersonation}	impersonation	f63a6b35-ce9c-442a-bf20-081b5ada87c0	15c530bf-fc36-4c36-8494-d7aa47c90c31	\N
401ad7e6-172c-4e37-91a0-3399eac35374	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	${role_offline-access}	offline_access	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	\N
e04a8375-b7f8-415c-ab98-6db60e93c737	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	${role_uma_authorization}	uma_authorization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	\N	\N
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	52cc0a6b-3160-4f03-bd34-7be149371f52	f	${role_default-roles}	default-roles-fitcontrol	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
673a7543-9b77-46a2-a0ef-ae4ee8aa26c3	73496781-6c99-4431-8252-6d9446bdd618	t	${role_create-client}	create-client	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
20209c15-b3c2-493c-9661-1b09254e3757	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-realm}	view-realm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
b07cc427-da93-41d8-b53c-6871c3a98bd1	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-users}	view-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
3f56e8e2-9391-4a49-b140-b732fe79159d	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-clients}	view-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
08e87dc6-7b0b-4ef6-8ed4-51558cd85585	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-events}	view-events	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
8c9b8a39-fab0-45d7-8a2f-2a810dad8e39	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-identity-providers}	view-identity-providers	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
8644f330-85ff-4b0e-bb04-9f77407ef3e7	73496781-6c99-4431-8252-6d9446bdd618	t	${role_view-authorization}	view-authorization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
800da64f-014d-4894-89d4-c5dcd219bfd6	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-realm}	manage-realm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
974b5a10-8182-40eb-9c5d-f66d4a1bc0f8	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-users}	manage-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
5c610f63-6baa-41fa-bd80-7c0b9e2ce56e	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-clients}	manage-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
479d25bc-37ce-499d-bd0d-e99014fab1dc	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-events}	manage-events	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
389bc88a-3045-4407-b759-48bad89537ce	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-identity-providers}	manage-identity-providers	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
9bdd9caf-0c72-41d9-848e-aaead9f28638	73496781-6c99-4431-8252-6d9446bdd618	t	${role_manage-authorization}	manage-authorization	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
0bf761b5-c19a-4bb2-a656-1dd3636ea2b9	73496781-6c99-4431-8252-6d9446bdd618	t	${role_query-users}	query-users	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
24f6241a-ada7-452c-aac7-1f15fa0bcb60	73496781-6c99-4431-8252-6d9446bdd618	t	${role_query-clients}	query-clients	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
430574de-791b-4086-84e1-fbe5c63fc552	73496781-6c99-4431-8252-6d9446bdd618	t	${role_query-realms}	query-realms	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
484e7cca-f03d-4b7a-a05f-520aef7fa961	73496781-6c99-4431-8252-6d9446bdd618	t	${role_query-groups}	query-groups	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
cbe5c4bc-5047-4e70-ab02-ce3ea6d3e736	52cc0a6b-3160-4f03-bd34-7be149371f52	f		user	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
76413cbc-53b2-4d51-8774-b22bf6ae3bc7	52cc0a6b-3160-4f03-bd34-7be149371f52	f		ADMIN	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
eb4c5ad7-9974-44d8-a437-cfa15786d38d	52cc0a6b-3160-4f03-bd34-7be149371f52	f	${role_uma_authorization}	uma_authorization	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
08e7ba79-4187-4c2b-a465-9d1b4927782c	52cc0a6b-3160-4f03-bd34-7be149371f52	f		admin	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
a0bc4abc-d628-4fea-aa8c-a8797e654c24	52cc0a6b-3160-4f03-bd34-7be149371f52	f	${role_offline-access}	offline_access	52cc0a6b-3160-4f03-bd34-7be149371f52	\N	\N
c11838aa-258b-4d7c-bb03-5db344a42dbe	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-realm}	manage-realm	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
954041c5-3708-40b3-8482-8e0413e78398	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-realm}	view-realm	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
d1f8d321-95db-4bb8-8ace-6da8e2a3dd05	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-events}	manage-events	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
64ead543-a31f-4593-9bd4-11942fdc2442	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_query-clients}	query-clients	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
c475beff-e2df-4596-abda-0f80a72b667f	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_realm-admin}	realm-admin	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
0d38f27b-59f8-474d-884f-446b0c07556b	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-identity-providers}	view-identity-providers	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
1e4e9640-c617-4f9b-900c-5a6b2839184b	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_query-realms}	query-realms	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
a312bdbb-6e6a-403a-ba45-0015788507e5	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-authorization}	view-authorization	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
28b7ba2f-f515-493a-a144-305ac5bf65d7	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-authorization}	manage-authorization	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
39791e72-2e1d-4baf-bb61-d1ec254cbac7	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-users}	view-users	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
33217aec-7b6b-4943-b606-e10543674efc	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-clients}	manage-clients	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
1ea1e4b7-8570-4b98-acfc-cbd14b30eb09	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-identity-providers}	manage-identity-providers	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
e7ddc29f-0a4e-4a5c-a30b-6323f2e1f1e2	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-events}	view-events	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
97fbdc3e-d025-44dc-9150-22246966f9e5	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_create-client}	create-client	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
1d8340b8-ab8e-4926-8d2e-e40a6ef9e1fb	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_impersonation}	impersonation	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
83291856-53b3-4ab2-a8d2-c46bd2a4217b	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_view-clients}	view-clients	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
f67f2b0d-1586-4248-addf-71f658bc3c26	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_manage-users}	manage-users	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
82b12358-ecd9-4dc3-9bbb-fb6c317702c3	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_query-groups}	query-groups	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
669cd91b-bfa1-4d4e-a1dd-c943fd24aff6	36dc6c95-b2b0-409d-92b8-75f9194ebc45	t	${role_query-users}	query-users	52cc0a6b-3160-4f03-bd34-7be149371f52	36dc6c95-b2b0-409d-92b8-75f9194ebc45	\N
4e65e7dc-9501-46b7-ae64-e69c1995884c	bd7aec72-c51e-41fc-afe5-3a95bb122794	t		ADMIN	52cc0a6b-3160-4f03-bd34-7be149371f52	bd7aec72-c51e-41fc-afe5-3a95bb122794	\N
dd88abc0-28e7-430f-8628-6abb0262e6c8	bd7aec72-c51e-41fc-afe5-3a95bb122794	t	admin	admin	52cc0a6b-3160-4f03-bd34-7be149371f52	bd7aec72-c51e-41fc-afe5-3a95bb122794	\N
d32b3c99-8d00-44e7-8f5d-42b0255b0d2d	bd7aec72-c51e-41fc-afe5-3a95bb122794	t	\N	uma_protection	52cc0a6b-3160-4f03-bd34-7be149371f52	bd7aec72-c51e-41fc-afe5-3a95bb122794	\N
a0b987c3-94b0-49e5-aa43-634d7e67af68	89105ce1-82fb-49c7-a1b4-9761fbf076e8	t	${role_read-token}	read-token	52cc0a6b-3160-4f03-bd34-7be149371f52	89105ce1-82fb-49c7-a1b4-9761fbf076e8	\N
afb3c025-6f2d-457e-b18c-98db4b14c9dd	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_view-applications}	view-applications	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
75a6d74a-43ac-4350-834e-37107702f9b8	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_view-consent}	view-consent	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
1da362cf-eb25-4f60-8437-f3b1cfa7ab90	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_manage-account}	manage-account	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
d725b16a-bd57-4205-b8a3-5991ae1ac2f0	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_view-profile}	view-profile	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
723419b9-b362-47ce-aaf0-13161015448a	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_manage-consent}	manage-consent	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
7e5a4204-d10c-4f0d-83ee-e3ff3ce98743	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_view-groups}	view-groups	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
a1bb52e1-66fe-442e-bafc-a6f177a6da36	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_delete-account}	delete-account	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
4efce423-7f71-4594-b48e-f65029190664	2d483f57-f672-417b-a3fa-c784fc389ff0	t	${role_manage-account-links}	manage-account-links	52cc0a6b-3160-4f03-bd34-7be149371f52	2d483f57-f672-417b-a3fa-c784fc389ff0	\N
e2e9b38e-ddba-4de1-b7ce-ca136a2f4b75	73496781-6c99-4431-8252-6d9446bdd618	t	${role_impersonation}	impersonation	f63a6b35-ce9c-442a-bf20-081b5ada87c0	73496781-6c99-4431-8252-6d9446bdd618	\N
\.


--
-- TOC entry 4238 (class 0 OID 16921)
-- Dependencies: 245
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
tj2dx	26.3.2	1755847121
\.


--
-- TOC entry 4252 (class 0 OID 17193)
-- Dependencies: 259
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
8bec9de2-8a07-41ef-821a-b7d902305013	3429101c-5b88-40e4-995c-b603e5ff503b	0	1756111483	{"authMethod":"openid-connect","redirectUri":"http://localhost:8081/admin/master/console/#/fitcontrol/clients/de942f08-1fe1-42f7-a73d-8586a3e7f12f/credentials","notes":{"clientId":"3429101c-5b88-40e4-995c-b603e5ff503b","iss":"http://localhost:8081/realms/master","startedAt":"1756111483","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"7d4661d9-ffd9-448d-8964-685dc7423124","response_mode":"query","scope":"openid","userSessionStartedAt":"1756111483","redirect_uri":"http://localhost:8081/admin/master/console/#/fitcontrol/clients/de942f08-1fe1-42f7-a73d-8586a3e7f12f/credentials","state":"4e1b8afc-72ca-4ac1-9280-feb9b66651d0","code_challenge":"f_uAqbrSB3yJSwhGMss5vNPaAGZ2nFUhk0VQXVAD9G4"}}	local	local	0
ca240d81-5748-4742-bd43-c01cd5fee5e4	468a8d58-a07a-4288-b293-8e740a5c7922	0	1756112870	{"authMethod":"openid-connect","redirectUri":"http://localhost:4200/","notes":{"clientId":"468a8d58-a07a-4288-b293-8e740a5c7922","iss":"http://localhost:8081/realms/fitcontrol","startedAt":"1756112869","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"e9ad4a6b-44dd-4351-a639-2340bebe91b4","response_mode":"fragment","scope":"openid","userSessionStartedAt":"1756112869","redirect_uri":"http://localhost:4200/","state":"cf4a2d5a-4f07-4ace-9a66-b91f42896c12","code_challenge":"mEccTYuyDzGF10cKAgqN021KnImDYiLKqR2y59FUaUY"}}	local	local	1
\.


--
-- TOC entry 4251 (class 0 OID 17188)
-- Dependencies: 258
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
8bec9de2-8a07-41ef-821a-b7d902305013	3e7468da-8567-4ace-9c97-47a381ed9f6b	f63a6b35-ce9c-442a-bf20-081b5ada87c0	1756111483	0	{"ipAddress":"172.17.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTcuMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiRmlyZWZveC8xNDIuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1756111483","authenticators-completed":"{\\"dbb3f5f8-93f0-4086-bc72-65d93948ba4c\\":1756111483}"},"state":"LOGGED_IN"}	1756111483	\N	0
ca240d81-5748-4742-bd43-c01cd5fee5e4	55a89212-970f-4a11-b9e9-1d34c6daffc5	52cc0a6b-3160-4f03-bd34-7be149371f52	1756112869	0	{"ipAddress":"172.17.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTcuMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiRmlyZWZveC8xNDIuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1756112869","authenticators-completed":"{\\"5aa99130-b306-43fd-b62b-be0ad8ca7826\\":1756112869}"},"state":"LOGGED_IN"}	1756112870	\N	1
\.


--
-- TOC entry 4291 (class 0 OID 17973)
-- Dependencies: 298
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- TOC entry 4292 (class 0 OID 17984)
-- Dependencies: 299
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- TOC entry 4265 (class 0 OID 17407)
-- Dependencies: 272
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 16795)
-- Dependencies: 238
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
b802f19f-531d-47eb-ae7f-1c6efd38cba3	audience resolve	openid-connect	oidc-audience-resolve-mapper	5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	\N
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	locale	openid-connect	oidc-usermodel-attribute-mapper	3429101c-5b88-40e4-995c-b603e5ff503b	\N
506e107a-2587-468a-88e6-34bf1be09903	role list	saml	saml-role-list-mapper	\N	ae23303f-f983-491a-b5ee-09149e999ae8
41a58544-7dd1-435e-bf03-f1692a5eb3e5	organization	saml	saml-organization-membership-mapper	\N	304f13ef-ac06-4719-b8af-2dcb772b3fad
3707885b-f3f0-49c1-8fc5-02bdfd84d64b	full name	openid-connect	oidc-full-name-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
7642dfae-06b9-422b-93b6-acb6658e9ffe	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
9c397229-36f4-43a9-ba4e-fc94982b8599	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
725e6c3f-39d0-4c1f-ac96-b6ded9577995	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
085002cd-dcf4-488a-ac20-9c50f70a1aa2	username	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
97f0b451-138a-4489-8f0a-9d4895a29f71	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
cecb1677-7b2a-403a-a0cf-ebde798b5d30	website	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
641e3317-be14-494c-933b-760ff44dc9d1	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
0b3cd099-5c49-420f-bad9-3f5af6d60d41	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
523cf99a-7cfd-496f-9808-d26262f657f2	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
1b439121-47e1-4b32-ac77-c48cfbc08dee	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
dd137660-af28-4d57-bf30-47ebb63b1d06	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	9bfdf796-8923-46ae-b834-4d4950dd5b6b
a3590627-718d-4319-827f-3910ed862942	email	openid-connect	oidc-usermodel-attribute-mapper	\N	173317b9-8e02-4a8f-b456-02c25de72658
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	email verified	openid-connect	oidc-usermodel-property-mapper	\N	173317b9-8e02-4a8f-b456-02c25de72658
775debf4-f225-4525-91ba-18413f0ea1bb	address	openid-connect	oidc-address-mapper	\N	4588b911-5b8f-4a63-a58f-027f81412204
dddafef0-d985-4393-971c-1461d89b278c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	96374be7-30a9-4037-9a21-71cc6a2f96e1
12257308-2e6f-4806-9d21-724032e972ed	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	96374be7-30a9-4037-9a21-71cc6a2f96e1
5a8a8262-7203-48c4-bdf0-5439079057bd	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0d1b9de7-e54d-461f-b813-da5bfc391098
2caa43f7-559d-4b33-969c-bc010d8a3f92	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0d1b9de7-e54d-461f-b813-da5bfc391098
4105245e-d022-4189-a5e8-1d3d72fd1377	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0d1b9de7-e54d-461f-b813-da5bfc391098
42800abc-3093-4a57-bfa4-a3ddb7546533	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	58bad1be-6a8e-4d88-ba1c-1e63eb4c0b5a
f8088569-99ae-446e-aee4-1a412b88f5dc	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	e0cf9fe7-d0c4-45b8-a13a-8316729696d7
2b96e852-afda-43f5-b2bf-e881f4915119	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	e0cf9fe7-d0c4-45b8-a13a-8316729696d7
49247867-e885-4ffa-8d49-5b871009cad6	acr loa level	openid-connect	oidc-acr-mapper	\N	a14e6985-6c11-4cab-8217-2246d1ef253a
7f160cfe-6ccf-423a-b81e-20560cae90e7	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	c92ef9d0-878a-49cf-b3af-f7c34327b197
dea55e79-d2da-4263-b77c-cec16e420ea9	sub	openid-connect	oidc-sub-mapper	\N	c92ef9d0-878a-49cf-b3af-f7c34327b197
c490627d-224f-462d-a6a0-66917c423555	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	008ee7ef-d593-4ea8-93c0-b63d3a139cb8
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	008ee7ef-d593-4ea8-93c0-b63d3a139cb8
3a88997a-b402-4379-a3a0-57b4f636f957	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	008ee7ef-d593-4ea8-93c0-b63d3a139cb8
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	organization	openid-connect	oidc-organization-membership-mapper	\N	faf93f27-aa4b-4577-a75a-2f6920473135
06314dcf-b6a5-4502-a8be-88c82d8042d1	role list	saml	saml-role-list-mapper	\N	6b23af8d-fdf8-4968-881c-8b7c573466db
bfbacb69-38bb-4de7-a2ee-1fad22019d16	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
b1200769-bdb8-469a-ba82-0fd8675df6fc	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
8c02b86f-0234-4c40-8e40-e1d677551d35	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
698e4a54-118b-4672-a222-721da13c9a71	full name	openid-connect	oidc-full-name-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
7232dec9-c707-44e4-8503-4e90549d0af6	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
f38819a3-e182-48a8-9430-792824c6233e	website	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
b2a2c444-bbce-4780-9989-76b2f4648529	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
062e0ddc-2baf-4422-83ce-0790a6a3bec5	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
17c87100-01c6-4f4e-9d32-0703cc3f892e	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
a49262ec-ab25-4f24-85e7-9c3779575628	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
626675d2-a51a-4f7f-a8a7-33f6737036ce	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
2f039d83-350d-4bbd-b57c-ec93248e0042	username	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
116df903-b883-4d9c-8716-b78ef191ad0e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
b0653567-6ea6-4412-87ca-11ebd4848327	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	b11444a9-46cd-4d1f-9c7b-945561490332
670c9996-65b3-4d40-ab25-74365f3aea14	acr loa level	openid-connect	oidc-acr-mapper	\N	1246ad8e-5149-4c9f-b3c5-043502659916
390ea97d-84bd-4a1e-84f4-d6ced4643054	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	37b20652-2240-4cfe-9074-9832585e0c8e
b4c003d0-ef4a-4786-848e-f57304f0d60f	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	37b20652-2240-4cfe-9074-9832585e0c8e
f38bae18-6d57-441e-aedd-56345bb4361b	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	37b20652-2240-4cfe-9074-9832585e0c8e
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51
7b26078c-660c-444b-ae89-7cb31f70d359	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	dbf4ac08-13e6-4ef4-b925-dd3057fe1d51
15b35999-6907-480b-a236-9f22046112ba	organization	openid-connect	oidc-organization-membership-mapper	\N	1b2e785e-2476-4100-b4a3-40370fc918d3
97b5e2ca-9ba1-4c20-aac5-34a87b8a5c82	organization	saml	saml-organization-membership-mapper	\N	320f1520-b55b-42b5-9d25-ba92efbc546a
c9a3f527-c180-47c0-8827-d1f6d6c32eac	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	18a131d4-b2cf-42c5-95c6-67aecb1f88e0
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	18a131d4-b2cf-42c5-95c6-67aecb1f88e0
949366e8-2ea7-4a77-89cd-dd5384cf00d8	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a381f838-94b9-46cb-8474-a04e3c552cb2
46671e1c-a07d-4e29-be12-06592350da35	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a381f838-94b9-46cb-8474-a04e3c552cb2
c268fa05-1c14-49a8-bb41-3223ff86f565	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a381f838-94b9-46cb-8474-a04e3c552cb2
581f67d3-85f9-4f88-b35e-3d3668fa0386	address	openid-connect	oidc-address-mapper	\N	d38fe61c-420c-4202-a560-2f005d860f62
abcf0267-ae32-475b-890c-651eee1f2eaf	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	8cae3849-dbf6-4004-bf86-ba8637c26b3f
b07fb829-1d8c-40d7-b346-579f3689f9a2	email	openid-connect	oidc-usermodel-attribute-mapper	\N	a642f163-4a82-4a2f-92ed-fc51e8ad99ab
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	email verified	openid-connect	oidc-usermodel-property-mapper	\N	a642f163-4a82-4a2f-92ed-fc51e8ad99ab
c2335d34-554f-4107-a20b-fcef2c8c9a6e	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	ed0dd91f-6fcf-465d-9445-ee9fff253107
7249555d-016b-4ffa-af2b-823aa20b74d2	sub	openid-connect	oidc-sub-mapper	\N	ed0dd91f-6fcf-465d-9445-ee9fff253107
f1956303-22a9-4f06-b1cf-8f5477f621b8	audience resolve	openid-connect	oidc-audience-resolve-mapper	6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	\N
55466db8-7ead-4c8f-99bb-7d2390773eb3	audience	openid-connect	oidc-audience-mapper	468a8d58-a07a-4288-b293-8e740a5c7922	\N
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	locale	openid-connect	oidc-usermodel-attribute-mapper	1c573beb-cddf-487d-827c-572abdcda65a	\N
\.


--
-- TOC entry 4232 (class 0 OID 16801)
-- Dependencies: 239
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	true	introspection.token.claim
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	true	userinfo.token.claim
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	locale	user.attribute
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	true	id.token.claim
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	true	access.token.claim
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	locale	claim.name
960d969b-93f2-4bd6-a25f-07ceeb6cc3e7	String	jsonType.label
506e107a-2587-468a-88e6-34bf1be09903	false	single
506e107a-2587-468a-88e6-34bf1be09903	Basic	attribute.nameformat
506e107a-2587-468a-88e6-34bf1be09903	Role	attribute.name
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	true	introspection.token.claim
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	true	userinfo.token.claim
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	picture	user.attribute
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	true	id.token.claim
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	true	access.token.claim
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	picture	claim.name
05c8e5d2-900e-472b-ac2d-cd7cb5597f5c	String	jsonType.label
085002cd-dcf4-488a-ac20-9c50f70a1aa2	true	introspection.token.claim
085002cd-dcf4-488a-ac20-9c50f70a1aa2	true	userinfo.token.claim
085002cd-dcf4-488a-ac20-9c50f70a1aa2	username	user.attribute
085002cd-dcf4-488a-ac20-9c50f70a1aa2	true	id.token.claim
085002cd-dcf4-488a-ac20-9c50f70a1aa2	true	access.token.claim
085002cd-dcf4-488a-ac20-9c50f70a1aa2	preferred_username	claim.name
085002cd-dcf4-488a-ac20-9c50f70a1aa2	String	jsonType.label
0b3cd099-5c49-420f-bad9-3f5af6d60d41	true	introspection.token.claim
0b3cd099-5c49-420f-bad9-3f5af6d60d41	true	userinfo.token.claim
0b3cd099-5c49-420f-bad9-3f5af6d60d41	birthdate	user.attribute
0b3cd099-5c49-420f-bad9-3f5af6d60d41	true	id.token.claim
0b3cd099-5c49-420f-bad9-3f5af6d60d41	true	access.token.claim
0b3cd099-5c49-420f-bad9-3f5af6d60d41	birthdate	claim.name
0b3cd099-5c49-420f-bad9-3f5af6d60d41	String	jsonType.label
1b439121-47e1-4b32-ac77-c48cfbc08dee	true	introspection.token.claim
1b439121-47e1-4b32-ac77-c48cfbc08dee	true	userinfo.token.claim
1b439121-47e1-4b32-ac77-c48cfbc08dee	locale	user.attribute
1b439121-47e1-4b32-ac77-c48cfbc08dee	true	id.token.claim
1b439121-47e1-4b32-ac77-c48cfbc08dee	true	access.token.claim
1b439121-47e1-4b32-ac77-c48cfbc08dee	locale	claim.name
1b439121-47e1-4b32-ac77-c48cfbc08dee	String	jsonType.label
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	true	introspection.token.claim
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	true	userinfo.token.claim
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	firstName	user.attribute
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	true	id.token.claim
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	true	access.token.claim
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	given_name	claim.name
2fce37fe-c7e7-4da2-be6a-b599e01a7c98	String	jsonType.label
3707885b-f3f0-49c1-8fc5-02bdfd84d64b	true	introspection.token.claim
3707885b-f3f0-49c1-8fc5-02bdfd84d64b	true	userinfo.token.claim
3707885b-f3f0-49c1-8fc5-02bdfd84d64b	true	id.token.claim
3707885b-f3f0-49c1-8fc5-02bdfd84d64b	true	access.token.claim
523cf99a-7cfd-496f-9808-d26262f657f2	true	introspection.token.claim
523cf99a-7cfd-496f-9808-d26262f657f2	true	userinfo.token.claim
523cf99a-7cfd-496f-9808-d26262f657f2	zoneinfo	user.attribute
523cf99a-7cfd-496f-9808-d26262f657f2	true	id.token.claim
523cf99a-7cfd-496f-9808-d26262f657f2	true	access.token.claim
523cf99a-7cfd-496f-9808-d26262f657f2	zoneinfo	claim.name
523cf99a-7cfd-496f-9808-d26262f657f2	String	jsonType.label
641e3317-be14-494c-933b-760ff44dc9d1	true	introspection.token.claim
641e3317-be14-494c-933b-760ff44dc9d1	true	userinfo.token.claim
641e3317-be14-494c-933b-760ff44dc9d1	gender	user.attribute
641e3317-be14-494c-933b-760ff44dc9d1	true	id.token.claim
641e3317-be14-494c-933b-760ff44dc9d1	true	access.token.claim
641e3317-be14-494c-933b-760ff44dc9d1	gender	claim.name
641e3317-be14-494c-933b-760ff44dc9d1	String	jsonType.label
725e6c3f-39d0-4c1f-ac96-b6ded9577995	true	introspection.token.claim
725e6c3f-39d0-4c1f-ac96-b6ded9577995	true	userinfo.token.claim
725e6c3f-39d0-4c1f-ac96-b6ded9577995	nickname	user.attribute
725e6c3f-39d0-4c1f-ac96-b6ded9577995	true	id.token.claim
725e6c3f-39d0-4c1f-ac96-b6ded9577995	true	access.token.claim
725e6c3f-39d0-4c1f-ac96-b6ded9577995	nickname	claim.name
725e6c3f-39d0-4c1f-ac96-b6ded9577995	String	jsonType.label
7642dfae-06b9-422b-93b6-acb6658e9ffe	true	introspection.token.claim
7642dfae-06b9-422b-93b6-acb6658e9ffe	true	userinfo.token.claim
7642dfae-06b9-422b-93b6-acb6658e9ffe	lastName	user.attribute
7642dfae-06b9-422b-93b6-acb6658e9ffe	true	id.token.claim
7642dfae-06b9-422b-93b6-acb6658e9ffe	true	access.token.claim
7642dfae-06b9-422b-93b6-acb6658e9ffe	family_name	claim.name
7642dfae-06b9-422b-93b6-acb6658e9ffe	String	jsonType.label
97f0b451-138a-4489-8f0a-9d4895a29f71	true	introspection.token.claim
97f0b451-138a-4489-8f0a-9d4895a29f71	true	userinfo.token.claim
97f0b451-138a-4489-8f0a-9d4895a29f71	profile	user.attribute
97f0b451-138a-4489-8f0a-9d4895a29f71	true	id.token.claim
97f0b451-138a-4489-8f0a-9d4895a29f71	true	access.token.claim
97f0b451-138a-4489-8f0a-9d4895a29f71	profile	claim.name
97f0b451-138a-4489-8f0a-9d4895a29f71	String	jsonType.label
9c397229-36f4-43a9-ba4e-fc94982b8599	true	introspection.token.claim
9c397229-36f4-43a9-ba4e-fc94982b8599	true	userinfo.token.claim
9c397229-36f4-43a9-ba4e-fc94982b8599	middleName	user.attribute
9c397229-36f4-43a9-ba4e-fc94982b8599	true	id.token.claim
9c397229-36f4-43a9-ba4e-fc94982b8599	true	access.token.claim
9c397229-36f4-43a9-ba4e-fc94982b8599	middle_name	claim.name
9c397229-36f4-43a9-ba4e-fc94982b8599	String	jsonType.label
cecb1677-7b2a-403a-a0cf-ebde798b5d30	true	introspection.token.claim
cecb1677-7b2a-403a-a0cf-ebde798b5d30	true	userinfo.token.claim
cecb1677-7b2a-403a-a0cf-ebde798b5d30	website	user.attribute
cecb1677-7b2a-403a-a0cf-ebde798b5d30	true	id.token.claim
cecb1677-7b2a-403a-a0cf-ebde798b5d30	true	access.token.claim
cecb1677-7b2a-403a-a0cf-ebde798b5d30	website	claim.name
cecb1677-7b2a-403a-a0cf-ebde798b5d30	String	jsonType.label
dd137660-af28-4d57-bf30-47ebb63b1d06	true	introspection.token.claim
dd137660-af28-4d57-bf30-47ebb63b1d06	true	userinfo.token.claim
dd137660-af28-4d57-bf30-47ebb63b1d06	updatedAt	user.attribute
dd137660-af28-4d57-bf30-47ebb63b1d06	true	id.token.claim
dd137660-af28-4d57-bf30-47ebb63b1d06	true	access.token.claim
dd137660-af28-4d57-bf30-47ebb63b1d06	updated_at	claim.name
dd137660-af28-4d57-bf30-47ebb63b1d06	long	jsonType.label
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	true	introspection.token.claim
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	true	userinfo.token.claim
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	emailVerified	user.attribute
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	true	id.token.claim
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	true	access.token.claim
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	email_verified	claim.name
5d79fc61-c61f-4049-ad0e-b26b1b7a07c6	boolean	jsonType.label
a3590627-718d-4319-827f-3910ed862942	true	introspection.token.claim
a3590627-718d-4319-827f-3910ed862942	true	userinfo.token.claim
a3590627-718d-4319-827f-3910ed862942	email	user.attribute
a3590627-718d-4319-827f-3910ed862942	true	id.token.claim
a3590627-718d-4319-827f-3910ed862942	true	access.token.claim
a3590627-718d-4319-827f-3910ed862942	email	claim.name
a3590627-718d-4319-827f-3910ed862942	String	jsonType.label
775debf4-f225-4525-91ba-18413f0ea1bb	formatted	user.attribute.formatted
775debf4-f225-4525-91ba-18413f0ea1bb	country	user.attribute.country
775debf4-f225-4525-91ba-18413f0ea1bb	true	introspection.token.claim
775debf4-f225-4525-91ba-18413f0ea1bb	postal_code	user.attribute.postal_code
775debf4-f225-4525-91ba-18413f0ea1bb	true	userinfo.token.claim
775debf4-f225-4525-91ba-18413f0ea1bb	street	user.attribute.street
775debf4-f225-4525-91ba-18413f0ea1bb	true	id.token.claim
775debf4-f225-4525-91ba-18413f0ea1bb	region	user.attribute.region
775debf4-f225-4525-91ba-18413f0ea1bb	true	access.token.claim
775debf4-f225-4525-91ba-18413f0ea1bb	locality	user.attribute.locality
12257308-2e6f-4806-9d21-724032e972ed	true	introspection.token.claim
12257308-2e6f-4806-9d21-724032e972ed	true	userinfo.token.claim
12257308-2e6f-4806-9d21-724032e972ed	phoneNumberVerified	user.attribute
12257308-2e6f-4806-9d21-724032e972ed	true	id.token.claim
12257308-2e6f-4806-9d21-724032e972ed	true	access.token.claim
12257308-2e6f-4806-9d21-724032e972ed	phone_number_verified	claim.name
12257308-2e6f-4806-9d21-724032e972ed	boolean	jsonType.label
dddafef0-d985-4393-971c-1461d89b278c	true	introspection.token.claim
dddafef0-d985-4393-971c-1461d89b278c	true	userinfo.token.claim
dddafef0-d985-4393-971c-1461d89b278c	phoneNumber	user.attribute
dddafef0-d985-4393-971c-1461d89b278c	true	id.token.claim
dddafef0-d985-4393-971c-1461d89b278c	true	access.token.claim
dddafef0-d985-4393-971c-1461d89b278c	phone_number	claim.name
dddafef0-d985-4393-971c-1461d89b278c	String	jsonType.label
2caa43f7-559d-4b33-969c-bc010d8a3f92	true	introspection.token.claim
2caa43f7-559d-4b33-969c-bc010d8a3f92	true	multivalued
2caa43f7-559d-4b33-969c-bc010d8a3f92	foo	user.attribute
2caa43f7-559d-4b33-969c-bc010d8a3f92	true	access.token.claim
2caa43f7-559d-4b33-969c-bc010d8a3f92	resource_access.${client_id}.roles	claim.name
2caa43f7-559d-4b33-969c-bc010d8a3f92	String	jsonType.label
4105245e-d022-4189-a5e8-1d3d72fd1377	true	introspection.token.claim
4105245e-d022-4189-a5e8-1d3d72fd1377	true	access.token.claim
5a8a8262-7203-48c4-bdf0-5439079057bd	true	introspection.token.claim
5a8a8262-7203-48c4-bdf0-5439079057bd	true	multivalued
5a8a8262-7203-48c4-bdf0-5439079057bd	foo	user.attribute
5a8a8262-7203-48c4-bdf0-5439079057bd	true	access.token.claim
5a8a8262-7203-48c4-bdf0-5439079057bd	realm_access.roles	claim.name
5a8a8262-7203-48c4-bdf0-5439079057bd	String	jsonType.label
42800abc-3093-4a57-bfa4-a3ddb7546533	true	introspection.token.claim
42800abc-3093-4a57-bfa4-a3ddb7546533	true	access.token.claim
2b96e852-afda-43f5-b2bf-e881f4915119	true	introspection.token.claim
2b96e852-afda-43f5-b2bf-e881f4915119	true	multivalued
2b96e852-afda-43f5-b2bf-e881f4915119	foo	user.attribute
2b96e852-afda-43f5-b2bf-e881f4915119	true	id.token.claim
2b96e852-afda-43f5-b2bf-e881f4915119	true	access.token.claim
2b96e852-afda-43f5-b2bf-e881f4915119	groups	claim.name
2b96e852-afda-43f5-b2bf-e881f4915119	String	jsonType.label
f8088569-99ae-446e-aee4-1a412b88f5dc	true	introspection.token.claim
f8088569-99ae-446e-aee4-1a412b88f5dc	true	userinfo.token.claim
f8088569-99ae-446e-aee4-1a412b88f5dc	username	user.attribute
f8088569-99ae-446e-aee4-1a412b88f5dc	true	id.token.claim
f8088569-99ae-446e-aee4-1a412b88f5dc	true	access.token.claim
f8088569-99ae-446e-aee4-1a412b88f5dc	upn	claim.name
f8088569-99ae-446e-aee4-1a412b88f5dc	String	jsonType.label
49247867-e885-4ffa-8d49-5b871009cad6	true	introspection.token.claim
49247867-e885-4ffa-8d49-5b871009cad6	true	id.token.claim
49247867-e885-4ffa-8d49-5b871009cad6	true	access.token.claim
7f160cfe-6ccf-423a-b81e-20560cae90e7	AUTH_TIME	user.session.note
7f160cfe-6ccf-423a-b81e-20560cae90e7	true	introspection.token.claim
7f160cfe-6ccf-423a-b81e-20560cae90e7	true	id.token.claim
7f160cfe-6ccf-423a-b81e-20560cae90e7	true	access.token.claim
7f160cfe-6ccf-423a-b81e-20560cae90e7	auth_time	claim.name
7f160cfe-6ccf-423a-b81e-20560cae90e7	long	jsonType.label
dea55e79-d2da-4263-b77c-cec16e420ea9	true	introspection.token.claim
dea55e79-d2da-4263-b77c-cec16e420ea9	true	access.token.claim
3a88997a-b402-4379-a3a0-57b4f636f957	clientAddress	user.session.note
3a88997a-b402-4379-a3a0-57b4f636f957	true	introspection.token.claim
3a88997a-b402-4379-a3a0-57b4f636f957	true	id.token.claim
3a88997a-b402-4379-a3a0-57b4f636f957	true	access.token.claim
3a88997a-b402-4379-a3a0-57b4f636f957	clientAddress	claim.name
3a88997a-b402-4379-a3a0-57b4f636f957	String	jsonType.label
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	clientHost	user.session.note
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	true	introspection.token.claim
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	true	id.token.claim
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	true	access.token.claim
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	clientHost	claim.name
a9aa94a9-fbbe-47e1-9aef-f3d5bd0f650e	String	jsonType.label
c490627d-224f-462d-a6a0-66917c423555	client_id	user.session.note
c490627d-224f-462d-a6a0-66917c423555	true	introspection.token.claim
c490627d-224f-462d-a6a0-66917c423555	true	id.token.claim
c490627d-224f-462d-a6a0-66917c423555	true	access.token.claim
c490627d-224f-462d-a6a0-66917c423555	client_id	claim.name
c490627d-224f-462d-a6a0-66917c423555	String	jsonType.label
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	true	introspection.token.claim
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	true	multivalued
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	true	id.token.claim
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	true	access.token.claim
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	organization	claim.name
95b3c3de-2a3d-4ffa-ac56-2fd415a76960	String	jsonType.label
06314dcf-b6a5-4502-a8be-88c82d8042d1	false	single
06314dcf-b6a5-4502-a8be-88c82d8042d1	Basic	attribute.nameformat
06314dcf-b6a5-4502-a8be-88c82d8042d1	Role	attribute.name
062e0ddc-2baf-4422-83ce-0790a6a3bec5	true	introspection.token.claim
062e0ddc-2baf-4422-83ce-0790a6a3bec5	true	userinfo.token.claim
062e0ddc-2baf-4422-83ce-0790a6a3bec5	birthdate	user.attribute
062e0ddc-2baf-4422-83ce-0790a6a3bec5	true	id.token.claim
062e0ddc-2baf-4422-83ce-0790a6a3bec5	true	access.token.claim
062e0ddc-2baf-4422-83ce-0790a6a3bec5	birthdate	claim.name
062e0ddc-2baf-4422-83ce-0790a6a3bec5	String	jsonType.label
116df903-b883-4d9c-8716-b78ef191ad0e	true	introspection.token.claim
116df903-b883-4d9c-8716-b78ef191ad0e	true	userinfo.token.claim
116df903-b883-4d9c-8716-b78ef191ad0e	updatedAt	user.attribute
116df903-b883-4d9c-8716-b78ef191ad0e	true	id.token.claim
116df903-b883-4d9c-8716-b78ef191ad0e	true	access.token.claim
116df903-b883-4d9c-8716-b78ef191ad0e	updated_at	claim.name
116df903-b883-4d9c-8716-b78ef191ad0e	long	jsonType.label
17c87100-01c6-4f4e-9d32-0703cc3f892e	true	introspection.token.claim
17c87100-01c6-4f4e-9d32-0703cc3f892e	true	userinfo.token.claim
17c87100-01c6-4f4e-9d32-0703cc3f892e	gender	user.attribute
17c87100-01c6-4f4e-9d32-0703cc3f892e	true	id.token.claim
17c87100-01c6-4f4e-9d32-0703cc3f892e	true	access.token.claim
17c87100-01c6-4f4e-9d32-0703cc3f892e	gender	claim.name
17c87100-01c6-4f4e-9d32-0703cc3f892e	String	jsonType.label
2f039d83-350d-4bbd-b57c-ec93248e0042	true	introspection.token.claim
2f039d83-350d-4bbd-b57c-ec93248e0042	true	userinfo.token.claim
2f039d83-350d-4bbd-b57c-ec93248e0042	username	user.attribute
2f039d83-350d-4bbd-b57c-ec93248e0042	true	id.token.claim
2f039d83-350d-4bbd-b57c-ec93248e0042	true	access.token.claim
2f039d83-350d-4bbd-b57c-ec93248e0042	preferred_username	claim.name
2f039d83-350d-4bbd-b57c-ec93248e0042	String	jsonType.label
626675d2-a51a-4f7f-a8a7-33f6737036ce	true	introspection.token.claim
626675d2-a51a-4f7f-a8a7-33f6737036ce	true	userinfo.token.claim
626675d2-a51a-4f7f-a8a7-33f6737036ce	firstName	user.attribute
626675d2-a51a-4f7f-a8a7-33f6737036ce	true	id.token.claim
626675d2-a51a-4f7f-a8a7-33f6737036ce	true	access.token.claim
626675d2-a51a-4f7f-a8a7-33f6737036ce	given_name	claim.name
626675d2-a51a-4f7f-a8a7-33f6737036ce	String	jsonType.label
698e4a54-118b-4672-a222-721da13c9a71	true	id.token.claim
698e4a54-118b-4672-a222-721da13c9a71	true	introspection.token.claim
698e4a54-118b-4672-a222-721da13c9a71	true	access.token.claim
698e4a54-118b-4672-a222-721da13c9a71	true	userinfo.token.claim
7232dec9-c707-44e4-8503-4e90549d0af6	true	introspection.token.claim
7232dec9-c707-44e4-8503-4e90549d0af6	true	userinfo.token.claim
7232dec9-c707-44e4-8503-4e90549d0af6	picture	user.attribute
7232dec9-c707-44e4-8503-4e90549d0af6	true	id.token.claim
7232dec9-c707-44e4-8503-4e90549d0af6	true	access.token.claim
7232dec9-c707-44e4-8503-4e90549d0af6	picture	claim.name
7232dec9-c707-44e4-8503-4e90549d0af6	String	jsonType.label
8c02b86f-0234-4c40-8e40-e1d677551d35	true	introspection.token.claim
8c02b86f-0234-4c40-8e40-e1d677551d35	true	userinfo.token.claim
8c02b86f-0234-4c40-8e40-e1d677551d35	locale	user.attribute
8c02b86f-0234-4c40-8e40-e1d677551d35	true	id.token.claim
8c02b86f-0234-4c40-8e40-e1d677551d35	true	access.token.claim
8c02b86f-0234-4c40-8e40-e1d677551d35	locale	claim.name
8c02b86f-0234-4c40-8e40-e1d677551d35	String	jsonType.label
a49262ec-ab25-4f24-85e7-9c3779575628	true	introspection.token.claim
a49262ec-ab25-4f24-85e7-9c3779575628	true	userinfo.token.claim
a49262ec-ab25-4f24-85e7-9c3779575628	nickname	user.attribute
a49262ec-ab25-4f24-85e7-9c3779575628	true	id.token.claim
a49262ec-ab25-4f24-85e7-9c3779575628	true	access.token.claim
a49262ec-ab25-4f24-85e7-9c3779575628	nickname	claim.name
a49262ec-ab25-4f24-85e7-9c3779575628	String	jsonType.label
b0653567-6ea6-4412-87ca-11ebd4848327	true	introspection.token.claim
b0653567-6ea6-4412-87ca-11ebd4848327	true	userinfo.token.claim
b0653567-6ea6-4412-87ca-11ebd4848327	middleName	user.attribute
b0653567-6ea6-4412-87ca-11ebd4848327	true	id.token.claim
b0653567-6ea6-4412-87ca-11ebd4848327	true	access.token.claim
b0653567-6ea6-4412-87ca-11ebd4848327	middle_name	claim.name
b0653567-6ea6-4412-87ca-11ebd4848327	String	jsonType.label
b1200769-bdb8-469a-ba82-0fd8675df6fc	true	introspection.token.claim
b1200769-bdb8-469a-ba82-0fd8675df6fc	true	userinfo.token.claim
b1200769-bdb8-469a-ba82-0fd8675df6fc	lastName	user.attribute
b1200769-bdb8-469a-ba82-0fd8675df6fc	true	id.token.claim
b1200769-bdb8-469a-ba82-0fd8675df6fc	true	access.token.claim
b1200769-bdb8-469a-ba82-0fd8675df6fc	family_name	claim.name
b1200769-bdb8-469a-ba82-0fd8675df6fc	String	jsonType.label
b2a2c444-bbce-4780-9989-76b2f4648529	true	introspection.token.claim
b2a2c444-bbce-4780-9989-76b2f4648529	true	userinfo.token.claim
b2a2c444-bbce-4780-9989-76b2f4648529	profile	user.attribute
b2a2c444-bbce-4780-9989-76b2f4648529	true	id.token.claim
b2a2c444-bbce-4780-9989-76b2f4648529	true	access.token.claim
b2a2c444-bbce-4780-9989-76b2f4648529	profile	claim.name
b2a2c444-bbce-4780-9989-76b2f4648529	String	jsonType.label
bfbacb69-38bb-4de7-a2ee-1fad22019d16	true	introspection.token.claim
bfbacb69-38bb-4de7-a2ee-1fad22019d16	true	userinfo.token.claim
bfbacb69-38bb-4de7-a2ee-1fad22019d16	zoneinfo	user.attribute
bfbacb69-38bb-4de7-a2ee-1fad22019d16	true	id.token.claim
bfbacb69-38bb-4de7-a2ee-1fad22019d16	true	access.token.claim
bfbacb69-38bb-4de7-a2ee-1fad22019d16	zoneinfo	claim.name
bfbacb69-38bb-4de7-a2ee-1fad22019d16	String	jsonType.label
f38819a3-e182-48a8-9430-792824c6233e	true	introspection.token.claim
f38819a3-e182-48a8-9430-792824c6233e	true	userinfo.token.claim
f38819a3-e182-48a8-9430-792824c6233e	website	user.attribute
f38819a3-e182-48a8-9430-792824c6233e	true	id.token.claim
f38819a3-e182-48a8-9430-792824c6233e	true	access.token.claim
f38819a3-e182-48a8-9430-792824c6233e	website	claim.name
f38819a3-e182-48a8-9430-792824c6233e	String	jsonType.label
670c9996-65b3-4d40-ab25-74365f3aea14	true	id.token.claim
670c9996-65b3-4d40-ab25-74365f3aea14	true	introspection.token.claim
670c9996-65b3-4d40-ab25-74365f3aea14	true	access.token.claim
670c9996-65b3-4d40-ab25-74365f3aea14	true	userinfo.token.claim
390ea97d-84bd-4a1e-84f4-d6ced4643054	clientAddress	user.session.note
390ea97d-84bd-4a1e-84f4-d6ced4643054	true	introspection.token.claim
390ea97d-84bd-4a1e-84f4-d6ced4643054	true	userinfo.token.claim
390ea97d-84bd-4a1e-84f4-d6ced4643054	true	id.token.claim
390ea97d-84bd-4a1e-84f4-d6ced4643054	true	access.token.claim
390ea97d-84bd-4a1e-84f4-d6ced4643054	clientAddress	claim.name
390ea97d-84bd-4a1e-84f4-d6ced4643054	String	jsonType.label
b4c003d0-ef4a-4786-848e-f57304f0d60f	client_id	user.session.note
b4c003d0-ef4a-4786-848e-f57304f0d60f	true	id.token.claim
b4c003d0-ef4a-4786-848e-f57304f0d60f	true	introspection.token.claim
b4c003d0-ef4a-4786-848e-f57304f0d60f	true	access.token.claim
b4c003d0-ef4a-4786-848e-f57304f0d60f	client_id	claim.name
b4c003d0-ef4a-4786-848e-f57304f0d60f	String	jsonType.label
f38bae18-6d57-441e-aedd-56345bb4361b	clientHost	user.session.note
f38bae18-6d57-441e-aedd-56345bb4361b	true	id.token.claim
f38bae18-6d57-441e-aedd-56345bb4361b	true	introspection.token.claim
f38bae18-6d57-441e-aedd-56345bb4361b	true	access.token.claim
f38bae18-6d57-441e-aedd-56345bb4361b	clientHost	claim.name
f38bae18-6d57-441e-aedd-56345bb4361b	String	jsonType.label
b4c003d0-ef4a-4786-848e-f57304f0d60f	true	userinfo.token.claim
f38bae18-6d57-441e-aedd-56345bb4361b	true	userinfo.token.claim
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	true	introspection.token.claim
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	true	multivalued
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	true	userinfo.token.claim
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	foo	user.attribute
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	true	id.token.claim
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	true	access.token.claim
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	groups	claim.name
3a84e6e5-df88-4cbe-a08f-e2a3429c19af	String	jsonType.label
7b26078c-660c-444b-ae89-7cb31f70d359	true	introspection.token.claim
7b26078c-660c-444b-ae89-7cb31f70d359	true	userinfo.token.claim
7b26078c-660c-444b-ae89-7cb31f70d359	username	user.attribute
7b26078c-660c-444b-ae89-7cb31f70d359	true	id.token.claim
7b26078c-660c-444b-ae89-7cb31f70d359	true	access.token.claim
7b26078c-660c-444b-ae89-7cb31f70d359	upn	claim.name
7b26078c-660c-444b-ae89-7cb31f70d359	String	jsonType.label
15b35999-6907-480b-a236-9f22046112ba	true	introspection.token.claim
15b35999-6907-480b-a236-9f22046112ba	true	multivalued
15b35999-6907-480b-a236-9f22046112ba	true	userinfo.token.claim
15b35999-6907-480b-a236-9f22046112ba	true	id.token.claim
15b35999-6907-480b-a236-9f22046112ba	true	access.token.claim
15b35999-6907-480b-a236-9f22046112ba	organization	claim.name
15b35999-6907-480b-a236-9f22046112ba	String	jsonType.label
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	true	introspection.token.claim
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	true	userinfo.token.claim
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	phoneNumber	user.attribute
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	true	id.token.claim
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	true	access.token.claim
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	phone_number	claim.name
9f4b71e6-c9b4-4503-9209-42b6ca2f261a	String	jsonType.label
c9a3f527-c180-47c0-8827-d1f6d6c32eac	true	introspection.token.claim
c9a3f527-c180-47c0-8827-d1f6d6c32eac	true	userinfo.token.claim
c9a3f527-c180-47c0-8827-d1f6d6c32eac	phoneNumberVerified	user.attribute
c9a3f527-c180-47c0-8827-d1f6d6c32eac	true	id.token.claim
c9a3f527-c180-47c0-8827-d1f6d6c32eac	true	access.token.claim
c9a3f527-c180-47c0-8827-d1f6d6c32eac	phone_number_verified	claim.name
c9a3f527-c180-47c0-8827-d1f6d6c32eac	boolean	jsonType.label
46671e1c-a07d-4e29-be12-06592350da35	true	introspection.token.claim
46671e1c-a07d-4e29-be12-06592350da35	true	access.token.claim
949366e8-2ea7-4a77-89cd-dd5384cf00d8	foo	user.attribute
949366e8-2ea7-4a77-89cd-dd5384cf00d8	true	introspection.token.claim
949366e8-2ea7-4a77-89cd-dd5384cf00d8	true	access.token.claim
949366e8-2ea7-4a77-89cd-dd5384cf00d8	resource_access.${client_id}.roles	claim.name
949366e8-2ea7-4a77-89cd-dd5384cf00d8	String	jsonType.label
949366e8-2ea7-4a77-89cd-dd5384cf00d8	true	multivalued
c268fa05-1c14-49a8-bb41-3223ff86f565	foo	user.attribute
c268fa05-1c14-49a8-bb41-3223ff86f565	true	introspection.token.claim
c268fa05-1c14-49a8-bb41-3223ff86f565	true	access.token.claim
c268fa05-1c14-49a8-bb41-3223ff86f565	realm_access.roles	claim.name
c268fa05-1c14-49a8-bb41-3223ff86f565	String	jsonType.label
c268fa05-1c14-49a8-bb41-3223ff86f565	true	multivalued
581f67d3-85f9-4f88-b35e-3d3668fa0386	formatted	user.attribute.formatted
581f67d3-85f9-4f88-b35e-3d3668fa0386	country	user.attribute.country
581f67d3-85f9-4f88-b35e-3d3668fa0386	true	introspection.token.claim
581f67d3-85f9-4f88-b35e-3d3668fa0386	postal_code	user.attribute.postal_code
581f67d3-85f9-4f88-b35e-3d3668fa0386	true	userinfo.token.claim
581f67d3-85f9-4f88-b35e-3d3668fa0386	street	user.attribute.street
581f67d3-85f9-4f88-b35e-3d3668fa0386	true	id.token.claim
581f67d3-85f9-4f88-b35e-3d3668fa0386	region	user.attribute.region
581f67d3-85f9-4f88-b35e-3d3668fa0386	true	access.token.claim
581f67d3-85f9-4f88-b35e-3d3668fa0386	locality	user.attribute.locality
abcf0267-ae32-475b-890c-651eee1f2eaf	true	introspection.token.claim
abcf0267-ae32-475b-890c-651eee1f2eaf	true	access.token.claim
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	true	introspection.token.claim
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	true	userinfo.token.claim
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	emailVerified	user.attribute
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	true	id.token.claim
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	true	access.token.claim
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	email_verified	claim.name
7cb99809-2629-42a8-ba4c-5b7e1a9887f1	boolean	jsonType.label
b07fb829-1d8c-40d7-b346-579f3689f9a2	true	introspection.token.claim
b07fb829-1d8c-40d7-b346-579f3689f9a2	true	userinfo.token.claim
b07fb829-1d8c-40d7-b346-579f3689f9a2	email	user.attribute
b07fb829-1d8c-40d7-b346-579f3689f9a2	true	id.token.claim
b07fb829-1d8c-40d7-b346-579f3689f9a2	true	access.token.claim
b07fb829-1d8c-40d7-b346-579f3689f9a2	email	claim.name
b07fb829-1d8c-40d7-b346-579f3689f9a2	String	jsonType.label
7249555d-016b-4ffa-af2b-823aa20b74d2	true	introspection.token.claim
7249555d-016b-4ffa-af2b-823aa20b74d2	true	access.token.claim
c2335d34-554f-4107-a20b-fcef2c8c9a6e	AUTH_TIME	user.session.note
c2335d34-554f-4107-a20b-fcef2c8c9a6e	true	introspection.token.claim
c2335d34-554f-4107-a20b-fcef2c8c9a6e	true	userinfo.token.claim
c2335d34-554f-4107-a20b-fcef2c8c9a6e	true	id.token.claim
c2335d34-554f-4107-a20b-fcef2c8c9a6e	true	access.token.claim
c2335d34-554f-4107-a20b-fcef2c8c9a6e	auth_time	claim.name
c2335d34-554f-4107-a20b-fcef2c8c9a6e	long	jsonType.label
55466db8-7ead-4c8f-99bb-7d2390773eb3	fitcontrol-client	included.client.audience
55466db8-7ead-4c8f-99bb-7d2390773eb3	false	id.token.claim
55466db8-7ead-4c8f-99bb-7d2390773eb3	false	lightweight.claim
55466db8-7ead-4c8f-99bb-7d2390773eb3	true	access.token.claim
55466db8-7ead-4c8f-99bb-7d2390773eb3	true	introspection.token.claim
55466db8-7ead-4c8f-99bb-7d2390773eb3	false	userinfo.token.claim
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	true	introspection.token.claim
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	true	userinfo.token.claim
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	locale	user.attribute
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	true	id.token.claim
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	true	access.token.claim
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	locale	claim.name
81382b1c-2ed6-4fec-a114-27f2bb0ad9f1	String	jsonType.label
\.


--
-- TOC entry 4215 (class 0 OID 16443)
-- Dependencies: 222
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
52cc0a6b-3160-4f03-bd34-7be149371f52	60	300	300	\N	\N	\N	t	f	0	\N	fitcontrol	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	73496781-6c99-4431-8252-6d9446bdd618	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	eb4a6ff7-5e8a-421c-af5c-3ee32936e540	5fef84ea-06d5-4c83-9a93-722832b16312	fc9099f0-7d7f-48de-8920-be428e4e5cb6	9910f55c-678d-4997-97bd-7e30691886cc	14742762-15e4-49cd-8309-ad600ffaa55b	2592000	f	900	t	f	9cbb2d8d-feb7-47d2-96cb-1416304b2faa	0	f	0	0	ddabfa8b-6ddd-4237-8142-1cde44afd9ba
f63a6b35-ce9c-442a-bf20-081b5ada87c0	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	15c530bf-fc36-4c36-8494-d7aa47c90c31	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	6592fa50-d55c-4e93-8153-eb5f38628242	e1eb4a3f-5ba2-4bee-a512-dee50f2903b0	2c3b107f-87eb-415d-969d-cf09a06c0295	e38fe65e-7109-4c22-9e68-3f6f3f41f9d6	87bb08ab-cbef-4549-976a-c2deefbe1e40	2592000	f	900	t	f	39d58a93-0b54-431b-aee2-efd6ead963da	0	f	0	0	2b9e655b-fbb4-4ddb-8066-005238e7b023
\.


--
-- TOC entry 4216 (class 0 OID 16460)
-- Dependencies: 223
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	f63a6b35-ce9c-442a-bf20-081b5ada87c0	
_browser_header.xContentTypeOptions	f63a6b35-ce9c-442a-bf20-081b5ada87c0	nosniff
_browser_header.referrerPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	no-referrer
_browser_header.xRobotsTag	f63a6b35-ce9c-442a-bf20-081b5ada87c0	none
_browser_header.xFrameOptions	f63a6b35-ce9c-442a-bf20-081b5ada87c0	SAMEORIGIN
_browser_header.contentSecurityPolicy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	f63a6b35-ce9c-442a-bf20-081b5ada87c0	max-age=31536000; includeSubDomains
bruteForceProtected	f63a6b35-ce9c-442a-bf20-081b5ada87c0	false
permanentLockout	f63a6b35-ce9c-442a-bf20-081b5ada87c0	false
maxTemporaryLockouts	f63a6b35-ce9c-442a-bf20-081b5ada87c0	0
bruteForceStrategy	f63a6b35-ce9c-442a-bf20-081b5ada87c0	MULTIPLE
maxFailureWaitSeconds	f63a6b35-ce9c-442a-bf20-081b5ada87c0	900
minimumQuickLoginWaitSeconds	f63a6b35-ce9c-442a-bf20-081b5ada87c0	60
waitIncrementSeconds	f63a6b35-ce9c-442a-bf20-081b5ada87c0	60
quickLoginCheckMilliSeconds	f63a6b35-ce9c-442a-bf20-081b5ada87c0	1000
maxDeltaTimeSeconds	f63a6b35-ce9c-442a-bf20-081b5ada87c0	43200
failureFactor	f63a6b35-ce9c-442a-bf20-081b5ada87c0	30
realmReusableOtpCode	f63a6b35-ce9c-442a-bf20-081b5ada87c0	false
firstBrokerLoginFlowId	f63a6b35-ce9c-442a-bf20-081b5ada87c0	85847db3-799e-44c4-8623-06c18e491027
displayName	f63a6b35-ce9c-442a-bf20-081b5ada87c0	Keycloak
displayNameHtml	f63a6b35-ce9c-442a-bf20-081b5ada87c0	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	f63a6b35-ce9c-442a-bf20-081b5ada87c0	RS256
offlineSessionMaxLifespanEnabled	f63a6b35-ce9c-442a-bf20-081b5ada87c0	false
offlineSessionMaxLifespan	f63a6b35-ce9c-442a-bf20-081b5ada87c0	5184000
_browser_header.contentSecurityPolicyReportOnly	52cc0a6b-3160-4f03-bd34-7be149371f52	
_browser_header.xContentTypeOptions	52cc0a6b-3160-4f03-bd34-7be149371f52	nosniff
_browser_header.referrerPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	no-referrer
_browser_header.xRobotsTag	52cc0a6b-3160-4f03-bd34-7be149371f52	none
_browser_header.xFrameOptions	52cc0a6b-3160-4f03-bd34-7be149371f52	SAMEORIGIN
_browser_header.contentSecurityPolicy	52cc0a6b-3160-4f03-bd34-7be149371f52	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	52cc0a6b-3160-4f03-bd34-7be149371f52	max-age=31536000; includeSubDomains
bruteForceProtected	52cc0a6b-3160-4f03-bd34-7be149371f52	false
permanentLockout	52cc0a6b-3160-4f03-bd34-7be149371f52	false
maxTemporaryLockouts	52cc0a6b-3160-4f03-bd34-7be149371f52	0
bruteForceStrategy	52cc0a6b-3160-4f03-bd34-7be149371f52	MULTIPLE
maxFailureWaitSeconds	52cc0a6b-3160-4f03-bd34-7be149371f52	900
minimumQuickLoginWaitSeconds	52cc0a6b-3160-4f03-bd34-7be149371f52	60
waitIncrementSeconds	52cc0a6b-3160-4f03-bd34-7be149371f52	60
quickLoginCheckMilliSeconds	52cc0a6b-3160-4f03-bd34-7be149371f52	1000
maxDeltaTimeSeconds	52cc0a6b-3160-4f03-bd34-7be149371f52	43200
failureFactor	52cc0a6b-3160-4f03-bd34-7be149371f52	30
realmReusableOtpCode	52cc0a6b-3160-4f03-bd34-7be149371f52	false
defaultSignatureAlgorithm	52cc0a6b-3160-4f03-bd34-7be149371f52	RS256
offlineSessionMaxLifespanEnabled	52cc0a6b-3160-4f03-bd34-7be149371f52	false
offlineSessionMaxLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	5184000
clientSessionIdleTimeout	52cc0a6b-3160-4f03-bd34-7be149371f52	0
clientSessionMaxLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	0
clientOfflineSessionIdleTimeout	52cc0a6b-3160-4f03-bd34-7be149371f52	0
clientOfflineSessionMaxLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	0
actionTokenGeneratedByAdminLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	43200
actionTokenGeneratedByUserLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	300
oauth2DeviceCodeLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	600
oauth2DevicePollingInterval	52cc0a6b-3160-4f03-bd34-7be149371f52	5
organizationsEnabled	52cc0a6b-3160-4f03-bd34-7be149371f52	false
adminPermissionsEnabled	52cc0a6b-3160-4f03-bd34-7be149371f52	false
webAuthnPolicyRpEntityName	52cc0a6b-3160-4f03-bd34-7be149371f52	keycloak
webAuthnPolicySignatureAlgorithms	52cc0a6b-3160-4f03-bd34-7be149371f52	ES256,RS256
webAuthnPolicyRpId	52cc0a6b-3160-4f03-bd34-7be149371f52	
webAuthnPolicyAttestationConveyancePreference	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyAuthenticatorAttachment	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyRequireResidentKey	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyUserVerificationRequirement	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyCreateTimeout	52cc0a6b-3160-4f03-bd34-7be149371f52	0
webAuthnPolicyAvoidSameAuthenticatorRegister	52cc0a6b-3160-4f03-bd34-7be149371f52	false
webAuthnPolicyRpEntityNamePasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	ES256,RS256
webAuthnPolicyRpIdPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	
webAuthnPolicyAttestationConveyancePreferencePasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyRequireResidentKeyPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	not specified
webAuthnPolicyCreateTimeoutPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	52cc0a6b-3160-4f03-bd34-7be149371f52	false
cibaBackchannelTokenDeliveryMode	52cc0a6b-3160-4f03-bd34-7be149371f52	poll
cibaExpiresIn	52cc0a6b-3160-4f03-bd34-7be149371f52	120
cibaInterval	52cc0a6b-3160-4f03-bd34-7be149371f52	5
cibaAuthRequestedUserHint	52cc0a6b-3160-4f03-bd34-7be149371f52	login_hint
parRequestUriLifespan	52cc0a6b-3160-4f03-bd34-7be149371f52	60
firstBrokerLoginFlowId	52cc0a6b-3160-4f03-bd34-7be149371f52	30ccdcbe-3663-447f-9322-c9c7ce56cc8b
verifiableCredentialsEnabled	52cc0a6b-3160-4f03-bd34-7be149371f52	false
client-policies.profiles	52cc0a6b-3160-4f03-bd34-7be149371f52	{"profiles":[]}
client-policies.policies	52cc0a6b-3160-4f03-bd34-7be149371f52	{"policies":[]}
\.


--
-- TOC entry 4257 (class 0 OID 17217)
-- Dependencies: 264
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4237 (class 0 OID 16913)
-- Dependencies: 244
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 16468)
-- Dependencies: 224
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
f63a6b35-ce9c-442a-bf20-081b5ada87c0	jboss-logging
52cc0a6b-3160-4f03-bd34-7be149371f52	jboss-logging
\.


--
-- TOC entry 4290 (class 0 OID 17919)
-- Dependencies: 297
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4218 (class 0 OID 16471)
-- Dependencies: 225
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	f63a6b35-ce9c-442a-bf20-081b5ada87c0
password	password	t	t	52cc0a6b-3160-4f03-bd34-7be149371f52
\.


--
-- TOC entry 4219 (class 0 OID 16478)
-- Dependencies: 226
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4236 (class 0 OID 16829)
-- Dependencies: 243
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4220 (class 0 OID 16488)
-- Dependencies: 227
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
6d5de729-47f7-4d46-983a-51120b7008d8	/realms/master/account/*
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	/realms/master/account/*
3429101c-5b88-40e4-995c-b603e5ff503b	/admin/master/console/*
2d483f57-f672-417b-a3fa-c784fc389ff0	/realms/fitcontrol/account/*
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	/realms/fitcontrol/account/*
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://host.docker.internal:8083/fitcontrol/tracker/login/oauth2/code/keycloak
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://host.docker.internal:8083/*
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://localhost:8083/fitcontrol/tracker/login/oauth2/code/keycloak
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://localhost:4200
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://host.docker.internal:8083/fitcontrol/tracker
468a8d58-a07a-4288-b293-8e740a5c7922	http://localhost:4200/*
1c573beb-cddf-487d-827c-572abdcda65a	/admin/fitcontrol/console/*
de942f08-1fe1-42f7-a73d-8586a3e7f12f	/*
\.


--
-- TOC entry 4250 (class 0 OID 17152)
-- Dependencies: 257
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4249 (class 0 OID 17145)
-- Dependencies: 256
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
c4d96070-0568-4ec0-ae3e-35ef712a1324	VERIFY_EMAIL	Verify Email	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	VERIFY_EMAIL	50
570b9b16-3385-4152-8d23-11f7e064d922	UPDATE_PROFILE	Update Profile	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	UPDATE_PROFILE	40
286f3150-9d59-429a-882a-c556e5d3890a	CONFIGURE_TOTP	Configure OTP	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	CONFIGURE_TOTP	10
679c0fb1-2549-44d9-b848-b089f585d99f	UPDATE_PASSWORD	Update Password	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	UPDATE_PASSWORD	30
3b15fc4e-c430-4944-8eb6-5a6f0bcb9c16	TERMS_AND_CONDITIONS	Terms and Conditions	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	f	TERMS_AND_CONDITIONS	20
0d8cd08c-fe60-4bac-9f3b-289d8d513e8c	delete_account	Delete Account	f63a6b35-ce9c-442a-bf20-081b5ada87c0	f	f	delete_account	60
26250822-b0a8-4ec3-a22c-37ac37f39b1f	delete_credential	Delete Credential	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	delete_credential	100
ffa4b4b0-c49a-4ab8-a080-d0c3d1487190	update_user_locale	Update User Locale	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	update_user_locale	1000
c0f48622-1631-49c0-96a4-67f44fe5e30a	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	120
0f757302-7abf-4b46-8898-f2ee39dbbfb3	webauthn-register	Webauthn Register	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	webauthn-register	70
69e4f115-eb04-4516-b998-d61c9a69f67b	webauthn-register-passwordless	Webauthn Register Passwordless	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	webauthn-register-passwordless	80
de1d62ed-fa4e-4114-91da-40904fff7b7c	VERIFY_PROFILE	Verify Profile	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	VERIFY_PROFILE	90
5839d1b8-be7a-49ee-a1f0-cec85156a3cb	idp_link	Linking Identity Provider	f63a6b35-ce9c-442a-bf20-081b5ada87c0	t	f	idp_link	110
6c782067-1893-43ba-b782-701c45f08934	CONFIGURE_TOTP	Configure OTP	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	CONFIGURE_TOTP	10
78c81aea-43e8-4d2b-8355-ed683536665c	TERMS_AND_CONDITIONS	Terms and Conditions	52cc0a6b-3160-4f03-bd34-7be149371f52	f	f	TERMS_AND_CONDITIONS	20
0b75d1c7-60f6-49d6-bb66-74cce2e34761	UPDATE_PASSWORD	Update Password	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	UPDATE_PASSWORD	30
2b7a99aa-1af7-4b2d-adde-53004e9effa9	UPDATE_PROFILE	Update Profile	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	UPDATE_PROFILE	40
cfa8b350-c14a-4ba4-83b0-d2631047cde7	VERIFY_EMAIL	Verify Email	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	VERIFY_EMAIL	50
47f8d1aa-7b04-4f6c-b35c-405346f3354a	delete_account	Delete Account	52cc0a6b-3160-4f03-bd34-7be149371f52	f	f	delete_account	60
285f2a44-44d9-46c0-be0d-f1a56e080c7e	webauthn-register	Webauthn Register	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	webauthn-register	70
d5a67bd3-27d6-4ff1-b1bf-721968ab532e	webauthn-register-passwordless	Webauthn Register Passwordless	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	webauthn-register-passwordless	80
62fad63f-5cd8-498a-8738-376f9cc78c82	VERIFY_PROFILE	Verify Profile	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	VERIFY_PROFILE	90
22a0fd3d-3352-4db7-bd39-3438e3003e4f	delete_credential	Delete Credential	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	delete_credential	100
7039c3ab-097f-4a66-bb11-d7c14639bc64	idp_link	Linking Identity Provider	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	idp_link	110
37f6b94c-12c3-4ab5-bd3a-06d78504c76c	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	120
897ed661-5bc5-4398-9b8a-c62d0bcbb5cf	update_user_locale	Update User Locale	52cc0a6b-3160-4f03-bd34-7be149371f52	t	f	update_user_locale	1000
\.


--
-- TOC entry 4287 (class 0 OID 17850)
-- Dependencies: 294
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4267 (class 0 OID 17434)
-- Dependencies: 274
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4266 (class 0 OID 17419)
-- Dependencies: 273
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4261 (class 0 OID 17357)
-- Dependencies: 268
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 4286 (class 0 OID 17826)
-- Dependencies: 293
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4264 (class 0 OID 17393)
-- Dependencies: 271
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4262 (class 0 OID 17365)
-- Dependencies: 269
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4263 (class 0 OID 17379)
-- Dependencies: 270
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4288 (class 0 OID 17868)
-- Dependencies: 295
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4293 (class 0 OID 18001)
-- Dependencies: 300
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- TOC entry 4289 (class 0 OID 17878)
-- Dependencies: 296
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4221 (class 0 OID 16491)
-- Dependencies: 228
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	4343dc85-03cb-4e5c-b9cb-762165aee7c3
5c72fd1b-487c-4ba4-8062-9e0d8f1a7cfc	bf2138ae-cb83-471a-b2ab-58eaf6166810
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	1da362cf-eb25-4f60-8437-f3b1cfa7ab90
6f0318a1-5e9d-47ac-a8a8-363d1bfafa07	7e5a4204-d10c-4f0d-83ee-e3ff3ce98743
\.


--
-- TOC entry 4268 (class 0 OID 17449)
-- Dependencies: 275
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4295 (class 0 OID 18017)
-- Dependencies: 302
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
\.


--
-- TOC entry 4222 (class 0 OID 16497)
-- Dependencies: 229
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	3e7468da-8567-4ace-9c97-47a381ed9f6b	c1bbd9a9-f465-4997-98d7-6d5973d7d67a	\N	\N	\N
\.


--
-- TOC entry 4241 (class 0 OID 16934)
-- Dependencies: 248
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4284 (class 0 OID 17801)
-- Dependencies: 291
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4223 (class 0 OID 16502)
-- Dependencies: 230
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
3e7468da-8567-4ace-9c97-47a381ed9f6b	\N	9bbda8a8-bf6b-4031-a4e0-189b5e0e6d2f	f	t	\N	\N	\N	f63a6b35-ce9c-442a-bf20-081b5ada87c0	admin	1755847123564	\N	0
55a89212-970f-4a11-b9e9-1d34c6daffc5	test@example.com	test@example.com	t	t	\N	testuser	testuser	52cc0a6b-3160-4f03-bd34-7be149371f52	testuser	1755848568621	\N	0
57fb2b2f-1daf-4201-bc9a-acd7578e1a9e	\N	a62608ac-f0f3-400f-a2e2-751814db6536	f	t	\N	\N	\N	52cc0a6b-3160-4f03-bd34-7be149371f52	service-account-fitcontrol-admin-client	1755867508306	de942f08-1fe1-42f7-a73d-8586a3e7f12f	0
\.


--
-- TOC entry 4224 (class 0 OID 16510)
-- Dependencies: 231
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4247 (class 0 OID 17046)
-- Dependencies: 254
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4248 (class 0 OID 17051)
-- Dependencies: 255
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 16515)
-- Dependencies: 232
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4256 (class 0 OID 17214)
-- Dependencies: 263
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- TOC entry 4226 (class 0 OID 16520)
-- Dependencies: 233
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 4227 (class 0 OID 16523)
-- Dependencies: 234
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
2b9e655b-fbb4-4ddb-8066-005238e7b023	3e7468da-8567-4ace-9c97-47a381ed9f6b
102fc681-f49b-4005-803b-1c4beeb3c0f0	3e7468da-8567-4ace-9c97-47a381ed9f6b
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	55a89212-970f-4a11-b9e9-1d34c6daffc5
cbe5c4bc-5047-4e70-ab02-ce3ea6d3e736	55a89212-970f-4a11-b9e9-1d34c6daffc5
76413cbc-53b2-4d51-8774-b22bf6ae3bc7	55a89212-970f-4a11-b9e9-1d34c6daffc5
08e7ba79-4187-4c2b-a465-9d1b4927782c	55a89212-970f-4a11-b9e9-1d34c6daffc5
4e65e7dc-9501-46b7-ae64-e69c1995884c	55a89212-970f-4a11-b9e9-1d34c6daffc5
dd88abc0-28e7-430f-8628-6abb0262e6c8	55a89212-970f-4a11-b9e9-1d34c6daffc5
ddabfa8b-6ddd-4237-8142-1cde44afd9ba	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
39791e72-2e1d-4baf-bb61-d1ec254cbac7	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
954041c5-3708-40b3-8482-8e0413e78398	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
c11838aa-258b-4d7c-bb03-5db344a42dbe	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
83291856-53b3-4ab2-a8d2-c46bd2a4217b	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
f67f2b0d-1586-4248-addf-71f658bc3c26	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
669cd91b-bfa1-4d4e-a1dd-c943fd24aff6	57fb2b2f-1daf-4201-bc9a-acd7578e1a9e
\.


--
-- TOC entry 4228 (class 0 OID 16537)
-- Dependencies: 235
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
3429101c-5b88-40e4-995c-b603e5ff503b	+
bd7aec72-c51e-41fc-afe5-3a95bb122794	http://host.docker.internal:8083/fitcontrol/tracker/
468a8d58-a07a-4288-b293-8e740a5c7922	http://localhost:4200
1c573beb-cddf-487d-827c-572abdcda65a	+
de942f08-1fe1-42f7-a73d-8586a3e7f12f	/*
\.


--
-- TOC entry 3989 (class 2606 OID 17990)
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- TOC entry 3981 (class 2606 OID 17979)
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 18024)
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- TOC entry 3711 (class 2606 OID 17902)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3950 (class 2606 OID 17732)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3952 (class 2606 OID 17931)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3947 (class 2606 OID 17607)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 17255)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3910 (class 2606 OID 17530)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3938 (class 2606 OID 17550)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3941 (class 2606 OID 17548)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3930 (class 2606 OID 17546)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3912 (class 2606 OID 17532)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3917 (class 2606 OID 17534)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3922 (class 2606 OID 17540)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3926 (class 2606 OID 17542)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3934 (class 2606 OID 17544)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3945 (class 2606 OID 17587)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3864 (class 2606 OID 17691)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3793 (class 2606 OID 17708)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3725 (class 2606 OID 17710)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3790 (class 2606 OID 17712)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3781 (class 2606 OID 16841)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3766 (class 2606 OID 16775)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3708 (class 2606 OID 16549)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 16843)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3717 (class 2606 OID 16551)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 16557)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3696 (class 2606 OID 16561)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 16565)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3769 (class 2606 OID 16779)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3722 (class 2606 OID 16567)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3728 (class 2606 OID 16569)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3713 (class 2606 OID 16571)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3815 (class 2606 OID 17695)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3828 (class 2606 OID 17072)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3824 (class 2606 OID 17070)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 17068)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 17066)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 16573)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3701 (class 2606 OID 17689)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3788 (class 2606 OID 16845)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3896 (class 2606 OID 17413)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3730 (class 2606 OID 16575)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3705 (class 2606 OID 16577)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 16579)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3966 (class 2606 OID 17830)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3881 (class 2606 OID 17371)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3891 (class 2606 OID 17399)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3907 (class 2606 OID 17468)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3901 (class 2606 OID 17438)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3886 (class 2606 OID 17385)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3898 (class 2606 OID 17423)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3904 (class 2606 OID 17453)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3744 (class 2606 OID 16581)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3834 (class 2606 OID 17080)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3830 (class 2606 OID 17078)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3964 (class 2606 OID 17815)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3960 (class 2606 OID 17805)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3808 (class 2606 OID 16953)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3848 (class 2606 OID 17222)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 17229)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 17243)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3803 (class 2606 OID 16949)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 17129)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3995 (class 2606 OID 18016)
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- TOC entry 3796 (class 2606 OID 16947)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 17908)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3841 (class 2606 OID 17199)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3771 (class 2606 OID 16839)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 17122)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3732 (class 2606 OID 17714)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3839 (class 2606 OID 17162)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3836 (class 2606 OID 17160)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3757 (class 2606 OID 17074)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3974 (class 2606 OID 17877)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3976 (class 2606 OID 17884)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3992 (class 2606 OID 18005)
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- TOC entry 3738 (class 2606 OID 17158)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3859 (class 2606 OID 17236)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3763 (class 2606 OID 17716)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3694 (class 2606 OID 16393)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3873 (class 2606 OID 17339)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3868 (class 2606 OID 17298)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3879 (class 2606 OID 17669)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3877 (class 2606 OID 17327)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3958 (class 2606 OID 17790)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3979 (class 2606 OID 17925)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3972 (class 2606 OID 17857)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 17599)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3786 (class 2606 OID 16896)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3699 (class 2606 OID 16585)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3870 (class 2606 OID 17743)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3748 (class 2606 OID 16589)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3811 (class 2606 OID 17994)
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3884 (class 2606 OID 17916)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3970 (class 2606 OID 17912)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3894 (class 2606 OID 17660)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3889 (class 2606 OID 17664)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3813 (class 2606 OID 17992)
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- TOC entry 3799 (class 2606 OID 18029)
-- Name: migration_model uk_migration_update_time; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_update_time UNIQUE (update_time);


--
-- TOC entry 3801 (class 2606 OID 18027)
-- Name: migration_model uk_migration_version; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_version UNIQUE (version);


--
-- TOC entry 3983 (class 2606 OID 17998)
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- TOC entry 3985 (class 2606 OID 17983)
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- TOC entry 3987 (class 2606 OID 17981)
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- TOC entry 3720 (class 2606 OID 16597)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3750 (class 2606 OID 17589)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3913 (class 1259 OID 17965)
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3914 (class 1259 OID 17967)
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3816 (class 1259 OID 17941)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3908 (class 1259 OID 17613)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3819 (class 1259 OID 17617)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3825 (class 1259 OID 17615)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3826 (class 1259 OID 17614)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3822 (class 1259 OID 17616)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3953 (class 1259 OID 17932)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3767 (class 1259 OID 17968)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- TOC entry 3697 (class 1259 OID 17917)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3948 (class 1259 OID 17657)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3871 (class 1259 OID 17820)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3954 (class 1259 OID 17929)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3772 (class 1259 OID 17817)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3874 (class 1259 OID 17818)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3939 (class 1259 OID 17623)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3942 (class 1259 OID 17891)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3943 (class 1259 OID 17622)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3702 (class 1259 OID 17624)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3703 (class 1259 OID 17625)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3955 (class 1259 OID 17823)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3956 (class 1259 OID 17824)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3709 (class 1259 OID 17918)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3778 (class 1259 OID 17356)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3779 (class 1259 OID 17355)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3915 (class 1259 OID 17717)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3918 (class 1259 OID 17737)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3919 (class 1259 OID 17900)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3920 (class 1259 OID 17719)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3923 (class 1259 OID 17720)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3924 (class 1259 OID 17721)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3927 (class 1259 OID 17722)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3928 (class 1259 OID 17723)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3931 (class 1259 OID 17724)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3932 (class 1259 OID 17725)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3935 (class 1259 OID 17726)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3936 (class 1259 OID 17727)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3856 (class 1259 OID 17943)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3857 (class 1259 OID 17628)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3853 (class 1259 OID 17629)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3804 (class 1259 OID 17631)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3782 (class 1259 OID 17630)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3783 (class 1259 OID 18009)
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- TOC entry 3784 (class 1259 OID 18008)
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- TOC entry 3714 (class 1259 OID 17632)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3715 (class 1259 OID 17633)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3842 (class 1259 OID 17972)
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- TOC entry 3843 (class 1259 OID 17971)
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- TOC entry 3844 (class 1259 OID 17936)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3990 (class 1259 OID 18000)
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- TOC entry 3967 (class 1259 OID 17996)
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- TOC entry 3968 (class 1259 OID 17995)
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- TOC entry 3773 (class 1259 OID 17634)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3723 (class 1259 OID 17637)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3866 (class 1259 OID 17816)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3865 (class 1259 OID 17638)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3726 (class 1259 OID 17641)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3794 (class 1259 OID 17640)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3718 (class 1259 OID 17636)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3791 (class 1259 OID 17642)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3733 (class 1259 OID 17643)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3837 (class 1259 OID 17644)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3902 (class 1259 OID 17645)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3899 (class 1259 OID 17646)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3892 (class 1259 OID 17665)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3882 (class 1259 OID 17666)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3887 (class 1259 OID 17667)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3993 (class 1259 OID 18006)
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- TOC entry 3977 (class 1259 OID 17890)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3875 (class 1259 OID 17819)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3736 (class 1259 OID 17650)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3905 (class 1259 OID 17651)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3797 (class 1259 OID 17898)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3961 (class 1259 OID 17825)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3962 (class 1259 OID 17942)
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- TOC entry 3739 (class 1259 OID 17352)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3740 (class 1259 OID 17939)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3809 (class 1259 OID 17349)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3706 (class 1259 OID 17353)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3745 (class 1259 OID 17346)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3860 (class 1259 OID 17348)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3758 (class 1259 OID 17354)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3761 (class 1259 OID 17347)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3746 (class 1259 OID 17940)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3831 (class 1259 OID 17653)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3832 (class 1259 OID 17654)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3755 (class 1259 OID 17655)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3764 (class 1259 OID 17656)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3741 (class 1259 OID 17964)
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3742 (class 1259 OID 17966)
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 4020 (class 2606 OID 16850)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4014 (class 2606 OID 16780)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4019 (class 2606 OID 16860)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4015 (class 2606 OID 17007)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4006 (class 2606 OID 16605)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4010 (class 2606 OID 16610)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4004 (class 2606 OID 16620)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4062 (class 2606 OID 17858)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4008 (class 2606 OID 16625)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4011 (class 2606 OID 16635)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4001 (class 2606 OID 16640)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 4005 (class 2606 OID 16645)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4002 (class 2606 OID 16660)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3998 (class 2606 OID 16665)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4029 (class 2606 OID 17101)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 4030 (class 2606 OID 17096)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4028 (class 2606 OID 17091)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4027 (class 2606 OID 17086)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4012 (class 2606 OID 16675)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4039 (class 2606 OID 17764)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4040 (class 2606 OID 17754)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4016 (class 2606 OID 17749)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4055 (class 2606 OID 17608)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4053 (class 2606 OID 17556)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 4054 (class 2606 OID 17551)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4038 (class 2606 OID 17256)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4033 (class 2606 OID 17116)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 4031 (class 2606 OID 17111)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4032 (class 2606 OID 17106)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4051 (class 2606 OID 17474)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4049 (class 2606 OID 17459)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4058 (class 2606 OID 17831)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4041 (class 2606 OID 17675)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4059 (class 2606 OID 17836)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4060 (class 2606 OID 17841)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4052 (class 2606 OID 17469)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4050 (class 2606 OID 17454)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4061 (class 2606 OID 17863)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4043 (class 2606 OID 17670)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4045 (class 2606 OID 17424)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4047 (class 2606 OID 17439)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4048 (class 2606 OID 17444)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4046 (class 2606 OID 17429)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4042 (class 2606 OID 17680)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3999 (class 2606 OID 16690)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4057 (class 2606 OID 17806)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 4026 (class 2606 OID 16970)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4036 (class 2606 OID 17230)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4035 (class 2606 OID 17244)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4023 (class 2606 OID 16916)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4003 (class 2606 OID 16700)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4024 (class 2606 OID 16960)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4025 (class 2606 OID 17130)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 4013 (class 2606 OID 16710)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4007 (class 2606 OID 16720)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4017 (class 2606 OID 16855)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4000 (class 2606 OID 16735)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4018 (class 2606 OID 17123)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 4056 (class 2606 OID 17791)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4034 (class 2606 OID 17165)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4063 (class 2606 OID 17871)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4064 (class 2606 OID 17885)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4022 (class 2606 OID 16885)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4009 (class 2606 OID 16755)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4037 (class 2606 OID 17237)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4044 (class 2606 OID 17414)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4021 (class 2606 OID 16865)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2025-09-17 16:22:56

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-17 16:22:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-09-17 16:22:57

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-09-17 16:22:57

--
-- PostgreSQL database cluster dump complete
--

