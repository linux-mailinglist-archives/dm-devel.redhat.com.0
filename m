Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CF7A1269D0A
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 06:22:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-pkV1IUTfMyG7EeFzn2yVKw-1; Tue, 15 Sep 2020 00:22:35 -0400
X-MC-Unique: pkV1IUTfMyG7EeFzn2yVKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A24AB1005E65;
	Tue, 15 Sep 2020 04:22:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F2B7512A;
	Tue, 15 Sep 2020 04:22:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93F2E1833000;
	Tue, 15 Sep 2020 04:22:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F4MAnp029887 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 00:22:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B820E1004154; Tue, 15 Sep 2020 04:22:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2805100417A
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:22:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49660858284
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:22:08 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-doPyBMAFMXSw_x-iKIt8AQ-1; Tue, 15 Sep 2020 00:21:57 -0400
X-MC-Unique: doPyBMAFMXSw_x-iKIt8AQ-1
IronPort-SDR: IWfgP9Fcr6GRtPdhtRmsL3APAvOB7Ly8jHU9XRK0Mcl9mxeDXOC0fr43p0CG3ilb4ugr7ePxUE
	9f75rbcG4zppIhGL4T97imXFGbgxxrC8aiCmBaG0m9AVwrAbkXXSShoSj+eXg9QZVH0uAuygTA
	QoohD/1Rm5Vp7dcKWvzQmQDefIy9Eh7VPLpKHTUWcWaRikuvfM7whCgM/WnEL7q4KOa7Q6TRWy
	x+vOylsrJjs6abSmw0tPAix7fp9YX+jPkJOpFNOXIMuZa/PNEhzBLR0vdVeKxKIg0bBmXzi8f0
	o8k=
