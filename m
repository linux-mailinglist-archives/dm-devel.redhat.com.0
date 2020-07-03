Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 588DF213801
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 11:48:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-g1J8KtDiPl-m3-C3n72VUA-1; Fri, 03 Jul 2020 05:48:56 -0400
X-MC-Unique: g1J8KtDiPl-m3-C3n72VUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F91BFC0;
	Fri,  3 Jul 2020 09:48:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 540905D9CA;
	Fri,  3 Jul 2020 09:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D828F6C9CA;
	Fri,  3 Jul 2020 09:48:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0639mOF0012971 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 05:48:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18E51218ADCF; Fri,  3 Jul 2020 09:48:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89532218ADCA
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 09:48:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 845B48EF3B0
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 09:48:21 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-507-OVKqKJfnNAGjokMLu_pV1g-1;
	Fri, 03 Jul 2020 05:48:19 -0400
X-MC-Unique: OVKqKJfnNAGjokMLu_pV1g-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-2-sVdq0vf9MQeFmv2uZyomBQ-1; Fri, 03 Jul 2020 11:48:16 +0200
X-MC-Unique: sVdq0vf9MQeFmv2uZyomBQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2919.eurprd04.prod.outlook.com (2603:10a6:4:9b::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27;
	Fri, 3 Jul 2020 09:48:15 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3153.028;
	Fri, 3 Jul 2020 09:48:15 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 0/4] misc patches
Thread-Index: AQHWUNJNYkwxvx1z30GgE7TBj+NI56j1mdcA
Date: Fri, 3 Jul 2020 09:48:15 +0000
Message-ID: <78bee5d7a30844f473355c36f5187440cf8df0a0.camel@suse.com>
References: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e759d57-6942-4417-b3ac-08d81f363518
x-ms-traffictypediagnostic: DB6PR0402MB2919:
x-microsoft-antispam-prvs: <DB6PR0402MB2919AF2FAE8BC2C452968CECFC6A0@DB6PR0402MB2919.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +eb6OUkeD1tjbY+AtgfCTSZPI3dnHUOZpSfqxbTpxLu2DdPPje2/R03R752FQPB7zS/4JH2tlMPsPtfKu174mpFxkib7Rw988UpJZWbLGHFVNj0q4OI4vO2wViVuuzGWYchWIuhj1kJvLe/LGqVx2TKH1VmWkKL7FyCWYxBJT1gqsPSjMFHMKi1u2d+0CMBr49Nv2/ZrAB2FassI7iJwySKDrwj7npePgAvzDkSBUFn/is9urNOB46VsUp3/CrxOr+v4FHWFLUAthIp4LzL2zZOOQWrNX8dc3pkqdP/oymx/2AZ2wFS7n7jhSJM+NP3qN6tMTJTYK5JLPq8WenFPXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(366004)(376002)(39860400002)(396003)(136003)(36756003)(66556008)(66946007)(83380400001)(66446008)(64756008)(8676002)(86362001)(5660300002)(2906002)(66574015)(8936002)(478600001)(6512007)(4326008)(71200400001)(66476007)(76116006)(91956017)(6506007)(186003)(26005)(110136005)(2616005)(316002)(6486002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: dhmYCL7coeW+I6fn37Vp+gr3BfBJUd1AdvK4mMqIfbKE+vYY9O0cl7QXGs/haWFFq6Wxsd26nLvTify72NEOP3ZhGCkX9s3po2SYZmGWhdg3QNRfb9CkpcLsC62Pyw3F98zCKo2GXh+Eru5vshjwwVhiKmSGbfRTUGbS3+fNDKsC6jpK2b0h3CmxczCGIoeGkQLwM3tVGL+WBaBQcrEmwpSkM2pxdAnfrTalcDXAdqhmZOBnssv6wMBCE2371BUY0wKO0JQvNzYoKmtuxEIS9YevMv5LuYeNJbqMw0ygoQtWqFFziIIs0HoQC8s06a5SGpbqpXjiWxas7r1sD8cG0nrUA7oVdS7Q+g9CSE94iMY8kO0ldf2n/sXmPUuKQP9S4zu1Ga5hP9g+VnuaHDCks1Ur08AyLWL5yrDKkEKOiPlDK0wy2d7C4L6UvAFx456ZM6pUEFpk/BlUlg92ZL/c8FQmdOeJVYA4nl7P1hmgEMJrrVTorCnOBeb9ylka5V9K
x-ms-exchange-transport-forked: True
Content-ID: <9FE2A1C24D3D134EA76E6040D32B362E@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e759d57-6942-4417-b3ac-08d81f363518
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:48:15.1731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcVnSrm8tUSXA7glVKrZFHIQCfl8F/3jw5zIePKe+NdTvb/gQg6GCjnZjoZOAaZy+WdEEMkMQ68Qflds1h1vWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2919
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0639mOF0012971
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/4] misc patches
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-07-02 at 19:38 -0500, Benjamin Marzinski wrote:
> This is a small collection of individual bug fix patches that apply
> on
> top of my previous patch set.
>=20
> Changes from v1:
>=20
> 0001:=09Going with Martin's strtoul() method instead
>=20
> 0002:=09Now getpagesize() is only called once, and size_p is only set
> if
> =09posix_memalign is successful, as suggested by Martin.
> =09
>=20
> Benjamin Marzinski (4):
>   libmultipath: fix sysfs dev_loss_tmo parsing
>   kpartx: read devices with direct IO
>   kpartx: handle alternate bsd disklabel location
>   libmultipath: fix checker detection for nvme devices
>=20
>  kpartx/bsd.c             | 16 ++++++++++--
>  kpartx/dasd.c            |  7 ++---
>  kpartx/gpt.c             | 22 +++++++---------
>  kpartx/kpartx.c          | 56 ++++++++++++++++++++++++++++++++----
> ----
>  kpartx/kpartx.h          |  2 ++
>  libmultipath/discovery.c | 12 ++++++---
>  libmultipath/propsel.c   |  4 ++-
>  7 files changed, 87 insertions(+), 32 deletions(-)
>=20

For the series:

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

