Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4092121142D
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 22:17:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-UUcfKoyhMeq6Aq2fLaR6lA-1; Wed, 01 Jul 2020 16:17:14 -0400
X-MC-Unique: UUcfKoyhMeq6Aq2fLaR6lA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 313FC107ACF6;
	Wed,  1 Jul 2020 20:16:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 609D110013C1;
	Wed,  1 Jul 2020 20:16:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A9921809543;
	Wed,  1 Jul 2020 20:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061KG2Sg015674 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 16:16:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2646EE5B00; Wed,  1 Jul 2020 20:16:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20EEDF569F
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:15:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4E538007C8
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:15:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-144-oDZk6-u8PCGfcVL6TtP08Q-1;
	Wed, 01 Jul 2020 16:15:53 -0400
X-MC-Unique: oDZk6-u8PCGfcVL6TtP08Q-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-25-KFu2L9P2ObCzHNay75ZOdA-1; Wed, 01 Jul 2020 22:15:50 +0200
X-MC-Unique: KFu2L9P2ObCzHNay75ZOdA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4074.eurprd04.prod.outlook.com (2603:10a6:5:25::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Wed, 1 Jul 2020 20:15:49 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.028;
	Wed, 1 Jul 2020 20:15:49 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 1/7] libmultipath: make dm_get_map/status return codes
	symbolic
