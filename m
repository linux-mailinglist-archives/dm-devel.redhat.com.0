Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 732841DB8F0
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 18:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589990652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Djxi9MuGnF8x5QyFzjE3KpDCJylmMM9QmHzxHBclq2g=;
	b=DHPUT/DRN/AMi66Qgtq8/6gC7keKHXKrbB1gbWBHCRYOsARcZGJA9Hty37g1QeW8n93dfG
	aPSelYY8zWrfbC3fWs1/Rr4kodt4JkTSVtbdjp+//szfmlZj0pNPPr7OGoL+yWk2oaT89b
	1NfxsasWuYaRqtXg8aV2vhVSK5WXc1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-m27dObtqNNCAQr9pMhxrnw-1; Wed, 20 May 2020 12:04:10 -0400
X-MC-Unique: m27dObtqNNCAQr9pMhxrnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B8F9835B69;
	Wed, 20 May 2020 16:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4235D9CA;
	Wed, 20 May 2020 16:02:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D49A1809543;
	Wed, 20 May 2020 16:02:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KG1F34010104 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 12:01:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E04C1008B8C; Wed, 20 May 2020 16:01:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8EF1007BA9
	for <dm-devel@redhat.com>; Wed, 20 May 2020 16:01:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8A28803AC0
	for <dm-devel@redhat.com>; Wed, 20 May 2020 16:01:12 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-147-wvLtvuv5MyKm1A5PjdhgKA-1;
	Wed, 20 May 2020 12:01:07 -0400
X-MC-Unique: wvLtvuv5MyKm1A5PjdhgKA-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 20 May 2020 16:00:26 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 20 May 2020 15:52:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 20 May 2020 15:52:49 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1979.namprd18.prod.outlook.com (2603:10b6:4:69::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27;
	Wed, 20 May 2020 15:52:48 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3021.020;
	Wed, 20 May 2020 15:52:48 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v3 0/6] multipath: path validation library prep work
Thread-Index: AQHWLgA4eVM1zr1N9U2R97/reXPM9aixIWeA
Date: Wed, 20 May 2020 15:52:48 +0000
Message-ID: <50bb1bddca8bf7291bdc571ab1f408bac919ab15.camel@suse.com>
References: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3af85b56-a279-484a-1761-08d7fcd5d859
x-ms-traffictypediagnostic: DM5PR1801MB1979:
x-microsoft-antispam-prvs: <DM5PR1801MB19799D677577D7AF97013265FCB60@DM5PR1801MB1979.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oD0a7x+ASXedKTd+cUTCAtYugluWuoKvq9d0yQoh5KexqbIKkaE/0sZKT7nyGv5atbDNupsFPnNRN61d6WAoCJzoNzs+ULrFD1k/kCu3nMzLLcWD5RmcoGKSOlzlKgNhDflpwczQkuL3Q+ofGZTSbJBaSdcgiRYIWw1jJkVxnK2lVyzxwkE6vKdK40CQxn7lDhRosW6GHaZ486qfF9RuSTOCCouQUGtnrt5gvgAI9sklTpe2RV/vx/gDb/x6+D9iDX8ayFhV9bmoxjz3jApmT3GUlJ3Z3x/nKhskVoYwiuxpOU+6T43R8YMRk6UOcwFc3kv//Oxka7DsHH2ymUtRSaamVp9034LDgZI+29fnsMTBT3jiS0u1zRFTni0LJ+2/TPirHPxxixZwm0NzUsCdlhAuSigqsCxKjiejcYPAbi/Y4w4nZibeA1UFKPbj/3Ix
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(4326008)(8936002)(8676002)(5660300002)(6512007)(186003)(478600001)(2906002)(6486002)(71200400001)(64756008)(36756003)(2616005)(316002)(86362001)(110136005)(66446008)(6506007)(66946007)(91956017)(26005)(66556008)(66476007)(76116006);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: TsBAS6mmiieSZPJiA7NLGhNXPTWcbWIwjk9bxwXpyF8e0/ectpJpTatAjqiJn4O92WQQeHbinxLPvlUlokoq1XZ0EBHELv4m+rmsG2GqXsEFswhMXiLsJciS8dUtjdHd49RpOqD6r4U3rbO3S4HykZ7bWW8gOpaYwI0mBT+T20OOZd9J4/Ykhgr3VNL/bbNsjKz0xuw66yQfBl+6ntim96IHuy81Sz/N3ALwVijWJydebWGeBudaS/8CR0CD1Ddf9eiJsMs0rWgaY/xjITG94KInmkDRBiFVhlj85s7fWDG2DvC/zWsfuFGjUyX5utKencWyH6lkfmbsaAMIGrZDo4l1Suuo1ERjO16ppwbYQKBfO1tSV9jwcZWPg83vGxsZKyaKYsS+Q4+pabEEK9bn3QI0pmAs+KYW1xTGU9DgsdI49ZpKXRJxqh42ru/0yaxO8Ws9WdHpHLyyLG98cb5JvFSBYbOmO+ow0Ig9bQpm1o/YUSD2VJgar9/NpEXyaMi6
x-ms-exchange-transport-forked: True
Content-ID: <7384220E39C90D44BDEA9F7B9F301699@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af85b56-a279-484a-1761-08d7fcd5d859
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 15:52:48.2616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSx7Zr6A5PkV/+HdIieEtZQk7WknEElOSdp+spFrINr75hv3q7PXRlQ2sDEz/6pFcKvl9LTgW4o1nTNQyUHJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1979
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04KG1F34010104
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 0/6] multipath: path validation library
	prep work
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

