Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2B347193B51
	for <lists+dm-devel@lfdr.de>; Thu, 26 Mar 2020 09:52:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585212756;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ofhavjMMkRMNzIDQefWhsXlWBgbpZJS6vnb71inNnj0=;
	b=RwBdfszKv8KO536OTsk9ic/WZLVKEtCBlqsCGJWIxRIB/qkp0jUNx0UmHvpVXY3OtFByM4
	9krfcyeZnkXP1ZK1MKmAPexhYPqMsD5iQ573uKqeMTM0f4rCz1hlGOSqQMRnog+Ax0x0aj
	i5BVgX7C0Tnk5MiDMztIsWfPhvwNKJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-AlI6Sgq6OSqrCM5S_1VKLg-1; Thu, 26 Mar 2020 04:52:33 -0400
X-MC-Unique: AlI6Sgq6OSqrCM5S_1VKLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23015107ACC4;
	Thu, 26 Mar 2020 08:52:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5BFBA0A9C;
	Thu, 26 Mar 2020 08:52:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E576F1809567;
	Thu, 26 Mar 2020 08:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02Q8pnkb013263 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 04:51:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2407114CAC; Thu, 26 Mar 2020 08:51:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6CB114D02
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 08:51:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE5978007C9
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 08:51:47 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-472-WTSxF4hcNoCl9xFkexeC8w-1;
	Thu, 26 Mar 2020 04:51:42 -0400
X-MC-Unique: WTSxF4hcNoCl9xFkexeC8w-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 26 Mar 2020 08:50:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 26 Mar 2020 08:41:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 26 Mar 2020 08:41:06 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1276.namprd18.prod.outlook.com (2603:10b6:3:b1::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2835.20; Thu, 26 Mar 2020 08:41:05 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Thu, 26 Mar 2020 08:41:05 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 2/3] libmutipath: don't close fd on dm_lib_release
Thread-Index: AQHWAyZDZGpgtLQgvUWbvALPfh1fTKhajkoA
Date: Thu, 26 Mar 2020 08:41:05 +0000
Message-ID: <6b99731ed6f7cc983e1f12a6b679bb4be1f1ea05.camel@suse.com>
References: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
	<1585196568-23714-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585196568-23714-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f80f2c2-b521-4284-393d-08d7d1616c36
x-ms-traffictypediagnostic: DM5PR18MB1276:
x-microsoft-antispam-prvs: <DM5PR18MB12763F698299B5CF85072E04FCCF0@DM5PR18MB1276.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(316002)(2616005)(4326008)(6486002)(71200400001)(76116006)(91956017)(64756008)(66556008)(66946007)(66476007)(186003)(6506007)(66446008)(110136005)(6512007)(86362001)(26005)(66574012)(36756003)(8936002)(81166006)(81156014)(478600001)(8676002)(5660300002)(2906002)(4744005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1276;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4msWdsgamhE9/dJ7CeJtt+MoHAnS5dtC3qDPg7X39WFuz+pSCbLnDppebZbtnDAjawV6Pgk04YX+odZBWwRPxSLWNbnGKrEUSwQ6Bc13AvoLnhRS8fB9/d7cQ6gdK3W7eY4fCejxMY2CYtb4FXhNoZ2g+s5LM7wVVycMCIJoG/8f64jkdhMsYKrRJFP8DfUQPFF0L0jBRzB9ISeiiLGXnPbEotl/K1CVdSp9/iAPIsu2UI+gqZ4eV4+VyWpuB73YTfTEA+PHzPGI7kXIuJxvQO3ntY/3x0xA4ww6erA+QWhV7dlqi2ReOQoM6Wz9Uv4iz+ZHEMriK8D7EvMsPr8p/zZK+VmSKgGs/ZV1Ch1pQdWJkgZUwvT1iWwTVKEZpB21BDcPNUH/M8PibO+cRY+3/cR8zdsCi887BgBue++cSgYBRhzc2lTIr/BgfkyRDZAI
x-ms-exchange-antispam-messagedata: rzisCxKB4JzeelIKRe9pnFWfuMjBPbNwR9EXLVkSKvQBnlpfjOzK2+wmVrwxsOGr/tnZkRUAkbMoCobIPgOttJDSQumFOA5l+7Iz0LTReGOqKBrpqTVO4k3dLwTpc814EKpjOL468t/C4iQ8kdVvlg==
x-ms-exchange-transport-forked: True
Content-ID: <3954F07A9C65BC46A08A0A4034F74910@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f80f2c2-b521-4284-393d-08d7d1616c36
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 08:41:05.2171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1nj/IFvaqFvY4y5/tMT90NlNTvu4ej8IiXvgtJ2dtdRyUJat5AJ/Bl73A6N5pC1Ke9IJDp2fVLsvrCFKRQnlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1276
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02Q8pnkb013263
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 2/3] libmutipath: don't close fd on
	dm_lib_release
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-25 at 23:22 -0500, Benjamin Marzinski wrote:
> If dm_hold_control_open() isn't set, when dm_lib_release() is called,
> it
> will close the control fd. The control fd will get re-opened on the
> next
> dm_task_run() call, but if there is a dm_task_run() call already
> in progress in another thread, it can fail. Since many of the
> device-mapper callouts happen with the vecs lock held, this wasn't
> too
> noticeable, but there is code that calls dm_task_run() without the
> vecs lock held, notably the dmevent waiter code.
>=20
> Since, as Martin pointed out, dm_hold_control_open() hasn't always
> existed in libdevmapper, check if it's supported on compilation,
> and update the version requirements if so.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

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

