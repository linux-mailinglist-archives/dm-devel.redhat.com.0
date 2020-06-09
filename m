Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5DF1F495D
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jun 2020 00:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591741766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H/8joJHboqkphhgAGeAGF/5F4SPtPa3ZOHX0cVQZxvQ=;
	b=iT5ZM7tVv/JL1x/UiWAmpvIBYrR7DgSQkzd5iTmsoWmtLEHQFj9WLlJYjlpiGup/zv1dfw
	kD7BJbtj7pvl7ZkkFOl8nImxEIRkkny04KlzlxWxRgBpgK3I0ILAlseShnqo1PXR4MREJX
	6MhWxOa1mvlbjms/MmM+eTUYQwkh+YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-W_46j2B9M8OMQVuF6pdXaA-1; Tue, 09 Jun 2020 18:29:24 -0400
X-MC-Unique: W_46j2B9M8OMQVuF6pdXaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E453683DB38;
	Tue,  9 Jun 2020 22:29:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E488210246E1;
	Tue,  9 Jun 2020 22:29:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD8AD1809542;
	Tue,  9 Jun 2020 22:29:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059MLHrF001445 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 18:21:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA5442156A2E; Tue,  9 Jun 2020 22:21:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D50032156A2D
	for <dm-devel@redhat.com>; Tue,  9 Jun 2020 22:21:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85BEE805229
	for <dm-devel@redhat.com>; Tue,  9 Jun 2020 22:21:14 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-224-KWzCYLgVO6Oqlp7qvEMgGA-1;
	Tue, 09 Jun 2020 18:21:10 -0400
X-MC-Unique: KWzCYLgVO6Oqlp7qvEMgGA-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  9 Jun 2020 22:20:08 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 9 Jun 2020 22:20:43 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 9 Jun 2020 22:20:43 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB2057.namprd18.prod.outlook.com (2603:10b6:4:63::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20;
	Tue, 9 Jun 2020 22:20:42 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3088.018;
	Tue, 9 Jun 2020 22:20:42 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 0/3] multipath: change default devnode blacklist
Thread-Index: AQHWPqXvo+hVGMQirkWe9y59jgbYyKjQ2x4A
Date: Tue, 9 Jun 2020 22:20:42 +0000
Message-ID: <7592ecbee0d4e8b3d06e39992d62256efaf5d109.camel@suse.com>
References: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1140ce-e396-436d-5360-08d80cc35905
x-ms-traffictypediagnostic: DM5PR1801MB2057:
x-microsoft-antispam-prvs: <DM5PR1801MB2057B12AA19F7BD7D878BBC2FC820@DM5PR1801MB2057.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s1UzJ2YY7dnSFUvDWSILZ3dq/zKJlrMAuuqkmpJXi4kTndSO439kOJH8uXfSdis8F7w54XF77NEqSm8XI38OUnKmxfeZASCIkhlROEfUhux9s57buyb93YO0WqBBcuOPghnRe0CL0QTzGK1YyRxwF/Pkk+fUiyDz2Rk+DHNoSEonims8T/+kNdZJk3lFGmlS5HFSt1Iqxz7fxcgUJaUmmurOZrwxbNk8FT6vYT2NvTlWrruT8o0fQ5bUcayanUtTk0jCWmtnsqgIufIrTfO+qx+Jjvxcy8SV1iLB2iGd4iI8ZPllGwqlgTBkzE6VOgRz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(366004)(2906002)(186003)(6506007)(6486002)(478600001)(8936002)(86362001)(66574014)(83380400001)(6512007)(54906003)(4326008)(110136005)(64756008)(5660300002)(91956017)(76116006)(316002)(66476007)(66946007)(36756003)(26005)(71200400001)(2616005)(66446008)(8676002)(66556008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 3tQ+CkHiBLuICkGIbNIEabygy79Qoa21Cc5uT58FK9qTNck3bEKZYKGhcom44r4viUsW+lE+twZX+d+YRkSfFi+9UZznYmmTC+7pEkfTMxcZJ72u1g1zv3zKvA0RywhZLT/HHKymsvLW6hnlzTOJth1tJydZIwJGoVMJ4+4Kg5BgPnOczChu57YmsPAw4tlUbNl4/4yy510Iu1SchWmCcFzmAX6m7zANtqXE2D+KwEhqrjIc5B0ltmVLJM4bMnKGI7b5xz8hhTOp4z53NnWnTt3SFZOosEohAzC45R2G7iwJukmbleec7IJK9YoN2vTf+L6llvuieEzin6FNwSzqjYni0lljkoBXd72j5ZA8vUlm8fXxMUlSD3IW+sf46OVDwNZ1yIg51V6z3i3vCQEvvlYBKNSVz3zNLDtySbqpMgw+Ewil5soLRqW1Ee6UKdY0Xc9LEIH2BKF2JEc2PeOHmIbegE+p3nyQgAc1+THkp2E=
x-ms-exchange-transport-forked: True
Content-ID: <B463664BB9638D4F9A50EBA461BFBB99@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1140ce-e396-436d-5360-08d80cc35905
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 22:20:42.4062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vlny+9EENjHR5flBfa9a3kd0rX6qDwgZYNCvR+fw2JKCDJ1iQwjXvDTRrsNgKjOjPabWfsgmBCQ0z5oe5bPuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2057
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 059MLHrF001445
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"nkshirsa@redhat.com" <nkshirsa@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/3] multipath: change default devnode
	blacklist
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-06-09 at 16:35 -0500, Benjamin Marzinski wrote:
> I recently got a request to add the Oracle ASM filer driver devices
> to
> multipath's builtin devnode blacklist.  However, instead of having to
> do
> always this for each device type individually, I decided to make
> multipath blacklist all non scsi, nvme, and dasd devnodes by default.
> This is what the multipath udev rules already do.
>=20
> Changes from v1:
> Everything. Martin suggested an alternative method for doing this,
> which
> is to treat an exclamation mark at the start of the
> blacklist/exceptions
> regexes as inverting the matching on the rest of the regex.
>=20
> Benjamin Marzinski (3):
>   libmultipath: remove _blacklist_exceptions functions
>   libmultipath: fix parser issue with comments in strings
>   libmultipath: invert regexes that start with exclamation point
>=20
>  libmultipath/blacklist.c   | 103 +++++++++++++++-------------------
>  libmultipath/blacklist.h   |   3 +
>  libmultipath/parser.c      |   4 +-
>  multipath/multipath.conf.5 |  17 ++++--
>  tests/blacklist.c          | 110
> +++++++++++++++++++++++++++++++++++++
>  tests/parser.c             |  42 ++++++++++++++
>  tests/test-lib.c           |   2 +-
>  7 files changed, 215 insertions(+), 66 deletions(-)
>=20

Very nice work, thank you!

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

