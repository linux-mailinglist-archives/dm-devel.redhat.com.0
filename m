Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 79D0219CFED
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 07:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585892884;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Uz5Yc4YV5qEThZF9W14LNLkwmUDL6gkg68sXxH0joB0=;
	b=eu54ExL4a6xb9Kt3V24Bjao05oTLuO3Im8OKcGk4zK+D9NhcU/MFszBw6JzqVPd+TV79ej
	Aum/Vb/q6vDGgeQQkhwMmJol8oCck6yxWfa1Fx1LSU7lMOKWghblHBvOn8GxUtZcXn05Y/
	JVhVcV79I0HKFzg4gugMc3QhG6/AxIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-_dRD3KmxP5enw-jbjV4fOw-1; Fri, 03 Apr 2020 01:48:02 -0400
X-MC-Unique: _dRD3KmxP5enw-jbjV4fOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB6D518B9FC1;
	Fri,  3 Apr 2020 05:47:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D2E5261A7;
	Fri,  3 Apr 2020 05:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E6C418089CD;
	Fri,  3 Apr 2020 05:47:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0335lMYJ025063 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 01:47:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8274E2166B2E; Fri,  3 Apr 2020 05:47:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DA5C2166B2C
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 05:47:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F83A8FF66B
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 05:47:20 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-MCU9o45eOoapodzGddmuhw-1; Fri, 03 Apr 2020 01:47:13 -0400
X-MC-Unique: MCU9o45eOoapodzGddmuhw-1
IronPort-SDR: xS8difiiTvYB8v1HMAVs9RvtNXBZD+MyjSalz9IPmPx86P+TFC+WhedwJm6+/HppaIbaJw56C9
	yN4HgnwKRoAZbxDKEW+9ScoXDin5Cg5wDuZ3f1xZ3IAK3i1zaGEkcswBlBKDDHVuJSNSLbdfwH
	+TDd/NT9gWjok4ZdbxtNGnzh0cYUcwCuUvWmC3ZL9O8o/ZIDPitYXidKW50u9R8m7PPO7rN7Po
	SliSHqNo1cV7YxvSzG1EzGVWa2qeSFTVWf1okqjnjI41OtyZfd0qDVB3xuDgru0Rn8RBl+YW4t
	khs=
X-IronPort-AV: E=Sophos;i="5.72,338,1580745600"; d="scan'208";a="134484685"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
	by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2020 13:47:11 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2150.namprd04.prod.outlook.com (2603:10b6:102:c::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Fri, 3 Apr 2020 05:47:11 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2878.014;
	Fri, 3 Apr 2020 05:47:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: John Dorminy <jdorminy@redhat.com>, Hannes Reinecke <hare@suse.de>
Thread-Topic: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
Thread-Index: AQHWBAd2RJyr/50iGE+ALqrV5GTuTQ==
Date: Fri, 3 Apr 2020 05:47:09 +0000
Message-ID: <CO2PR04MB2343FC2FBA8E204A289BBFC4E7C70@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
	<93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
	<CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
	<bbebc0d7-2d53-8412-81c2-d36842fc25e9@suse.de>
	<CAMeeMh9JBuOuOi2s0VB6K1KXExUv-kyP2OavRXE==tHJAXbMFg@mail.gmail.com>
	<CAMeeMh8+6ssUyYqiDQL2kWpwPwjPZRQJbLa7bDUL2tYqeUKjOw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a0a0d76f-8722-465d-d79f-08d7d792738d
x-ms-traffictypediagnostic: CO2PR04MB2150:
x-microsoft-antispam-prvs: <CO2PR04MB2150E41D5AD48DF1B268DA33E7C70@CO2PR04MB2150.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(81156014)(6506007)(66446008)(91956017)(86362001)(66946007)(55016002)(110136005)(66556008)(64756008)(9686003)(66476007)(478600001)(71200400001)(76116006)(54906003)(5660300002)(316002)(52536014)(2906002)(8676002)(186003)(26005)(7696005)(53546011)(81166006)(4326008)(8936002)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/8h45gFrinnKlOITy27hqqEpEUEhzZdmTvMzo7QBMKgKB82I+3MP95asBUsy2Tg7dAktgEryOlbvmfLb1Br9eZoevkKw9xF4631/a60Uq0TpY0aSXNdEqusSdCWFp11kWiHNPhudXLG+gS46zRGfEDzBpk3BQ1I26KE4GLUYA1uIo7jm0S9SNxWW4oEauVe1mdxJbTKb4UE/yGssDIPVyePuz4AKKFh3T6eKWVtKfkB3X+uxwPKiob/pwYZaZF5AfOs7AMgvQuEv+uP5toY3pXalE5pWnfksQe2/1iPF57rPHcKu1tMXM5Tagnh1vJXOq8BLPbUaDVlMYMiVhO3+VQDY2QHPJZcHGoV8gVGK4lph3sy9QIKET+jYGeiWY6uhZCVIHx3CUvXPPacA78gWxIooMIqHIYOrr7hfigSxFd/nV5A7bRR9Xpzse5vcJTY
x-ms-exchange-antispam-messagedata: 2EZSDW0mrCeZWRKI0ekAgvkL7GcAx2PIyLy6c2o8qcLSHQV5zrf4BAGt6deqzlOchgEsXsayEHn57kUA4Hvs/gRNTfaXzy2Bjjwju1cfKbVH3fSU6xzMHcvjJjyFTMfW9i/XLoWIbLYmsUD3Q8vZzQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a0d76f-8722-465d-d79f-08d7d792738d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 05:47:09.9057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/m7Im01b48TzsM1Qaskz7YHIG2zAXONdTvW0sEv4uLGdJZyhbnTKkW4heRwf0vT5hVsV/wgHIxdgdL+gYN80g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2150
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0335lMYJ025063
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>,
	device-mapper development <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/03 5:01, John Dorminy wrote:
> Actually, I take that back. If it is a worry that the internal representation
> will change, it seems also unsafe to be casting the sixteen bytes as a uuid_t
> when copying into them with uuid_copy(). If the internal representation changed
> to add a new field, then there would be a buffer overrun when using uuid_copy().
> If the internal representation changed the order of the bytes, uuid_copy() would
> propagate that to the on-disk structure and yield compatibility issues.
> 
> Perhaps it would be safer to store the UUIDs on disk as a string. Or add to
> uuid.[ch] a function to get the raw bytes in a fixed order suitable for storing
> on disk?

Please have a look at file systems on-disk metadata definition and checks. There
are plenty of examples of how UUIDs are handled. For instance, XFS has in
fs/xfs/libxfs/xfs_format.h:

typedef struct xfs_dsb {
	...
	uuid_t          sb_uuid;        /* user-visible file system unique id */
	...
}

For the on-disk super block UUID and the same for the in-memory version.
And you can see code like:
memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
uuid_copy(&to->sb_meta_uuid, &from->sb_uuid);

and checks such as:

BUILD_BUG_ON(sizeof(geo->uuid) != sizeof(sbp->sb_uuid));

for some UUID declared with:

unsigned char   uuid[16];       /* unique id of the filesystem  */
(struct xfs_fsop_geom_v1 in fs/xfs/libxfs/xfs_fs.h.

On the other hand, f2fs defines its on-disk and in-memory super block UUID as:

__u8 uuid[16];                  /* 128-bit uuid for volume */

And copies it with:

memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));

The general pattern is:
* For UUIDs defined as uuid_t, use uuid_copy() or memcpy()
* For UUIDs defined as an array of bytes or char, use memcpy()
* Add BUILD_BUG_ON() checks when mixing both definitions.

There is no need to go as far as using a string for the UUID.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

