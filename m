Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBCB103631
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 09:46:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574239618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xma23swfJ3r6GwB8dRJB1mG97fHGWl+KZSSQcOw0BVQ=;
	b=Dt2n86gTqjP3PFBshbS+yjYUasxInPz07/0KZv7ZETGhTSivsR3KwTJKKEsTHjgbPa12D9
	eccT3i9qF61VMjcnqpbwuzhrbXXWf3rEXNfjYQZngvAztWrMv2qyUrOxSJ0Sbka8ZKErtQ
	t4x1+eVQy2yjVsW70a7QvF/DTNQzaDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-utn8vmFvPuiNXMjS3Z4KDg-1; Wed, 20 Nov 2019 03:46:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B5B291212;
	Wed, 20 Nov 2019 08:46:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C96055F775;
	Wed, 20 Nov 2019 08:46:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A57F4BB65;
	Wed, 20 Nov 2019 08:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAK8kJjH022664 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 03:46:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EC4510D18DE; Wed, 20 Nov 2019 08:46:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 999E010D18D9
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 08:46:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E9D800FF8
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 08:46:17 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-209-3D3lllVxPp6_qNkbRfC2Kg-1;
	Wed, 20 Nov 2019 03:46:13 -0500
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 20 Nov 2019 08:44:49 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 20 Nov 2019 08:24:18 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 20 Nov 2019 08:24:17 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1433.namprd18.prod.outlook.com (10.173.210.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.29; Wed, 20 Nov 2019 08:24:16 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150%5]) with mapi id 15.20.2451.031;
	Wed, 20 Nov 2019 08:24:15 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 3/5] libmultipath: drop mpp->nr_active field
Thread-Index: AQHVm8LQMLLaG1tHZEKH7MqFgiLccA==
Date: Wed, 20 Nov 2019 08:24:15 +0000
Message-ID: <ca926b381746635f6861c973ee32e1812753406b.camel@suse.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-4-martin.wilck@suse.com>
	<20191119222203.GL30153@octiron.msp.redhat.com>
In-Reply-To: <20191119222203.GL30153@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b47abebc-dd72-4963-6071-08d76d93080e
x-ms-traffictypediagnostic: DM5PR18MB1433:
x-microsoft-antispam-prvs: <DM5PR18MB1433E94371054278D1D26546FC4F0@DM5PR18MB1433.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(51914003)(199004)(189003)(2616005)(446003)(11346002)(476003)(54906003)(1730700003)(8676002)(486006)(99286004)(36756003)(5640700003)(81156014)(316002)(81166006)(66446008)(26005)(5660300002)(64756008)(2906002)(66476007)(66556008)(8936002)(6506007)(3846002)(6116002)(66946007)(186003)(7736002)(66066001)(305945005)(229853002)(4001150100001)(6436002)(14454004)(71200400001)(6486002)(86362001)(76116006)(102836004)(71190400001)(91956017)(14444005)(256004)(478600001)(118296001)(6916009)(4326008)(2501003)(76176011)(2351001)(25786009)(6512007)(6246003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1433;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n0PgPoCmLDQtCgdPcNwF/o3xItLy2bjI8lZ6BJfJv6VL4HZCPVqGK25ZGT75y+6xAxyZxtQw68KD8SOhQRDdlJ25zjMzy6dXISYQmPAKoqKEvnXpCCoqEKjJOiPNGMFmEPEMhsRrP9nIFKZDRWWiOKfJNo4xK4omcxAeK2rt4aJxbA14BDIA/JlK2rgexxHTBjRrdQCZtVrsUwKzaFGkkoORBqA13Ye46tJBxH8m50VyKPNOrD1xFRY9Uc0i+5ebQ+ppYe/zVk+cTglOfpiiTq6+S/mnQ6siy4Jhw/eLURdPwrLsEeUmX4o27JSgKndJ6d6vCtJ4g1dlndBx+DX5AKoWiyWT4k50wiNHYw5tLnDmaW0DB38AdHDPS026IhcWJqLtoFQ7EGZwq9jMlyolp8vvkDPtbvRsNaVnjYpvdab9W8TpVlOfff659xbnihSN
x-ms-exchange-transport-forked: True
Content-ID: <0AD77CE7DA48C741B703A4F481904402@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b47abebc-dd72-4963-6071-08d76d93080e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 08:24:15.5076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxcGWblzUBSPHOihcrhhTgMgWyjtlD7G/MAuToizhrxcNHdk/vTxWYZR6hzXJaJd1eV2dB9oEi6KZsdQ2ekyig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1433
X-OriginatorOrg: suse.com
X-MC-Unique: 3D3lllVxPp6_qNkbRfC2Kg-1
X-MC-Unique: utn8vmFvPuiNXMjS3Z4KDg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAK8kJjH022664
X-loop: dm-devel@redhat.com
Cc: "xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"wu.chongyun@h3c.com" <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Bart.VanAssche@sandisk.com" <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 3/5] libmultipath: drop mpp->nr_active field
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-19 at 16:22 -0600, Benjamin Marzinski wrote:
> On Fri, Nov 15, 2019 at 02:41:50PM +0000, Martin Wilck wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > The tracking of nr_active has turned out to be error prone and hard
> > to verify. Calculating it on the fly is a quick operation, so
> > do this rather than trying to track nr_active. Use a boolean
> > field instead to track whether a map is currently in recovery mode.
> >=20
> > Moreover, clean up the recovery logic by making set_no_path_retry()
> > the place that checks the current configuration and state, sets
> > "queue_if_no_path" if necessary, and enters or leaves recovery
> > mode if necessary. This ensures that consistent logic is applied.
>=20
> Thanks. This looks better. The only thing I'm am sorta worried about
> is
> that when we call the cli_handler functions, we haven't called
> update_multipath_strings() to sync the state with the kernel first.
> This
> could mean that multipathd is wrong about what the queue_if_no_path
> state
> is, which is possible since it doesn't update mpp->features whenever
> it
> calls dm_queue_if_no_path(). However, in the worst case scenario,
> this
> would only cause multipathd to need to wait for the next call to
> check_path to fix this up. Alternatively, we might to call
> update_multipath_strings() here, or even replace the calls to
> set_no_path_retry() with something like setup_multipath() or
> update_multipath().
>=20
> Any thoughts? I might just be being overly paranoid here, since I
> can't
> really come up with a good explanation for how this could even get to
> be
> in a problem state, and like I said, even if it does occur, it will
> just
> get resolved on the next call to check_path.

Having to call setup_multipath() in this code path seems too much to
me. One tempting thought would be to simply keep mpp->features up-to-
date, but we're trying to achieve consistent state with this patch set,
and that doesn't go well together with trying to track kernel state in
user space. After all, in theory at least, users could run "dmsetup
message /dev/dm-$X 0 fail_if_no_path" any time, and there's no way to
get notified about this. The way multipathd currently works, we would
find out in check_path(), no sooner.

So, I believe the cli_handler code path should not look at the features
string. I'll send a v2.

Thanks for the review and regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

