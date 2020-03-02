Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DACC3176672
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 22:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583185946;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gvTXYvhe9xsbP/5ZFrFzD5j893v6XSabmSdssVp0qRo=;
	b=fJ0OL8jx7lgcJst4mdUbVb5RoVjCnQIaVCPH7d4ivLtTROjGLGZIWVDKeiqGLTQtZlq6qJ
	LYoneuojFf+7+O34pR7MxmOcRI7xlRbYclLxfQe8p/1x90CLAI1OWedvOd1n4aJyY/lcwM
	0lyzyjt+64699uMky3k8hfizINZyGso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-eDAdsEbyNqiIfyKIl1ayig-1; Mon, 02 Mar 2020 16:52:24 -0500
X-MC-Unique: eDAdsEbyNqiIfyKIl1ayig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E51C2800EB5;
	Mon,  2 Mar 2020 21:52:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4B235C1C3;
	Mon,  2 Mar 2020 21:52:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 932DE18089CD;
	Mon,  2 Mar 2020 21:51:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022LpbKw001672 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 16:51:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A073110D18DF; Mon,  2 Mar 2020 21:51:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A61611701F9
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 21:51:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97D1D800298
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 21:51:35 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-210-9lyQauniPrKwKTtGWTpj_Q-1;
	Mon, 02 Mar 2020 16:51:32 -0500
X-MC-Unique: 9lyQauniPrKwKTtGWTpj_Q-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Mon,  2 Mar 2020 21:50:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 2 Mar 2020 21:51:07 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 2 Mar 2020 21:51:07 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB2119.namprd18.prod.outlook.com (2603:10b6:4:b6::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16;
	Mon, 2 Mar 2020 21:51:04 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2772.019;
	Mon, 2 Mar 2020 21:51:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] multipath-tools merges
Thread-Index: AQHV8HwZDbgM9Npzj0SiGjaZepz35ag12F2A
Date: Mon, 2 Mar 2020 21:51:04 +0000
Message-ID: <3f8ae4512f68c5ba0cce93e5da27bb812dd8107e.camel@suse.com>
References: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
In-Reply-To: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 239c81b1-561c-4f55-d515-08d7bef3ce7c
x-ms-traffictypediagnostic: DM5PR18MB2119:
x-microsoft-antispam-prvs: <DM5PR18MB211941519828A98B7797AB84FCE70@DM5PR18MB2119.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(189003)(199004)(86362001)(76116006)(36756003)(4326008)(5660300002)(2906002)(6506007)(66574012)(6512007)(8936002)(2616005)(81156014)(81166006)(110136005)(71200400001)(26005)(8676002)(64756008)(66446008)(186003)(498600001)(91956017)(66476007)(66946007)(66556008)(966005)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2119;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sg3iq6x6ldsL7fABSuE5AKX1OkoiGYgu6vXCHPn/VWIYKoTAMtDttcFPgvgUERFXd2DuqRc2B1wwXJmL4UWiFlTPC8Zisq7EyKJk7LnMh3HbWSzrpDnSEYOm1jgePgF+piuufGrQznLBI63unqajMmCty01Melu9bxNrm/yLFObIWyUS7s+Q6hlUZ6I9+7Pnu8bZvm+4QL8dvFzg+LDRZflvCXUFEfPjZJ55w5IRfPWLk8zYWjVC2RvMuquXXdUukJs0DnhCT/ddzJ0WUDfPszqIcXUv3g/4JsX9Vs6ynL5mJ+o62ywlhj/B2Ev09tmu93HLkn5XU0KSDsxQKQKiG792AOtUsOeqKRkxyHwnYk4/CnCSqLWRh38gf9W6bgGnoHki+oFIVSZABPARJ/hFGjbLP1vfC5cYFgBhjoAP8cyB6fJfaGQ0jttei2etd/nTZ6ALXhjQDD21o3yft+pf4IB2Y56665Uk8JN0g42HwxiLq5kZyeH9GQSHzvn6GFJJiXBnCsE7t7u0m5TLE6f2PA==
x-ms-exchange-antispam-messagedata: 5qNPwvLYh8Erg3KF7wwS0g5cXgCV11J4WMV93/4aMUVijTFvQKowOfVsOGPbYC9VT+0gX+VKc3gu60l7cKJCYhnEXMbNnU8mPURj0BXXHOjEEFateJGHu8wAVbJmthfIVMv1hBbbhARUWrfV8wCuzw==
x-ms-exchange-transport-forked: True
Content-ID: <4EAD0A9D07ED294399ED93B7A58B9077@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 239c81b1-561c-4f55-d515-08d7bef3ce7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 21:51:04.3034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkwQNrnhAItqm0iCRS/5OwV7o0hWPe4sZ76o8qzbH9j64XzdA1in9rDqYBnWmsTBBDBdJHWYQ5wTfauSQ8cVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2119
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022LpbKw001672
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipath-tools merges
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Mon, 2020-03-02 at 11:19 +0100, Christophe Varoqui wrote:
> Hi ben, Martin,
>=20
> I finally catched up with your changes from october till now.
> Please review I did not mess up the merges, then i'll commit a
> version bump.

This is great, thanks a lot!
I admit that I was starting to get nervous :-)

It seems that you missed the following patches from me, reviewed by
Ben:

 * My "Drop nr_active, and some more fixes" series from 11/19
   - "multipathd: move set_no_path_retry() back to libmultipath"
      Review: https://www.redhat.com/archives/dm-devel/2019-November/msg000=
99.html
   - libmultipath: dict.c: rename duplicate set_no_path_retry()
      Review: https://www.redhat.com/archives/dm-devel/2019-November/msg001=
00.html
   - libmultipath: drop mpp->nr_active field
      Review: https://www.redhat.com/archives/dm-devel/2019-December/msg000=
37.html
   - libmultipath: fix (max_)polling_interval setting logic
     Review: https://www.redhat.com/archives/dm-devel/2019-November/msg0010=
1.html
   - libmultipath: fix ALUA autodetection when paths are down
     Review: https://www.redhat.com/archives/dm-devel/2019-November/msg0010=
7.html

 * libmultipath: fix compilation with -fno-common
   Review: https://www.redhat.com/archives/dm-devel/2020-January/msg00118.h=
tml
 * libmultipath: fix files read from config_dir (from Enzo):
   Review (by me): https://www.redhat.com/archives/dm-devel/2020-February/m=
sg00058.html

Furthermore, as I indicated before, I'd like to propose a minor change on t=
op of Ben's
last series before you tag a new version. No C code changes, just build log=
ic for
unit tests, and a README. I'll post it ASAP.

Regards
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE
Software Solutions Germany GmbH=20
HRB 36809 (AG N=FCrnberg) GF: Felix
Imend=F6rffer


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

