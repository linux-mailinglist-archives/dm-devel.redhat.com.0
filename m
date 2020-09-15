Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DF801269AE6
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 03:10:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-WidSKSoaOAiy4Kfvahj1hA-1; Mon, 14 Sep 2020 21:10:46 -0400
X-MC-Unique: WidSKSoaOAiy4Kfvahj1hA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6B761007460;
	Tue, 15 Sep 2020 01:10:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B73E75DC1B;
	Tue, 15 Sep 2020 01:10:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CC21832FF5;
	Tue, 15 Sep 2020 01:10:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F1A6Is008166 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 21:10:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A87F110C577; Tue, 15 Sep 2020 01:10:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73599110C574
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 01:10:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA65803ACC
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 01:10:04 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-439sItuMOdOCT2OhtEFhKQ-1; Mon, 14 Sep 2020 21:09:59 -0400
X-MC-Unique: 439sItuMOdOCT2OhtEFhKQ-1
IronPort-SDR: PXTazu/HhwydpTBSFv/U8ByZxxZNKZYa5JrZrv3tghME9DkBoipXZaCZ4qvn546xN+aAq8AM4D
	Gp8C6nT3cobygyS6BiTwGprbkcqnWWiVVrhG3YlBzlfaU6U/eDPxLSJ1tOrAXbgdoOf0p8tq2b
	YF7WPCWtiTD3yOG5rtbPmDnCPwIdAiaD74FvmI6hp3XKdhwRHBB0xLixtdtH3/x2iKu8cqFYU9
	d02eytIcr+ElZTYoZqTNRSHgIEpVce7ABTDzXlIlWLDsgIqvoS2sXyk19rUG8MI3odTkCWQuPh
	INY=
