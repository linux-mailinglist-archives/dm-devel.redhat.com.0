Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 729E2155CA9
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 18:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581095580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6iIi6hC2TTBJNC0tC3q1/LpDE9lZtIMrl77eqQFiuxE=;
	b=L/iu/g6Nmx5ZExi8SciZOjg1OjzwxbPlQleMLlyecOg6rscOp6H5u+t8Vmfpa6z5MbMNkc
	6gqaKr60Z/LL4PAYp3EgksosuQF5Lesr59ER3/TlcnGRmLtE246WLciJzv0L2bFBC9idG8
	A1tL7PLom9pYs5578Iw3UfJ49I4OwNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-lMeaS-GCNkW6o8aalmxypQ-1; Fri, 07 Feb 2020 12:12:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C552C8018A8;
	Fri,  7 Feb 2020 17:12:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C078EA1F;
	Fri,  7 Feb 2020 17:12:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4972A18089CD;
	Fri,  7 Feb 2020 17:12:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017HCb4G011389 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 12:12:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 076E42166B2A; Fri,  7 Feb 2020 17:12:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 025BD2166B27
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:12:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84CEB1011A70
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:12:34 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-332-9QRaeurYMOC0Wv-IQdpAVA-1;
	Fri, 07 Feb 2020 12:12:32 -0500
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  7 Feb 2020 17:11:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 7 Feb 2020 17:08:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 7 Feb 2020 17:08:12 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1610.namprd18.prod.outlook.com (10.175.225.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Fri, 7 Feb 2020 17:08:11 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2686.036;
	Fri, 7 Feb 2020 17:08:11 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "ematsumiya@suse.de" <ematsumiya@suse.de>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/1] libmultipath: fix files read from config_dir
Thread-Index: AQHV3cVZXBSJN1N08EOz1HrMjujoxKgP9zcA
Date: Fri, 7 Feb 2020 17:08:11 +0000
Message-ID: <39d70ac4e03d9f75b51ef49c078b11e6ed662e0f.camel@suse.com>
References: <20200207144525.16341-1-ematsumiya@suse.de>
In-Reply-To: <20200207144525.16341-1-ematsumiya@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 808a1011-8392-4d21-d74d-08d7abf04fec
x-ms-traffictypediagnostic: DM5PR18MB1610:
x-microsoft-antispam-prvs: <DM5PR18MB1610EFE7A37024C3EA9770D3FC1C0@DM5PR18MB1610.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(66574012)(76116006)(66946007)(6506007)(71200400001)(186003)(91956017)(6486002)(6512007)(64756008)(2616005)(110136005)(478600001)(66446008)(66556008)(316002)(66476007)(54906003)(4326008)(81156014)(8676002)(81166006)(36756003)(8936002)(26005)(5660300002)(2906002)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1610;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTBOb+63uRPu/GjEUWpkB0kYn6S2QzYVlNfI4BIRh65zzWY78dqrzsqIGpLZDSx0L/HHHDcOHf4/3qhuPr/4qeBk1J29iuVTMJHw9PxpB+uYB8K39I/X002bd8iTfdwDcr5eJY08ctCmpkKO+5viFNJKHnVcUxqV1hW8/1Dk9KjAf/0Vz+e21SOjw+UQ6bk9wrq61KBzyIiCypzZR/AzcwyY/t7QNB2e/nKzXrrOH39pQSYrei1PImhNlOiZX5FUH4+uelNhVXwyGpwcncK9MB7v/5lNfiLn2UkMbbKH92mWYroBIMjDfVv3iwenYyYLJ4b2i0yJXgnQbWRxqq1jg4jfEE/P2fut+mQttEnddYMQegFohbkYIIJq6UMp0AKEUrdLevYnY7QS8PGzRAGGDewRpC4oVGl8HC2ZTkgGfnPEZd8ThApEToZykrv3HrLm
x-ms-exchange-antispam-messagedata: zktbPmdnB9P7sVUHqjk9hhVTemuxtRpYktCebiJnTMl6idm1NkGgLVPiafXFcB4rrp5J9K9p5FL0OTBv1xXmEsPQyQKNPYpntm7FC5tDZpfokmhLq/ZI68xVMSP85aXM7ZX6s49JWuM5VqLJp9VqOQ==
x-ms-exchange-transport-forked: True
Content-ID: <FB025A6B43E5744E887310A6CF45906B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 808a1011-8392-4d21-d74d-08d7abf04fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 17:08:11.6947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zko9zdTjV42qkTdC20qJ8R+VkD8USX673k0kuLuFf4HZSd4IwuIdzSxhixvXJbQFZfmH6P56Ddnpg+gMt5lWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1610
X-OriginatorOrg: suse.com
X-MC-Unique: 9QRaeurYMOC0Wv-IQdpAVA-1
X-MC-Unique: lMeaS-GCNkW6o8aalmxypQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017HCb4G011389
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] libmultipath: fix files read from
	config_dir
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-07 at 11:45 -0300, Enzo Matsumiya wrote:
> If config_dir contains a file named, for example, "some.conf.backup",
> this file
> will still be loaded by multipath because process_config_dir()
> (libmultipath/config.c) uses strstr() to check for the ".conf"
> extension, but
> that doesn't guarantee that ".conf" is at the end of the filename.
>=20
> This patch will make sure that only files ending in ".conf" are
> loaded from
> config_dir.
>=20
> This is to comply with config_dir entry description in man 5
> multipath.conf.
>=20
> Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
> ---
>  libmultipath/config.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 20e3b8bf..4785ade8 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -671,8 +671,11 @@ process_config_dir(struct config *conf, vector
> keywords, char *dir)
>  =09sr.n =3D n;
>  =09pthread_cleanup_push_cast(free_scandir_result, &sr);
>  =09for (i =3D 0; i < n; i++) {
> -=09=09if (!strstr(namelist[i]->d_name, ".conf"))
> +=09=09char *ext =3D strrchr(namelist[i]->d_name, '.');
> +
> +=09=09if (!ext || strcmp(ext, ".conf"))
>  =09=09=09continue;
> +
>  =09=09old_hwtable_size =3D VECTOR_SIZE(conf->hwtable);
>  =09=09snprintf(path, LINE_MAX, "%s/%s", dir, namelist[i]-
> >d_name);
>  =09=09path[LINE_MAX-1] =3D '\0';

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

