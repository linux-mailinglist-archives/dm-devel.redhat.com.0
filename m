Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 68260209C04
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 11:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593077971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6eL+6FSmIhUIYkkeF+42by55pzMZH/YrYwqTh2IMwPg=;
	b=SZrLw73J2jnFN2+4z0SQe5vdYX7DXrFq7PFDdP73+FyO7TmdlLSu4UixrBBWNisGQ+841X
	TAhG2JKovVeQ90Ikfs+lEkXuLORtnUBxV6AJ3EbsDrqy1gimu7uw4xXNG6zHFAOfm/fKfU
	KkMpPTEphgnEIGbpuvj51OVWr4NdORQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-fo4fDC6YMQ29Y4mM6n5Eow-1; Thu, 25 Jun 2020 05:39:28 -0400
X-MC-Unique: fo4fDC6YMQ29Y4mM6n5Eow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D7D805EE8;
	Thu, 25 Jun 2020 09:39:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA7F19D61;
	Thu, 25 Jun 2020 09:39:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 428E7833BD;
	Thu, 25 Jun 2020 09:39:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OMkKxO010335 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 18:46:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04062017F06; Wed, 24 Jun 2020 22:46:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CADC0202A942
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 22:46:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC725800394
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 22:46:14 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-C4UNo9JePCmhn5KOBkoShw-1; Wed, 24 Jun 2020 18:46:10 -0400
X-MC-Unique: C4UNo9JePCmhn5KOBkoShw-1
IronPort-SDR: 74PQLI+uqz1xA0twDFY5nrzAQSFh8pJUpSNUYaLI6cuJFaneeG55E6nljBHR9vqsRx9ZT+jdX8
	uzbgplUjnEl1e2cXlwWtZ4L9OnsV4VSwY2wP8zYobDuAwfmNeSddwKPTZ6w4FlhxkofgYP/36e
	361Jzw5DcIQ83l2Nm/vNzN9mivm8uqvBfxDY6QeL3RmxOGGuefm0Ug/n0IssmqggBfXoQRJKA7
	/weN1UwQVueUkvz3FPq1WLzghC3gv3wXbMKFmlNMiIOLIUwgapsmPrRPxKmWsZoROGpIXLaqps
	Qx4=
X-IronPort-AV: E=Sophos;i="5.75,276,1589212800"; d="scan'208";a="141083698"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jun 2020 06:45:04 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BYAPR04MB5688.namprd04.prod.outlook.com (2603:10b6:a03:104::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Wed, 24 Jun 2020 22:45:02 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.020;
	Wed, 24 Jun 2020 22:45:02 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH RFC] block: blktrace framework cleanup
Thread-Index: AQHWSdd4UnyRRkLaf0OG0GWCqlwTUQ==
Date: Wed, 24 Jun 2020 22:45:02 +0000
Message-ID: <BYAPR04MB49653212CE32249C65C0A7F486950@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200624032752.4177-1-chaitanya.kulkarni@wdc.com>
	<20200624064820.GA17964@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2da5678c-a5a1-4c07-896a-08d818903bbc