X-IronPort-AV: E=Sophos;i="5.76,427,1592841600"; d="scan'208";a="151727879"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
	by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 09:09:57 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0567.namprd04.prod.outlook.com (2603:10b6:903:b1::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Tue, 15 Sep 2020 01:09:55 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Tue, 15 Sep 2020 01:09:55 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Tue, 15 Sep 2020 01:09:55 +0000
Message-ID: <CY4PR04MB37510A739D28F993250E2B66E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200914150352.GC14410@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e83c05d-1e87-4ed7-1043-08d859140f06
x-ms-traffictypediagnostic: CY4PR04MB0567:
x-microsoft-antispam-prvs: <CY4PR04MB0567A6DFE9F0E0749FB98B98E7200@CY4PR04MB0567.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 78B41B6maDjGgBXvRZolzcCwZTCWQZxUgH6ibJf81i41scNF6GD7leey2DB72oxB6qbPAuZsI/c/xmLXoo2Lv17xab0+2ZNv3LhWPiixdAtm/4w71F4/24Q/K7sxdZT/ByKkMhmbEciSVFkwUyC4RuJKLMnkjcSYQQ79SvzqRTbw6RxvX6CkKTtTT2daxWPyU1CruNm9jDldZEBMExmL9bq7Z6c3oVJfTVJQbamC1i3oHoHdt9HJa7JsdVJOcob/FNXu9woJTL9rFTzXPJEYUTOH1xHSwkzFNka4BTQbIiZzaHZxpDC3iSn2N+IZmYYb7vZn8npYhjoVn8w7wQ5D9DRKuz3ByaWJ25tux0JpzxQRE9cqkk+CRXWIfH/7kToq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(6916009)(71200400001)(186003)(8676002)(83380400001)(54906003)(4326008)(52536014)(478600001)(7696005)(9686003)(33656002)(316002)(6506007)(55016002)(66946007)(66446008)(64756008)(5660300002)(91956017)(86362001)(76116006)(66476007)(8936002)(53546011)(66556008)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: u7b8u3byQn65o1yTR2z2gcRzZV2CkGfEEHD318nbEA6ID0LP4t9MT1YDBkiU0FQJ6eufbxS8ELUgmKJUQabQRiMeWfQMUwVCG4p+tI4V1wdt0xpTCpd/1kNAhoqIJUweS3WZ+0bvGCA9eBU1s6xOnt8Q1wEkSw8R2QWa7E5geJG/sHE43ErpQ5k4j/LavT58Ays0GIrPMuje71UQftmbAuOd7Zlvp9552uaVOll6BBI0e58nAb2gYBxVc6mzjTmCujtNdOzOb94nctYsMDitFvMX5OYtkDnxpUvd56y3kMx+8j8I896/1h1ioqAaWhkYDLmRM2erB/KxGK/aauYeSok6HDS+lhsKMTFcmc6K/Hr15C4CQHtn875MzeU+Zi9ydJZZGe1BtWAalE/k1+MUzMPs+R5GcztJZHOnFp7iC5rPTrdNilfxu9xiWGzy0Ayls9FgyGywzH3H+V+Cgio5DVZOwmDZcKPd6J+LokzA0vDpyzCCnMRrHPM5HjMhzmoxNVZ3eiq0NJYRH7BzGKH6TxvucUUyC/Rcj9n7nAUhZA59tRidh8ZxM1xB9B7Pnv31DbCplKaME04EoRC4zAyIuLU7J3ti9e4jm/2to3lZYW+oDIyJJF39YqmL1qGDIsBKviJh+/USMu9wNp76HKcogUlhwL/wKeVoRdLhvXULKGBB5DUjRAOFzHQZbJlv57ohxrBTLdhL5QCU91qgjc8g5Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e83c05d-1e87-4ed7-1043-08d859140f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 01:09:55.8629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nc+zHhj8ZqaRB1O8DWEkDwSRJO/Jz5ZtI4bSitw6e07PpN/zOmSaiazaJji9V8fok2WHFQ7oJ7gbVb1xtdDTrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0567
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08F1A6Is008166
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2020/09/15 0:04, Mike Snitzer wrote:
> On Sun, Sep 13 2020 at  8:46pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/09/12 6:53, Mike Snitzer wrote:
>>> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
>>> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
>>> those operations.
>>>
>>> Also, there is no need to avoid blk_max_size_offset() if
>>> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
>>>
>>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>>> ---
>>>  include/linux/blkdev.h | 19 +++++++++++++------
>>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>> index bb5636cc17b9..453a3d735d66 100644
>>> --- a/include/linux/blkdev.h
>>> +++ b/include/linux/blkdev.h
>>> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>>>  						  sector_t offset)
>>>  {
>>>  	struct request_queue *q = rq->q;
>>> +	int op;
>>> +	unsigned int max_sectors;
>>>  
>>>  	if (blk_rq_is_passthrough(rq))
>>>  		return q->limits.max_hw_sectors;
>>>  
>>> -	if (!q->limits.chunk_sectors ||
>>> -	    req_op(rq) == REQ_OP_DISCARD ||
>>> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
>>> -		return blk_queue_get_max_sectors(q, req_op(rq));
>>> +	op = req_op(rq);
>>> +	max_sectors = blk_queue_get_max_sectors(q, op);
>>>  
>>> -	return min(blk_max_size_offset(q, offset),
>>> -			blk_queue_get_max_sectors(q, req_op(rq)));
>>> +	switch (op) {
>>> +	case REQ_OP_DISCARD:
>>> +	case REQ_OP_SECURE_ERASE:
>>> +	case REQ_OP_WRITE_SAME:
>>> +	case REQ_OP_WRITE_ZEROES:
>>> +		return max_sectors;
>>> +	}
>>
>> Doesn't this break md devices ? (I think does use chunk_sectors for stride size,
>> no ?)
>>
>> As mentioned in my reply to Ming's email, this will allow these commands to
>> potentially cross over zone boundaries on zoned block devices, which would be an
>> immediate command failure.
> 
> Depending on the implementation it is beneficial to get a large
> discard (one not constrained by chunk_sectors, e.g. dm-stripe.c's
> optimization for handling large discards and issuing N discards, one per
> stripe).  Same could apply for other commands.
> 
> Like all devices, zoned devices should impose command specific limits in
> the queue_limits (and not lean on chunk_sectors to do a
> one-size-fits-all).

Yes, understood. But I think that  in the case of md, chunk_sectors is used to
indicate the boundary between drives for a raid volume. So it does indeed make
sense to limit the IO size on submission since otherwise, the md driver itself
would have to split that bio again anyway.

> But that aside, yes I agree I didn't pay close enough attention to the
> implications of deferring the splitting of these commands until they
> were issued to underlying storage.  This chunk_sectors early splitting
> override is a bit of a mess... not quite following the logic given we
> were supposed to be waiting to split bios as late as possible.

My view is that the multipage bvec (BIOs almost as large as we want) and late
splitting is beneficial to get larger effective BIO sent to the device as having
more pages on hand allows bigger segments in the bio instead of always having at
most PAGE_SIZE per segment. The effect of this is very visible with blktrace. A
lot of requests end up being much larger than the device max_segments * page_size.

However, if there is already a known limit on the BIO size when the BIO is being
built, it does not make much sense to try to grow a bio beyond that limit since
it will have to be split by the driver anyway. chunk_sectors is one such limit
used for md (I think) to indicate boundaries between drives of a raid volume.
And we reuse it (abuse it ?) for zoned block devices to ensure that any command
does not cross over zone boundaries since that triggers errors for writes within
sequential zones or read/write crossing over zones of different types
(conventional->sequential zone boundary).

I may not have the entire picture correctly here, but so far, this is my
understanding.

Cheers.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

