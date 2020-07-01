Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 267E6210315
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:45:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-tkhd3DEiOQSYNBnrddk9Xw-1; Wed, 01 Jul 2020 00:45:49 -0400
X-MC-Unique: tkhd3DEiOQSYNBnrddk9Xw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8239F107ACCD;
	Wed,  1 Jul 2020 04:45:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4D460E3E;
	Wed,  1 Jul 2020 04:45:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7217E1809543;
	Wed,  1 Jul 2020 04:45:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614jRM8008113 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:45:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E937EFC739; Wed,  1 Jul 2020 04:45:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3BC42EF94
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:45:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52015858EE9
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:45:24 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-5mbIAVClNWCc5DHRAEximw-1; Wed, 01 Jul 2020 00:45:17 -0400
X-MC-Unique: 5mbIAVClNWCc5DHRAEximw-1
IronPort-SDR: QA5Jw3KQk3zjGJKg3C9ANi/ikEbyWtonTQuHdaOkMJx98rovTrT1KeOQ/iVqRZ5eOJOsKw3AnZ
	HNEKrcHD5TlnCPkp6b7XZOa5eLFFvOF/AuOqr2WMXaSr90EUvfyALeDooDu4VJYDklUu4lkB85
	hqvf9I9ENUI9cnM0fqX2yFEQkReIw7umAJylB8gXwHXyD5hrejhIUhAKOSjunH/JrWE2UVrnZL
	K1gpx+gapiYjBigS/IS3gPkHSG7TDzJDInpuVs2C8XYAeXC0EzZ6e0J4wlxaX4dfN5B8qf54Wd
	UhE=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141341625"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:45:06 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:45:03 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:45:03 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 10/11] block: use block_bio class for getrq and sleeprq
Thread-Index: AQHWTm9LvGU76q0unUybnpt+xj1KpQ==
Date: Wed, 1 Jul 2020 04:45:03 +0000
Message-ID: <BYAPR04MB4965E849D99120B59011CEF5866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
	<20200630051332.GG27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 044c2dbf-bbc5-46cb-013d-08d81d798520
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB7124B1FD9FF9B8B3E1300E2B866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ci0D5I3VYMobN1/+lkENDXHzofKDM5bgVg8yEVlIlIjK040mKTo+6OJtlWVPPghQjMETY7Fx4iiMiFA6yEuZYLcIgyrlfIpMlIDcOQlEb12Omc7qQ7Y+eJVeYXKsYSTay2GyLcnrYXsPWxH1CwudWKpjPzHMyUgvrk9kg0nAMIWOEzzwRyG7ibGmSxt8kyavj2bDzo8ZOx/eA4Um76rAlj9csRIfWeCuGNR2V+fMpj2p8OMhJhIN5FGuGv7DvqtHg9r71l6AIv9bygDb9g62dxR1YT5ZHBxGXeFW27dNyQuVV8skdhGHM/+cc9VWJ80ZVSRusnwJRMSwHpChElFQYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(33656002)(4744005)(83380400001)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: GZ+A6Utax0lQCf/oBma9DK0wD7Z/VTsJ0TydVxMcK4cGyfgoWvXIVDbitid97br7c+Ljq4KkossdqQLh9f+PmYuK5ibwE44LTRoerZ2rC4A1eaSMMhmveB6bQDwKYKmXfb7pmSHHjiiAet2q++DS7r4cCGDDQtorlpWlb4LV0JWCyrIsBluDCSk22ofu4le+76F/jusP3GD1Egt74OHOD9PNwws5L2SIQzxL/GR3ooQx1cwod6EYxxSp2/mycpUqJnvvnBHGxb66Z53Yv8rvBRnp8zexRW28LwB7tU360ILXAxXxls47XcZSoSm19JYxbj2zGXkszcRDA2AzJUM+wBp55sHL3Zrh9nKRMZ87kzNdC5k1h7TJnFsTkjbKpyl2vTkIbgaqboldZiVnsRQX8es2DCxcEYjkBbj3n2qnnDJHBZYvpSeLTW4ag+aEM4Z8Lk4JblSfZPMoOvxploUk10KYPXR19d3xcBKZZzs3aiM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044c2dbf-bbc5-46cb-013d-08d81d798520
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:45:03.2691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QiYhxFY3ghqDClEPerInmD2HEEEcrTDhCbxanL93sjAAsZORgsh/f62K+4YpdvlBFvSaYkF6BPupnwLtFLg4uqLm4EMV12he+oK6fWtM6y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614jRM8008113
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
Subject: Re: [dm-devel] [PATCH 10/11] block: use block_bio class for getrq
	and sleeprq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 10:13 PM, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:43:13PM -0700, Chaitanya Kulkarni wrote:
>> The only difference in block_get_rq and block_bio was the last param
>> passed  __entry->nr_sector & bio->bi_iter.bi_size respectively. Since
>> that is not the case anymore replace block_get_rq class with block_bio
>> for block_getrq and block_sleeprq events, also adjust the code to handle
>> null bio case in block_bio.
> To me it seems like keeping the NULL bio case separate actually is a
> little simpler..
> 
> 

Keeping it separate will have an extra event class and related
event(s) for only handling null bio case.

Also the block_get_rq class uses 4 comparisons with ?:.
This patch reduces it to only one comparison in fast path.

With above explanation does it make sense to get rid of the
blk_get_rq ?






--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

