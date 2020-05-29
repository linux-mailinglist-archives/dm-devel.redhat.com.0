Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E82351E791C
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 11:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590743672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BQPco5Y967XY/+UBAN0s2KPdeEY+YrpdXm7TqPBkGrA=;
	b=ZT4af/iFeQdp39NbG2m0T5HAFti3VKZO3+mcqBPkAnGkn/L8+CrRViF74saCXEPreJ8wjv
	vXwncakNI+WroarTurWbUKNBU6Qz2fPWKwXaGE2D7fndMZTSkDAZHJM8rTtvsZkiQFzIwc
	tE1LAGG6EGtxGMjtMJRD/KKB+NOBjYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-OUNsQCoWOEqjj1Q9LOGrSg-1; Fri, 29 May 2020 05:14:30 -0400
X-MC-Unique: OUNsQCoWOEqjj1Q9LOGrSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474ED800D24;
	Fri, 29 May 2020 09:14:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E63265D9F3;
	Fri, 29 May 2020 09:14:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BAC81809543;
	Fri, 29 May 2020 09:14:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04T9Dp7F026849 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 05:13:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EAC2F1018; Fri, 29 May 2020 09:13:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CDFF1C85
	for <dm-devel@redhat.com>; Fri, 29 May 2020 09:13:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4ED180CDB4
	for <dm-devel@redhat.com>; Fri, 29 May 2020 09:13:46 +0000 (UTC)
Received: from m4a0073g.houston.softwaregrp.com
	(m4a0073g.houston.softwaregrp.com [15.124.2.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-410-BVPZgUF3OJa7SBjvF_JXuA-1;
	Fri, 29 May 2020 05:13:44 -0400
X-MC-Unique: BVPZgUF3OJa7SBjvF_JXuA-1
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0073g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 29 May 2020 09:11:32 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 29 May 2020 09:12:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 29 May 2020 09:12:32 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1867.namprd18.prod.outlook.com (2603:10b6:4:6c::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17;
	Fri, 29 May 2020 09:12:30 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3045.018;
	Fri, 29 May 2020 09:12:30 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/1] libdmmp: Add support for upcoming json-c 0.14.0.
Thread-Index: AQHWNW8tLlj2iB8F6U6GsOimwkeg/qi+x64A
Date: Fri, 29 May 2020 09:12:30 +0000
Message-ID: <d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
	<1590725443-3519-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1590725443-3519-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cb88260-f364-4518-1cfc-08d803b06a47
x-ms-traffictypediagnostic: DM5PR1801MB1867:
x-microsoft-antispam-prvs: <DM5PR1801MB1867CA7779C99BC3FE11A731FC8F0@DM5PR1801MB1867.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /kkybfgJ2sLvt9UPwboMJz0fs7r9lrlnSo1X9dII5uVjeOh3DXZmU3BKVeoqQSAkvrAqYGfoXqFD5G1EgE0ByRtCluqgjCMicuzMbk1hZkT4I0IYtkl+yRBe+iXwpJjQKqZXcT2vcS+ecPdRT7z9J6Dlf9I5oYSdq07I3D5zRBRUm/klvNCPhsiS/DI5jx7H/F1BpAGRe6mw3vBxLsW/3uwihofaWIGu7aPuK77XfSvNBJv/nMPAfDyJy7ZXyq3YEBDQQf6CahoSZLPxLY0Zs41z309eZgGBKK9KrzeRKTvxY2X9KON1p6S2y7ZtQ9XwHTzqBuBGCknWPCz5WKyr6HAmuSxRjdgk00NU8Y3TKKqnUeVPgUpV/H7y9CuHDmF33KiQk5NiFJ6YyTRwiJB39Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(66556008)(36756003)(66476007)(2616005)(8936002)(66946007)(478600001)(86362001)(316002)(83380400001)(66574014)(966005)(8676002)(26005)(6506007)(4326008)(66446008)(64756008)(2906002)(76116006)(54906003)(186003)(110136005)(6486002)(71200400001)(5660300002)(91956017)(6512007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Q/2xxRZJbnHlrSbpDTO2vB5Uc0AY2qycZrQjGmhZX9wD58zxoxDEcZPcWeHaqGjJzkTW1idnkcj0DLxy5/62O2r1Oaz24AXqr/JWruRy3RPEVGqAv8dwg102gAmBYAwJB/XhBk8LEAJBtuf9IiXBjIv0o1d7zdB1vyGD8LFdyCZTGrBChbIy0ernlOXJC59mZ3TOquhQHCbJkn6DtsirihRl10BRUyJJvhL2V1NVoF5o8/lcC6gAdd8W/ppjh89NzVj92Io6/Tc8HT3D/6vwjFh+rKjFuKyqu7L7fCPnyxLFiDiX7ha/xCFfRTrfUznAFlQipNmdTYMFy4mA7EW8vwsxN9u4f6wx0yGTJzueSjFHuIBYjOYIgm1JHZaoAfEa+Z39B7g0Vj6WfXGuOM6umRZUFNLTS1G7VLXXImS9h2JfStuZHPRbeD3QF3+ZGzx3swnTYDXYX/meTu1SRf/WksvW/sLelEnGSaP3lbsrN+4=
x-ms-exchange-transport-forked: True
Content-ID: <66C45AD9B3036D4F8959ABFFCA36794D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb88260-f364-4518-1cfc-08d803b06a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 09:12:30.3835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10suLUsCWPbajUJcOROT/M9APrKSaTmrWBnLo9LKZMmLmP53RzhElkiIPNa7eOmCGR/cSOmKQOecOOF/zX9LZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1867
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04T9Dp7F026849
X-loop: dm-devel@redhat.com
Cc: "mail@eworm.de" <mail@eworm.de>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"besser82@fedoraproject.org" <besser82@fedoraproject.org>
Subject: Re: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
	0.14.0.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Thu, 2020-05-28 at 23:10 -0500, Benjamin Marzinski wrote:
> From: Bj=F6rn Esser <besser82@fedoraproject.org>
>=20
> TRUE/FALSE are not defined anymore.  1 and 0 are used instead.
> This is backwards compatible, as earlier versions of json-c are
> using the same integer values in their present definitions.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libdmmp/libdmmp_private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
> index ac85b63f..4378962b 100644
> --- a/libdmmp/libdmmp_private.h
> +++ b/libdmmp/libdmmp_private.h
> @@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx,
> const char *var_name) { \
>  do { \
>  =09json_type j_type =3D json_type_null; \
>  =09json_object *j_obj_tmp =3D NULL; \
> -=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D TRUE)
> { \
> +=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D 1) { \
>  =09=09_error(ctx, "Invalid JSON output from multipathd IPC: "
> \
>  =09=09       "key '%s' not found", key); \
>  =09=09rc =3D DMMP_ERR_IPC_ERROR; \

Did you see=20
https://www.redhat.com/archives/dm-devel/2020-May/msg00261.html ?

This has first been reported to the list by Christian (
https://www.redhat.com/archives/dm-devel/2020-April/msg00261.html), and
brought to my attention later by Xose. I personally thought the change
from boolean to int is a step in the wrong direction, therefore I
submitted my modified version using stdboolh. If everyone else is fine
with the int, it's not worth arguing about it.

Regards,
Martin

PS: Can anyone explain why json-c did this? Looks like a "cause hassle
for downstream devs and users for no good reason" kind of thing to
me...

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