On Tue, 2020-05-19 at 12:08 -0500, Benjamin Marzinski wrote:
> I've been playing around with the SID code more and I've decided to
> hold
> off on submitting the library until I have it working with the SID
> multipath module better. Instead, I've pulled out the common code
> that
> multipath -u/-c and the library can use, and put it into
> libmultipath.
>=20
> I've also removed some of the ordering differences between the
> existing
> code and my new code.  Right now, the only difference is that if a
> path
> is currently multipathed, it will always be claimed as a valid path.
>=20
> Patches 0001 & 0002 are the same as in my "RFC PATCH v2" set, and
> patch
> 0005 is the same as my "libmultipath: simplify failed wwid code"
> patch.
>=20
> Only patches 0003 and 0004 haven't been posted before.
>=20
> Changes from v1:
> 0003: Minor fixes suggested by Martin Wilck
> 0004: Fixed typo, added tests for filter_property() and switched some
>       tests to pass the check_multipathd code in various ways,
> instead
>       of skipping it, as suggested by Martin Wilck
>=20
> Changes from v2:
> rebased patches on top of Martin's previous patch sets
>=20
> Benjamin Marzinski (5):
>   libmultipath: make libmp_dm_init optional
>   libmultipath: make sysfs_is_multipathed able to return wwid
>   multipath: centralize validation code
>   Unit tests for is_path_valid()
>   libmultipath: simplify failed wwid code
>=20
> Martin Wilck (1):
>   libmultipath: use atomic linkat() in mark_failed_wwid()
>=20
>  libmultipath/Makefile    |   2 +-
>  libmultipath/devmapper.c |  62 ++++-
>  libmultipath/devmapper.h |   4 +-
>  libmultipath/structs.h   |  24 +-
>  libmultipath/sysfs.c     |  24 +-
>  libmultipath/sysfs.h     |   2 +-
>  libmultipath/valid.c     | 118 ++++++++++
>  libmultipath/valid.h     |  42 ++++
>  libmultipath/wwids.c     | 165 +++++++------
>  multipath/main.c         | 295 ++++++++++--------------
>  tests/Makefile           |   4 +-
>  tests/valid.c            | 486
> +++++++++++++++++++++++++++++++++++++++
>  12 files changed, 943 insertions(+), 285 deletions(-)
>  create mode 100644 libmultipath/valid.c
>  create mode 100644 libmultipath/valid.h
>  create mode 100644 tests/valid.c
>=20

You included all the reviewed-by tags from me already, but for the sake
of clarity: ACK for this v3 series.

Thanks,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