Thread-Index: AQHWSzEopQJ41T+xS0yhRFRlGWtmlKjzMm2A
Date: Wed, 1 Jul 2020 20:15:49 +0000
Message-ID: <b81e6932dd0c20b0b6053c08c3e27118fb338235.camel@suse.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e519a0e-f04c-4541-dd1a-08d81dfb8c18
x-ms-traffictypediagnostic: DB7PR04MB4074:
x-microsoft-antispam-prvs: <DB7PR04MB407458BD0078B09679995717FC6C0@DB7PR04MB4074.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SG1korKGQxyfBP84mmJ2LukhJjiMWhTd8Km/heUnZGuBJMqj/iz6T3fnSAnZ4T1GCEyW0JTCLHd901SLLcI9zwaIHFUAU70I6TaDW3r3EP8ZSD4JpUa8J+KnVj+bo8IAeXY4z7buNNP7Q0qgqKmgzRAr6i86wiqdoLYrVTzB47eGIxxySlgkcv9PWZ9EtjXPcUzIr6u69Z6TiunwSyaCIkInbB6KkybR95JsVZUkr23A2gJjYRO+JLNkyZWz9uPX4kiMfwSyWX8BFTYcmTGbLyLPKrbqCbZsfK3iPe5B/z3/pMOspsv07XXYJon+kxKqEh6pwYFL31yzoi66/zRu6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(376002)(346002)(366004)(39860400002)(396003)(66556008)(66476007)(6512007)(316002)(2616005)(186003)(5660300002)(26005)(66574015)(6506007)(110136005)(83380400001)(64756008)(71200400001)(76116006)(66946007)(91956017)(66446008)(6486002)(8936002)(4326008)(478600001)(2906002)(36756003)(86362001)(8676002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: Wt/dsi+gHdG+QiPEnRmhkSXAGgbQCTFv3KMxoQbX9iLbR+tu/Vs4BZWntxdNxNAqIEndvtX8dRT6q/dtI5KF/UuwcNIzGchKhjGee8vXw+gtuRzC+DARh9HMDgv9V8JRGl1Q0/yG027AlF04FXK6dsp1bnBJKMuAal9EbSoLYoDbeZvqSztUOHb/NnGwX2xsa/NqCm0V1HioGsLnH4LWqWWNT8d0b3X9Pk7I7jZlJSGfdX/6hJCxTM3QILLIWI5G36S9dVa4iED6LD4PTbH1PR/nfgBcBgVm2QW7jmPQFx05wK/5La6TT0F2i/0wD/YDBQ5/6vX0lkRZYY7GS1TSv69PKvnjZmn17FC/ihEYCv3A+3zvK9bl6CcTzAmmtY5qrcLmqLqRJhd16dCBc1XRoL4X0jIwtRy2ViU+fiY/PPewWNrLt/eZMAslzHHser4PhCWVRjk+UEeiVj2rOJwp0og2BgqTiTmC5sN90xjA3fI=
x-ms-exchange-transport-forked: True
Content-ID: <0ACD0B6F56D61A4F9AB63DAB00787AAC@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e519a0e-f04c-4541-dd1a-08d81dfb8c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 20:15:49.5622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqUMLXpAJKX0+I9factfsZcKII0Fu49pFzszVaSG6Ej5S5A5xkd4s16eKkNBtkKY0MTODXuKL3+2Al1bJEIq2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4074
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061KG2Sg015674
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 1/7] libmultipath: make dm_get_map/status
 return codes symbolic
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> dm_get_map() and dm_get_status() now use symbolic return codes. They
> also differentiate between failing to get information from device-
> mapper
> and not finding the requested device. These symboilc return codes are
> also used by update_multipath_* functions.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c   | 51 +++++++++++++++++++++++++-----------
> --
>  libmultipath/devmapper.h   |  6 +++++
>  libmultipath/structs_vec.c | 45 +++++++++++++++++++--------------
>  multipathd/main.c          | 12 ++++-----
>  4 files changed, 72 insertions(+), 42 deletions(-)
>=20
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 27d52398..f5cfe296 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -534,36 +534,43 @@ int dm_map_present(const char * str)
> =20
>  int dm_get_map(const char *name, unsigned long long *size, char
> *outparams)
>  {
> -=09int r =3D 1;
> +=09int r =3D DMP_ERR;
>  =09struct dm_task *dmt;
>  =09uint64_t start, length;
>  =09char *target_type =3D NULL;
>  =09char *params =3D NULL;
> =20
>  =09if (!(dmt =3D libmp_dm_task_create(DM_DEVICE_TABLE)))
> -=09=09return 1;
> +=09=09return r;
> =20
>  =09if (!dm_task_set_name(dmt, name))
>  =09=09goto out;
> =20
>  =09dm_task_no_open_count(dmt);
> =20
> -=09if (!dm_task_run(dmt))
> +=09errno =3D 0;
> +=09if (!dm_task_run(dmt)) {
> +=09=09if (errno =3D=3D ENXIO)

Don't you have to use dm_task_get_errno(dmt) here?
errno might have been overwritten... if you are certain you don't need
it, a comment explaining it would be helpful.


> +=09=09=09r =3D DMP_FAIL;

You've created generic names, which is good, but these are perhaps a
bit too generic. What's the difference bewteen DMP_FAIL and DMP_ERR? I
can derive it from your code, but it's not obvious from the retcode
names, and thus doesn't help the reader much. I suggest to keep DMT_ERR
to denote a "generic" error condition, and use e.g. DMP_NOTFOUND for
the other case.

>  =09=09goto out;
> +=09}
> =20
> +=09r =3D DMP_FAIL;
>  =09/* Fetch 1st target */
> -=09dm_get_next_target(dmt, NULL, &start, &length,
> -=09=09=09   &target_type, &params);
> +=09if (dm_get_next_target(dmt, NULL, &start, &length,
> +=09=09=09       &target_type, &params) !=3D NULL)
> +=09=09/* more than one target */
> +=09=09goto out;
> =20
>  =09if (size)
>  =09=09*size =3D length;
> =20
>  =09if (!outparams) {
> -=09=09r =3D 0;
> +=09=09r =3D DMP_PASS;

Nit: DMP_OK or DMP_SUCCESS would be more conventional for successful
completion. "pass" sounds like something more specific to me,
like having passed a test or a filter.

>  =09=09goto out;
>  =09}
>  =09if (snprintf(outparams, PARAMS_SIZE, "%s", params) <=3D
> PARAMS_SIZE)
> -=09=09r =3D 0;
> +=09=09r =3D DMP_PASS;
>  out:
>  =09dm_task_destroy(dmt);
>  =09return r;
> @@ -637,35 +644,45 @@ is_mpath_part(const char *part_name, const char
> *map_name)
> =20
>  int dm_get_status(const char *name, char *outstatus)
>  {
> -=09int r =3D 1;
> +=09int r =3D DMP_ERR;
>  =09struct dm_task *dmt;
>  =09uint64_t start, length;
>  =09char *target_type =3D NULL;
>  =09char *status =3D NULL;
> =20
>  =09if (!(dmt =3D libmp_dm_task_create(DM_DEVICE_STATUS)))
> -=09=09return 1;
> +=09=09return r;
> =20
>  =09if (!dm_task_set_name(dmt, name))
>  =09=09goto out;
> =20
>  =09dm_task_no_open_count(dmt);
> =20
> -=09if (!dm_task_run(dmt))
> +=09errno =3D 0;
> +=09if (!dm_task_run(dmt)) {
> +=09=09if (errno =3D=3D ENXIO)
> +=09=09=09r =3D DMP_FAIL;
>  =09=09goto out;
> +=09}

see above

> =20
> +=09r =3D DMP_FAIL;
>  =09/* Fetch 1st target */
> -=09dm_get_next_target(dmt, NULL, &start, &length,
> -=09=09=09   &target_type, &status);
> +=09if (dm_get_next_target(dmt, NULL, &start, &length,
> +=09=09=09       &target_type, &status) !=3D NULL)
> +=09=09goto out;
> +
> +=09if (!target_type || strcmp(target_type, TGT_MPATH) !=3D 0)
> +=09=09goto out;
> +
>  =09if (!status) {
>  =09=09condlog(2, "get null status.");
>  =09=09goto out;
>  =09}
> =20
>  =09if (snprintf(outstatus, PARAMS_SIZE, "%s", status) <=3D
> PARAMS_SIZE)
> -=09=09r =3D 0;
> +=09=09r =3D DMP_PASS;
>  out:
> -=09if (r)
> +=09if (r !=3D DMP_PASS)
>  =09=09condlog(0, "%s: error getting map status string",
> name);
> =20
>  =09dm_task_destroy(dmt);
> @@ -920,7 +937,7 @@ int _dm_flush_map (const char * mapname, int
> need_sync, int deferred_remove,
>  =09=09=09return 1;
> =20
>  =09if (need_suspend &&
> -=09    !dm_get_map(mapname, &mapsize, params) &&
> +=09    dm_get_map(mapname, &mapsize, params) =3D=3D DMP_PASS &&
>  =09    strstr(params, "queue_if_no_path")) {
>  =09=09if (!dm_queue_if_no_path(mapname, 0))
>  =09=09=09queue_if_no_path =3D 1;
> @@ -1129,7 +1146,7 @@ struct multipath *dm_get_multipath(const char
> *name)
>  =09if (!mpp->alias)
>  =09=09goto out;
> =20
> -=09if (dm_get_map(name, &mpp->size, NULL))
> +=09if (dm_get_map(name, &mpp->size, NULL) !=3D DMP_PASS)
>  =09=09goto out;
> =20
>  =09dm_get_uuid(name, mpp->wwid, WWID_SIZE);
> @@ -1313,7 +1330,7 @@ do_foreach_partmaps (const char * mapname,
>  =09=09    /*
>  =09=09     * and we can fetch the map table from the kernel
>  =09=09     */
> -=09=09    !dm_get_map(names->name, &size, &params[0]) &&
> +=09=09    dm_get_map(names->name, &size, &params[0]) =3D=3D
> DMP_PASS &&
> =20
>  =09=09    /*
>  =09=09     * and the table maps over the multipath map
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index 5ed7edc5..5b18bf4b 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -27,6 +27,12 @@
>  #define UUID_PREFIX "mpath-"
>  #define UUID_PREFIX_LEN (sizeof(UUID_PREFIX) - 1)
> =20
> +enum {
> +=09DMP_ERR =3D -1,
> +=09DMP_PASS,
> +=09DMP_FAIL,
> +};
> +

Nit: Why use both negative and positive numbers? It's not important,
but I feel that unless we really want to treat DM_ERR in a very special
way, it would be better to use only positive values. (Actually, if we
go for some generalized retcode convention some day, we might save
negative return values for standard libc errno values such
as -ENOENT and use positive values for or own specific ones).

(We can change the numeric values later of course).

Cheers,
Martin

>  void dm_init(int verbosity);
>  int dm_prereq(unsigned int *v);
>  void skip_libmp_dm_init(void);
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 077f2e42..2225abeb 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -196,43 +196,47 @@ extract_hwe_from_path(struct multipath * mpp)
>  int
>  update_multipath_table (struct multipath *mpp, vector pathvec, int
> is_daemon)
>  {
> +=09int r =3D DMP_ERR;
>  =09char params[PARAMS_SIZE] =3D {0};
> =20
>  =09if (!mpp)
> -=09=09return 1;
> +=09=09return r;
> =20
> -=09if (dm_get_map(mpp->alias, &mpp->size, params)) {
> -=09=09condlog(3, "%s: cannot get map", mpp->alias);
> -=09=09return 1;
> +=09r =3D dm_get_map(mpp->alias, &mpp->size, params);
> +=09if (r !=3D DMP_PASS) {
> +=09=09condlog(3, "%s: %s", mpp->alias, (r =3D=3D DMP_ERR)? "error
> getting table" : "map not present");
> +=09=09return r;
>  =09}
> =20
>  =09if (disassemble_map(pathvec, params, mpp, is_daemon)) {
>  =09=09condlog(3, "%s: cannot disassemble map", mpp->alias);
> -=09=09return 1;
> +=09=09return DMP_ERR;
>  =09}
> =20
> -=09return 0;
> +=09return DMP_PASS;
>  }
> =20
>  int
>  update_multipath_status (struct multipath *mpp)
>  {
> +=09int r =3D DMP_ERR;
>  =09char status[PARAMS_SIZE] =3D {0};
> =20
>  =09if (!mpp)
> -=09=09return 1;
> +=09=09return r;
> =20
> -=09if (dm_get_status(mpp->alias, status)) {
> -=09=09condlog(3, "%s: cannot get status", mpp->alias);
> -=09=09return 1;
> +=09r =3D dm_get_status(mpp->alias, status);
> +=09if (r !=3D DMP_PASS) {
> +=09=09condlog(3, "%s: %s", mpp->alias, (r =3D=3D DMP_ERR)? "error
> getting status" : "map not present");
> +=09=09return r;
>  =09}
> =20
>  =09if (disassemble_status(status, mpp)) {
>  =09=09condlog(3, "%s: cannot disassemble status", mpp-
> >alias);
> -=09=09return 1;
> +=09=09return DMP_ERR;
>  =09}
> =20
> -=09return 0;
> +=09return DMP_PASS;
>  }
> =20
>  void sync_paths(struct multipath *mpp, vector pathvec)
> @@ -264,10 +268,10 @@ int
>  update_multipath_strings(struct multipath *mpp, vector pathvec, int
> is_daemon)
>  {
>  =09struct pathgroup *pgp;
> -=09int i;
> +=09int i, r =3D DMP_ERR;
> =20
>  =09if (!mpp)
> -=09=09return 1;
> +=09=09return r;
> =20
>  =09update_mpp_paths(mpp, pathvec);
>  =09condlog(4, "%s: %s", mpp->alias, __FUNCTION__);
> @@ -276,18 +280,21 @@ update_multipath_strings(struct multipath *mpp,
> vector pathvec, int is_daemon)
>  =09free_pgvec(mpp->pg, KEEP_PATHS);
>  =09mpp->pg =3D NULL;
> =20
> -=09if (update_multipath_table(mpp, pathvec, is_daemon))
> -=09=09return 1;
> +=09r =3D update_multipath_table(mpp, pathvec, is_daemon);
> +=09if (r !=3D DMP_PASS)
> +=09=09return r;
> +
>  =09sync_paths(mpp, pathvec);
> =20
> -=09if (update_multipath_status(mpp))
> -=09=09return 1;
> +=09r =3D update_multipath_status(mpp);
> +=09if (r !=3D DMP_PASS)
> +=09=09return r;
> =20
>  =09vector_foreach_slot(mpp->pg, pgp, i)
>  =09=09if (pgp->paths)
>  =09=09=09path_group_prio_update(pgp);
> =20
> -=09return 0;
> +=09return DMP_PASS;
>  }
> =20
>  static void enter_recovery_mode(struct multipath *mpp)
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 205ddb32..d73b1b9a 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -418,7 +418,7 @@ int __setup_multipath(struct vectors *vecs,
> struct multipath *mpp,
>  =09=09goto out;
>  =09}
> =20
> -=09if (update_multipath_strings(mpp, vecs->pathvec, 1)) {
> +=09if (update_multipath_strings(mpp, vecs->pathvec, 1) !=3D
> DMP_PASS) {
>  =09=09condlog(0, "%s: failed to setup multipath", mpp-
> >alias);
>  =09=09goto out;
>  =09}
> @@ -557,9 +557,9 @@ add_map_without_path (struct vectors *vecs, const
> char *alias)
>  =09mpp->mpe =3D find_mpe(conf->mptable, mpp->wwid);
>  =09put_multipath_config(conf);
> =20
> -=09if (update_multipath_table(mpp, vecs->pathvec, 1))
> +=09if (update_multipath_table(mpp, vecs->pathvec, 1) !=3D DMP_PASS)
>  =09=09goto out;
> -=09if (update_multipath_status(mpp))
> +=09if (update_multipath_status(mpp) !=3D DMP_PASS)
>  =09=09goto out;
> =20
>  =09if (!vector_alloc_slot(vecs->mpvec))
> @@ -1350,8 +1350,8 @@ map_discovery (struct vectors * vecs)
>  =09=09return 1;
> =20
>  =09vector_foreach_slot (vecs->mpvec, mpp, i)
> -=09=09if (update_multipath_table(mpp, vecs->pathvec, 1) ||
> -=09=09    update_multipath_status(mpp)) {
> +=09=09if (update_multipath_table(mpp, vecs->pathvec, 1) !=3D
> DMP_PASS ||
> +=09=09    update_multipath_status(mpp) !=3D DMP_PASS) {
>  =09=09=09remove_map(mpp, vecs, 1);
>  =09=09=09i--;
>  =09=09}
> @@ -2091,7 +2091,7 @@ check_path (struct vectors * vecs, struct path
> * pp, unsigned int ticks)
>  =09/*
>  =09 * Synchronize with kernel state
>  =09 */
> -=09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> +=09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1) !=3D
> DMP_PASS) {
>  =09=09condlog(1, "%s: Could not synchronize with kernel
> state",
>  =09=09=09pp->dev);
>  =09=09pp->dmstate =3D PSTATE_UNDEF;

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

