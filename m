Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9EC210305
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:34:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-FJxPP6yJMGGUeKdncXTW1Q-1; Wed, 01 Jul 2020 00:34:38 -0400
X-MC-Unique: FJxPP6yJMGGUeKdncXTW1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C28819200C4;
	Wed,  1 Jul 2020 04:34:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0703D2B4A9;
	Wed,  1 Jul 2020 04:34:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7B1B1809543;
	Wed,  1 Jul 2020 04:34:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614YSqn006558 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:34:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0904FC747; Wed,  1 Jul 2020 04:34:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A1A7FED21
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:34:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B0978007B3
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:34:25 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-ykPmIWwhOdC9EB7nU_LkHQ-1; Wed, 01 Jul 2020 00:33:41 -0400
X-MC-Unique: ykPmIWwhOdC9EB7nU_LkHQ-1
IronPort-SDR: bQ5UpKCojvMl86Bsot4IdCmuvTrUPq7RA7GwL8Hp84b9IxueyxDk77jiZoRZflGTByHyh9AZSI
	WYYY+ji8UfGEb3xcPvkqjq0T7YMfd84Pt/r7CehsPmb8U6asMRklxmML961M490sHC0Alugmfe
	p6Eu+giEZ2bnCelPEnkaYcQqH1kIHWBClerXIQZkpuneUJ1TmFUUdIsrAhT+aDqt5hoGMbqROF
	shRbquza31FUexVE+CJizqNzyeSaJ3KM6ZqJHxrISf+stFb95woyUPQ1kbNzHyieiMM17AGlcv
	5nE=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="142695574"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:33:39 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:33:37 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:33:37 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 02/11] block: rename block_bio_merge class to block_bio
Thread-Index: AQHWTm8eLx51K1pAvUWCbdphnCEgcg==
Date: Wed, 1 Jul 2020 04:33:37 +0000
Message-ID: <BYAPR04MB4965637C75F740A3FD144470866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-3-chaitanya.kulkarni@wdc.com>
	<20200630051042.GB27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88d6a4b9-91e9-462d-85fd-08d81d77ec7f
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB71248BCB2EDC5942217F971A866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ItpEIIJQdlsxwi7HXKvnfyUmYPE9hOJ7xgwETXQtwpAp3G1HUF4dFGck+aDD4p2J6sl5lOIWUpnroqG5G1e/6V0TGO+avvi7poDNk5l9puD5HpkfV1TtK+kgHKSvEEU/alDtRKCERgR3cMAg7FIs2cKvDXnUA1VI2ynezOLYY469ZFD5srjZ/LSpk28NXne4Uw7u2FgyQ8COfXc+L4ULAHcIY+apK7tO1/Lzfj8CebBO2r/gYg6W+LvGai1FYY996C3/WQFmAwGQ+LJ4uqyJRaLNhOMCeQtzHtuovLiqvqH1eptWCmb7IRpYL725rWla
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(33656002)(4744005)(83380400001)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rEiQvRHOmdJ6nKCy3IZEWcTqgUOp5/BN5+C4miHFsZetQ8EmMm/xyGj/KWeJMtdkr4M89Qsg0Nj3Pus3ppV6ZC24RTQKCgsD+mMDJxM5kpiU3WTEF8sFnqqp3RDmeJQlsN4lUVluWph4z255CWsXLOI0b7dc6iHHgvVCr/lXQhtaTNqq7fj+9VvE79vm0Q5Udl7gnm6AolxvGLuqwEltbruus9zw+vw0DGy5JODUeeygKyD6ee/eBtXkSDzkqq2+04DCzQ3i/yLZ3zbkdcA/0o3/rgd8a1e/GYIOe1g7ALZrzncWCcXxn4vnlOdnFIQKasxITrcCK87wcL9mWCeYl8jG+ikLB8QVus3vY52MpulYhRxSSmK2yt8ReajqFyg7rlCn4squudsr6d+Eh6jA89enep1RtMU7LiAh1aFNOQ6mf3DELxbr8sDoe4NMqcthrgcExdlCsEbYM8r65V6u8myuaMOVqnaKfn7nZBkMz28=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d6a4b9-91e9-462d-85fd-08d81d77ec7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:33:37.7730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqZRcgOko27ofkO9je46epJ+pi9/uR9+p3DM2SQieAWPddjyy/j6MallhYUml5U27ZYRgX15B5DeH7U4ymevfKdBw05NhUD8iXyTla4XTWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614YSqn006558
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
Subject: Re: [dm-devel] [PATCH 02/11] block: rename block_bio_merge class to
	block_bio
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 10:10 PM, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:43:05PM -0700, Chaitanya Kulkarni wrote:
>> There are identical TRACE_EVENTS presents which can now take an
>> advantage of the block_bio_merge trace event class.
>>
>> This is a prep patch which renames block_bio_merge to block_bio so
>> that the next patches in this series will be able to resue it.
> The changes look good, but I'd merged it with the patches adding
> actual new users (which also look good to me).
> 
Okay, will merge it.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