X-IronPort-AV: E=Sophos;i="5.76,428,1592841600"; d="scan'208";a="257020508"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
	by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 12:21:55 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB3750.namprd04.prod.outlook.com (2603:10b6:903:e2::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17;
	Tue, 15 Sep 2020 04:21:54 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Tue, 15 Sep 2020 04:21:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Tue, 15 Sep 2020 04:21:54 +0000
Message-ID: <CY4PR04MB3751822DB93B9E155A0BE462E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200914150352.GC14410@redhat.com>
	<CY4PR04MB37510A739D28F993250E2B66E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bce67ca5-377d-4970-dc26-08d8592ee07f
x-ms-traffictypediagnostic: CY4PR04MB3750:
x-microsoft-antispam-prvs: <CY4PR04MB3750A2D0283BAD0D4C9EE2F1E7200@CY4PR04MB3750.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHvZbGJic3MGFa4W4f/iiJHI1b+obM2XERRmY98W8Cde4rrT+zirzxVIN+Iy5/95IVAmE4Cf7SQl4uhLmX4d1ERdycrW8276Ad0KNB+v3zvZmQAv429/cDzoEHhKm4lB/XXr07K29vWxC81YfRiuzB+a4vkY/XHen13nmwR4yiI70Low6jmJUC6VNBxZk3AH1fu+cKqzxIKs7CT5CpF3ro162kYUKt71pfHiE2SI7WM/uVF3fxzev8GPQZx40KxBKgWB+DDuh4TNRkk1HEYj9pdfL8/G8vdxESoPWmuzkPbJr9DN6ueY5sM0R94uVDn7Mdkr/H1HpGlxnG0D4SSBjnBvwYso+9GfpMLXJS85u0ljmQMggk1vvgBvh4oyn5pv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(54906003)(53546011)(186003)(478600001)(2906002)(6506007)(8936002)(86362001)(83380400001)(55016002)(52536014)(316002)(7696005)(5660300002)(33656002)(6916009)(4326008)(71200400001)(66946007)(76116006)(66446008)(91956017)(66556008)(9686003)(8676002)(66476007)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: YX8VS30Gn7wARKBFecsYHLrbIkFzgj6FHxBoBBhKMc7SqyffAWShEBpAEjo/bDsY/I4B5altv4RcvblxY3rXehPQTFtVAEcOiQXAAIgLk8qFAuxgAWShVAVnGzX7les4/WvrxFNplHDqNJQKrV9mTmpVU2AaHQrw/wT4oD6OGoUzWg3yh6GYhb5PZRSeG320zb+zEzFRLcUEFSrvpuI9DnYtWscthskry68VvC59TjyPtk7UAfPhmhawDVMltO131C6qYvvLo4Ga9Q56TV0anAstwCA5U0k60j2XPdpY7rVXbBJEWlIVxyX1K2k0pD/9GB7eEi8KLrbM7eN7bS4q9DQNviVJgvVzgwCw5fJjxUfjkB69dNKzf5EJoUw0nOp8j+6aNLi86YqKJudLCOuMH5GD9xxSC0EAYSIYBavQVC1D5s+xWJ9s86QUmVSZa9qWaJolD0s7BR7d6UmcaM/WZvUoJKaWGm3woVJx2Gd6inBnJswcobk0AaKLBCA5YUGNrqi4NDFC3jO+GYXEJcCXtFkQVMUvS0Khsed2+MjhiGRmJhA04+IWt9QqXR6G/Jad4tVLeCacaralQkt/8cK/BYxU8HirnOGfObx0tLF/MoihZmFkw3KgqHqhVhyL4rTu7WpJjL+VgqX4HZZ5BiTJ6CAwarqswbNcN3OE01+XIwz2SvaXMg2MQmVy7IiQXToc0zASq7v/R1VzDO0Iw+EtRw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce67ca5-377d-4970-dc26-08d8592ee07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 04:21:54.1459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ji0ue+4waCSS9GaYSrQMb0EooEo+D5+QswFherHo9trX9pFiwRukjwVxH/Jd/2/8Hzu7RZHl3qH8MfdsnvKfbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3750
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08F4MAnp029887
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: fix blk_rq_get_max_sectors() to
 flow more carefully
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2020/09/15 10:10, Damien Le Moal wrote:
> On 2020/09/15 0:04, Mike Snitzer wrote:
>> On Sun, Sep 13 2020 at  8:46pm -0400,
>> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>
>>> On 2020/09/12 6:53, Mike Snitzer wrote:
>>>> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
>>>> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
>>>> those operations.
>>>>
>>>> Also, there is no need to avoid blk_max_size_offset() if
>>>> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
>>>>
>>>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>>>> ---
>>>>  include/linux/blkdev.h | 19 +++++++++++++------
>>>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>>> index bb5636cc17b9..453a3d735d66 100644
>>>> --- a/include/linux/blkdev.h
>>>> +++ b/include/linux/blkdev.h
>>>> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>>>>  						  sector_t offset)
>>>>  {
>>>>  	struct request_queue *q = rq->q;
>>>> +	int op;
>>>> +	unsigned int max_sectors;
>>>>  
>>>>  	if (blk_rq_is_passthrough(rq))
>>>>  		return q->limits.max_hw_sectors;
>>>>  
>>>> -	if (!q->limits.chunk_sectors ||
>>>> -	    req_op(rq) == REQ_OP_DISCARD ||
>>>> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
>>>> -		return blk_queue_get_max_sectors(q, req_op(rq));
>>>> +	op = req_op(rq);
>>>> +	max_sectors = blk_queue_get_max_sectors(q, op);
>>>>  
>>>> -	return min(blk_max_size_offset(q, offset),
>>>> -			blk_queue_get_max_sectors(q, req_op(rq)));
>>>> +	switch (op) {
>>>> +	case REQ_OP_DISCARD:
>>>> +	case REQ_OP_SECURE_ERASE:
>>>> +	case REQ_OP_WRITE_SAME:
>>>> +	case REQ_OP_WRITE_ZEROES:
>>>> +		return max_sectors;
>>>> +	}
>>>
>>> Doesn't this break md devices ? (I think does use chunk_sectors for stride size,
>>> no ?)
>>>
>>> As mentioned in my reply to Ming's email, this will allow these commands to
>>> potentially cross over zone boundaries on zoned block devices, which would be an
>>> immediate command failure.
>>
>> Depending on the implementation it is beneficial to get a large
>> discard (one not constrained by chunk_sectors, e.g. dm-stripe.c's
>> optimization for handling large discards and issuing N discards, one per
>> stripe).  Same could apply for other commands.
>>
>> Like all devices, zoned devices should impose command specific limits in
>> the queue_limits (and not lean on chunk_sectors to do a
>> one-size-fits-all).
> 
> Yes, understood. But I think that  in the case of md, chunk_sectors is used to
> indicate the boundary between drives for a raid volume. So it does indeed make
> sense to limit the IO size on submission since otherwise, the md driver itself
> would have to split that bio again anyway.
> 
>> But that aside, yes I agree I didn't pay close enough attention to the
>> implications of deferring the splitting of these commands until they
>> were issued to underlying storage.  This chunk_sectors early splitting
>> override is a bit of a mess... not quite following the logic given we
>> were supposed to be waiting to split bios as late as possible.
> 
> My view is that the multipage bvec (BIOs almost as large as we want) and late
> splitting is beneficial to get larger effective BIO sent to the device as having
> more pages on hand allows bigger segments in the bio instead of always having at
> most PAGE_SIZE per segment. The effect of this is very visible with blktrace. A
> lot of requests end up being much larger than the device max_segments * page_size.
> 
> However, if there is already a known limit on the BIO size when the BIO is being
> built, it does not make much sense to try to grow a bio beyond that limit since
> it will have to be split by the driver anyway. chunk_sectors is one such limit
> used for md (I think) to indicate boundaries between drives of a raid volume.
> And we reuse it (abuse it ?) for zoned block devices to ensure that any command
> does not cross over zone boundaries since that triggers errors for writes within
> sequential zones or read/write crossing over zones of different types
> (conventional->sequential zone boundary).
> 
> I may not have the entire picture correctly here, but so far, this is my
> understanding.

And I was wrong :) In light of Ming's comment + a little code refresher reading,
indeed, chunk_sectors will split BIOs so that *requests* do not exceed that
limit, but the initial BIO submission may be much larger regardless of
chunk_sectors.

Ming, I think the point here is that building a large BIO first and splitting it
later (as opposed to limiting the bio size by stopping bio_add_page()) is more
efficient as there is only one bio submit instead of many, right ?


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