x-ms-traffictypediagnostic: BYAPR04MB5688:
x-microsoft-antispam-prvs: <BYAPR04MB5688F1049F95C98C268A176A86950@BYAPR04MB5688.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j+4MxcY8WnjKsKUmBlapaUWawqEinfy/gEFO/vNGPDPwD/kP7uu14AqUgbWYf2eX31WSRDF/EO+6+7uKn0pjGWX8LhR+0x92EgWlborF8GUtsi7A4oaN0MCE8Ql4H1wfhPUrnTodW1B5LDkUPh8YxzVzKwS13C85bMDLKq/3I/ErLL8txTEBAJiKwlsZdI6mQ/hU619q2gHsqWmQzNZc7JeNyv5X4Wk3Vva4ANCI1UZbc4iKuLjjfrtlegt9ofM4vMOQhe3/byglQSqFv5+eOqeVZ/mQu6ED0ioRmdeEmapEuElrK75C72PFNuQNeCLyzQ4+SDwg1qi0r8akcSD7aw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(52536014)(6506007)(53546011)(6916009)(186003)(86362001)(76116006)(5660300002)(66946007)(83380400001)(26005)(7416002)(66476007)(66556008)(2906002)(33656002)(64756008)(478600001)(66446008)(4326008)(8936002)(8676002)(9686003)(54906003)(55016002)(7696005)(71200400001)(316002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: xRH6Hl8/x2ZZfWilyMV6N26FwonUzrqzknUQKEb3Roqkv7brqIg05UlRFM+Aqq8WSECPQJz00mbEBBEq8ZEDMvX0m42WlqgEIRgvmQ5mTT3MNrOa/DEoo2kcY8LrPdRCswFsMoZsoKYXv3gW/4noY7dhqNLodxGHpx/bN1+MRCcqoNWKvoRPaPICZbMxtBG8TPxf1H8HEn4XuZeDu5C6uddcghlTn3kLjHE6z4VZuOGuq1YolmCPcyowiC2+cmm4h0hidOTtZwlkWYFv8xHZPcP8KYzJmUcQ2t+xEgVkic3/Ew6SEC1uOshqTemDUEFy5MUqPHevbI+7SHQYkuY58frr/2bJXIgHvcIXN9YOir4U+oSmezCxozPCtRLC9ycxyEdNdgRwFcaOJnJudihbcTEl0GX4ola+HVZjA9gPl4eHRBpJjZ9fe4rXTNgb3BWs3lseHhaoyN5nrO3lWHZJDd4usYGiT3NvBp+980PrjHA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da5678c-a5a1-4c07-896a-08d818903bbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 22:45:02.7545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTyo8GSALl26+0AKJVSJs4rKDBoz9rSaWieJTbPZS39R8+uKq/9ivDr1ObZk+HasXQP/YByN3KaH9i9zwiABF9nJBi2ZNzrAHZXP+4jrA+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5688
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05OMkKxO010335
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 25 Jun 2020 05:38:56 -0400
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"kbusch@kernel.org" <kbusch@kernel.org>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH RFC] block: blktrace framework cleanup
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

On 6/23/20 11:48 PM, Christoph Hellwig wrote:
> 
> 
> On Tue, Jun 23, 2020 at 08:27:52PM -0700, Chaitanya Kulkarni wrote:
>> There are many places where trace API accepts the struct request_queue*
>> parameter which can be derived from other function parameters.
>>
>> This patch removes the struct request queue parameter from the
>> blktrace framework and adjusts the tracepoints definition and usage
>> along with the tracing API itself.
> 
> Good idea, and I had a half-ready patch for this already as well.
> 
Well, I sent out the reply to your suggestion didn't get any response so 
I decided to send a patch, if you want we can merge it I'll keep you as 
an author for the right reasons.
> One issue, and two extra requests below:
> 
> 
>>   	if (bio->bi_disk && bio_flagged(bio, BIO_TRACE_COMPLETION)) {
>> -		trace_block_bio_complete(bio->bi_disk->queue, bio);
>> +		trace_block_bio_complete(bio);
> 
> This one can also be called for a different queue than
> bio->bi_disk->queue, so for this one particular tracepoint we'll need
> to keep the request_queue argument.
> 
Yes, we should.
>> diff --git a/block/blk-mq-sched.c b/block/blk-mq-sched.c
>> index fdcc2c1dd178..a3cade16ef80 100644
>> --- a/block/blk-mq-sched.c
>> +++ b/block/blk-mq-sched.c
>> @@ -409,7 +409,7 @@ EXPORT_SYMBOL_GPL(blk_mq_sched_try_insert_merge);
>>   
>>   void blk_mq_sched_request_inserted(struct request *rq)
>>   {
>> -	trace_block_rq_insert(rq->q, rq);
>> +	trace_block_rq_insert(rq);
>>   }
>>   EXPORT_SYMBOL_GPL(blk_mq_sched_request_inserted);
> 
> As a follow on patch we should also remove this function.
> 
Okay will make it is a 2nd patch.
>>   	}
>>   
>>   	spin_lock(&ctx->lock);
>> @@ -2111,7 +2111,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>>   		goto queue_exit;
>>   	}
>>   
>> -	trace_block_getrq(q, bio, bio->bi_opf);
>> +	trace_block_getrq(bio, bio->bi_opf);
> 
> The second argument can be removed as well.  Maybe as another patch.
Okay I'll make it in a 3rd patch.
> 




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

