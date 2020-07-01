Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA0D2114B6
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 23:06:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-ftEsGbUaPO-YhOLYyPwblA-1; Wed, 01 Jul 2020 17:06:35 -0400
X-MC-Unique: ftEsGbUaPO-YhOLYyPwblA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36E8456B9C;
	Wed,  1 Jul 2020 21:06:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3DD760CD1;
	Wed,  1 Jul 2020 21:06:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54D001809543;
	Wed,  1 Jul 2020 21:06:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061L6I2V000648 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 17:06:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60CAC11921B5; Wed,  1 Jul 2020 21:06:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A32B11921B7
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:06:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96ED018A6660
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:06:15 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-40SxDXKMPAeixnZ3S79_jQ-1; Wed, 01 Jul 2020 17:06:09 -0400
X-MC-Unique: 40SxDXKMPAeixnZ3S79_jQ-1
IronPort-SDR: /oN31sv6dVaYKNFpktROyLxtt3BzE4N1dx/GyOoxOGo2E65rwWfOlrEZXOrJhnT5qDg3iG0bh8
	osusS6ggOQW6ZMzKM/jeNLm0UVp7fOnV79U2weoxUhompuUg69Ir643B9eD9eIBfK/McJBJ1JO
	Qc+81APduKWvxOBVgvXTItDOprmRZa4jEgmgH8KZYqu1UDiFsErSarD/EtPk5X7qayurQYmKcg
	JDr7gKKSB5VmvCsEKwdfkIM0khxtQEzcqSo5Q6TFWpk0b9LuZwlKQ1BUqeeUW03GU+X07mCzd+
	W2U=
X-IronPort-AV: E=Sophos;i="5.75,301,1589212800"; d="scan'208";a="250654112"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
	by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 05:06:05 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BYAPR04MB4328.namprd04.prod.outlook.com (2603:10b6:a02:ef::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 21:06:04 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 21:06:04 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 07/11] block: get rid of blk_trace_request_get_cgid()
Thread-Index: AQHWTm84FlMKKV+6yUGdr+czU/8ecQ==
Date: Wed, 1 Jul 2020 21:06:03 +0000
Message-ID: <BYAPR04MB4965A856D067354A9CCF4861866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
	<20200630051202.GD27033@lst.de>
	<BYAPR04MB49653ABB3E50A7D034BE8C68866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
	<20200701061640.GA28483@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1809be7e-8bc2-48c6-1ef1-08d81e0290c3
x-ms-traffictypediagnostic: BYAPR04MB4328:
x-microsoft-antispam-prvs: <BYAPR04MB432835F788BABE543AEE6872866C0@BYAPR04MB4328.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9LUVMOeXABcuwhRQR46O8IrNrXcB0QJM8KfMvvYmlIOBtR4wuTM2ARtLW1OthOP7fSAdZ/7boAROSoQP+KW+n8iv5ek3e+3nvucTMhgjvwZRNadDWoYIathD/FrN2rUYMNx/zepfTLZtJ5rjdVxLaP5VIE5MLnIKVAHde1olnTCxV+wlqmNxLOlPDmrJ8at9E6tEjM0BKfiLEXnIL6bK3kK3ls6TikiJr1HXgtWSSkHM7SqGWXlDq3X1eLKbpSi/OPj6pcXXCBl+N8fYcsu+s9q6PB9tYvmcOKoHs69L9It7pDOLGLq6WExjJ+r7KvutINbLDKnKHif9deYRMf8sa3la8s+Wr+GBJeonpE9xlItrV//YrRhs7R9X4FY264u1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(52536014)(26005)(55016002)(6916009)(7416002)(54906003)(8936002)(33656002)(7696005)(71200400001)(83380400001)(66556008)(8676002)(64756008)(66476007)(66446008)(498600001)(9686003)(2906002)(86362001)(76116006)(53546011)(5660300002)(66946007)(4744005)(6506007)(4326008)(186003)(26583001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: V/8t/9mTn1PWz1lgd9TG8N/cWbPZhMWq5ZtoDgt+OjxZBa3oCX4c5hiwI98NzyfVltPVIFGWge40q+rkiQeyTp/4U2x/Yy+GN5/VPc0vJB4B7OgLobOpQAVxqc0s8FDsMsEZ++FAqx2tizhnid6iEob3tkL0E9YnnZ53JYXJy2pkOr3/sqpfLdhcknbUw0Scruy8CPorIBrpSPZDBjX3M+lZ4kxANDV2WbXfpEOJyiIT+vWQ8AD0lFiwJg3Qb93i4Z6Jp1Ub0rs/XveVWLMhdiuy9Xy8oAWQsjBZ79F3/YZm/cZwraTKrv03w3H6k6x5nUgLeCxMdISHxAQAYtJ6sLESgYvaJRzPntuYU1VeOfYTkHkdulub2/xqXVOZ17XpK1DFxWsL08NIPXVtsOMvv0s9p/IwjH/PXHRxNgAUn4FaVSgCpFj2FTMiK91UT2QMWoqwEt8vJk3/P6UnTmLz/PRiqvpw5RpmPqtZzaBlknJSB5c9VKvVnkdAac12fGxm
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1809be7e-8bc2-48c6-1ef1-08d81e0290c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 21:06:03.8130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +TRhvaw6YKjEc6oN22jOT7QZ/vcZwp7aszPITQJaKFKI25UXAvOPWvHErDYtxKc7xHjTsQrHvwhNCIU9p5FPLMkbALutjjrJXGoHLjZQH6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4328
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061L6I2V000648
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
Subject: Re: [dm-devel] [PATCH 07/11] block: get rid of
	blk_trace_request_get_cgid()
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

On 6/30/20 11:16 PM, Christoph Hellwig wrote:
> On Wed, Jul 01, 2020 at 04:38:06AM +0000, Chaitanya Kulkarni wrote:
>> On 6/29/20 10:12 PM, Christoph Hellwig wrote:
>>> On Mon, Jun 29, 2020 at 04:43:10PM -0700, Chaitanya Kulkarni wrote:
>>>> Now that we have done cleanup we can safely get rid of the
>>>> blk_trace_request_get_cgid() and replace it with
>>>> blk_trace_bio_get_cgid().
>>> To me the helper actually looks useful compared to open coding the
>>> check in a bunch of callers.
>>>
>> The helper adds an additional function call which can be avoided easily
>> since blk_trace_bio_get_cgid() is written nicely, that also maintains
>> the readability of the code.
>>
>> Unless the cost of the function call doesn't matter and readability is
>> not lost can we please not use helper ?
> I think readability is lost.  I'd much rather drop the q argument
> from blk_trace_request_get_cgid and keep the helper, as it pretty
> clearly documents what is done.
> 
Okay I'll add to V2.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

