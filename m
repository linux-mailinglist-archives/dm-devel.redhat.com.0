Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B005021030C
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:39:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-GdPpcbYLNHmnOxUzk1v4Jg-1; Wed, 01 Jul 2020 00:39:21 -0400
X-MC-Unique: GdPpcbYLNHmnOxUzk1v4Jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6638C1054F8F;
	Wed,  1 Jul 2020 04:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E03F71667;
	Wed,  1 Jul 2020 04:39:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFFCE1809543;
	Wed,  1 Jul 2020 04:39:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614chV3007004 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:38:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 081AE10ABCA3; Wed,  1 Jul 2020 04:38:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0226510ABCA5
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 091F9101A525
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:38:41 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-z6u7Y1WrN1iB0qF7Hj3CRw-1; Wed, 01 Jul 2020 00:38:36 -0400
X-MC-Unique: z6u7Y1WrN1iB0qF7Hj3CRw-1
IronPort-SDR: F8/BEa7lOjs5Hk/g/KKN+hai27PSzZdYe8ZPy05g/b8ZebWDKrh1L14hzveAwsK+iif4gmP1es
	NngwuhoAw6dys2J6UeGzWYCwgjA5XVxbgLmIIPxE5bw3OvbCxzwjk0ZjSd5n4IxGPn/kUxNtl2
	kL11PgEqgrx10kua4KFSIxF/KgzStKI6NEa4n5zuE/4hqlqAO8Kb51yRLNfIFlWQ8/p84uAmtV
	NYz8lMoCPvm/crM/Tr0JrDu/QnrMsO6FCIG7ryyArpEoU2tBkja981Am/Q+MHNcjZwdhoPQ3JU
	NXU=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141341381"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:38:33 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:38:32 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:38:32 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 09/11] block: remove unsed param in blk_fill_rwbs()
Thread-Index: AQHWTm9GGu+q+vMGqEaJRxsHge5g6w==
Date: Wed, 1 Jul 2020 04:38:31 +0000
Message-ID: <BYAPR04MB49651D1104ED9F0BA2F3F912866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-10-chaitanya.kulkarni@wdc.com>
	<20200630051247.GF27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 042b2238-f138-4906-8e9c-08d81d789bfe
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB7124EC51C3C4F074996B003E866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z2699H2/kJuQjR6AzqgOse0tNXVsx66Le/N4pEePIYl8eMfMKhSuVKMS7SNExMl6vdmKLkXBQnktI88Q4t7g4cxzQ8B0KooV4ltaMpKp+jO+QT4oe2LTXBAUoZsNrAEfZ18PbBoxF4WCfiPQS56Bl7ADXIjjyuo0avboLVUR8rr68s2euTagypMSNrNCoOw3DtR9c8oL/bkFD8jMkFXzxXwfYPCA8Pv0zULlammqHPsywk/46yZznukZ6DYu862PE9E87QzEwQA4epANtlIsGz6sNyzQQEWjGhLBbSLzSDyXiLoBY0n1YGeKsTk+PYoTqu7pA58el9y1rbjdX38YAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(558084003)(33656002)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: X/J9H5Me2UyM70yk/2F1ZGBYrbQs380W/WP1U/TkA11NMeO2+DseW996MhTB344UIuea4lHyTfE51e580S+MJ2QDuawxIj+T/YmB4Gf3/Yiyp3Hz9sDBfr0Qeve7cHojTXrc+peIeDFa4w9kezdmVIXwzket+RslwJkSl3TE4sDTcoQcLYm44SF+Ol6kuqnA/fWQMoerAA2ObEiq88cFdU3npSec8zro11s3rfUEen4YslGqV0OPItiuzCCrzQ2YY0uuwE6TYGf4aRTVGdo5OLH2Xyv2Li6/d15CT88xDhqoC4X5F6KO9nGTd/k1EvOUbeeI46/2nEfCmiVi+csucgLmcEeERMg6e96i06WNp3xqp4PLC03mIzex5r8ZwJhNbXavWGpd6lAqmKyuhOFFwEzoTYr6qDfM+veUqnyRIvNa2eC0IsGqRhThc1zpy6IzxJ58x+QLsk6k4YFhNDgix49WVBuN1mRXHluk8e605zs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042b2238-f138-4906-8e9c-08d81d789bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:38:31.9459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OiDP2WOPB/xozrWFGXfvTOISvrjLbo8DmxdFG/PJMq1wzI0EAjTRrRDp1F/Xk20HX1s6nqWiQy0n7Hhrmlf4sz0THvD1ProeKDcq6Z1J86c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614chV3007004
X-loop: dm-devel@redhat.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"paolo.valente@linaro.org" <paolo.valente@linaro.org>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"fangguoju@gmail.com" <fangguoju@gmail.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "colyli@suse.de" <colyli@suse.de>,
	"jack@suse.czi" <jack@suse.czi>, "agk@redhat.com" <agk@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 09/11] block: remove unsed param in
	blk_fill_rwbs()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 10:12 PM, Christoph Hellwig wrote:
>> +extern void blk_fill_rwbs(char *rwbs, unsigned int op);
> You might want to drop the extern while you're at it.
> 

Good point.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

