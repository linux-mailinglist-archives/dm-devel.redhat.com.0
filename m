Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9D68C2699B0
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 01:29:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ehzTQDA1OwqGfZ8ZJTd_LQ-1; Mon, 14 Sep 2020 19:29:32 -0400
X-MC-Unique: ehzTQDA1OwqGfZ8ZJTd_LQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BEDF425CD;
	Mon, 14 Sep 2020 23:29:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C40B87513A;
	Mon, 14 Sep 2020 23:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEDD11832FE6;
	Mon, 14 Sep 2020 23:29:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ENSwiU030595 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 19:28:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79542AF987; Mon, 14 Sep 2020 23:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73DE3ADF89
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 23:28:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D82C5800883
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 23:28:55 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-348--CjfloW7MLW28RVa3ssnuA-1; Mon, 14 Sep 2020 19:28:51 -0400
X-MC-Unique: -CjfloW7MLW28RVa3ssnuA-1
IronPort-SDR: HJ72lekkjC3w+lNIE18vrjcp932yaAbpDkBpRSCZocEiajGv7lpRuhE3W40X9j1We2x6T7HFPe
	lzyXeMEieilLP30oounVNDFzQxzrT23OdtFEmN9c6rRlDJFWzweNE6URizLTGJY6wPBjAD3pej
	mm0owS4V6M0aexIMCT1DMJckaS3S/ba+o+9/MFXA0tLC51enM5Tdv7Ojekk6a0woC2QeCNlgfs
	gq9Zkzl5jtDHhjZprtFYRgtDDloCoLbSYDIqsHck5DWpOvdxX6O66gh5zQkvTdY6h2K2IW/SX4
	mX4=
X-IronPort-AV: E=Sophos;i="5.76,427,1592841600"; d="scan'208";a="151719348"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
	by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 07:28:50 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3588.namprd04.prod.outlook.com (2603:10b6:910:90::35)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19;
	Mon, 14 Sep 2020 23:28:48 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Mon, 14 Sep 2020 23:28:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Mon, 14 Sep 2020 23:28:48 +0000
Message-ID: <CY4PR04MB37516F6F0DBA96CE512A4AFFE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
	<CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200914145209.GB14410@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 07592fb8-e8a9-4cde-b2e1-08d85905ee6f
x-ms-traffictypediagnostic: CY4PR0401MB3588:
x-microsoft-antispam-prvs: <CY4PR0401MB358848E70D8F9DF03BA2EFABE7230@CY4PR0401MB3588.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lwoiT6ahLbhft73oW7wCJK+UHfkXpeuNbxDxWUaEXUg/JXqhZdF1frxbCAHgTsda/466q1NWtwlanwEgGJR+8OCvFlqZOY4Z4MIO4LvzefqsU2kR5nRm6R+GzxFK9jXkcFlpUEZ5M+A0SUiZrta+bRQBUcqyNUS24es+K2RZ0qUWrTC9/0SxglAzjZ17WKZWpWDpo4oBmUKwY11Sjrxl9jFAXGcZ5Aq57lcyNJv4K+BywcM2Y07VmEHw/znd7SDMTTmLBv5F8r8Lq+5KpvU+rWI+EGSOtQG756oZqS+lvkJlVznrpFjg42mZTEBols3Ak9Xpek9rn6MGLAMg6wP19g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66446008)(478600001)(7696005)(71200400001)(6506007)(53546011)(54906003)(316002)(4326008)(186003)(86362001)(9686003)(55016002)(6916009)(8676002)(83380400001)(2906002)(33656002)(64756008)(66556008)(66476007)(91956017)(66946007)(76116006)(52536014)(5660300002)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: UYVSQw0gZtxXEqbM0IBiz66VC3KVTkUbpEsubmsjU1m+F/KJRM2K5oju5FDgs+hf8clb6mVHajqCXXLccqIG2YTQOKNEXJgxIEimzylDRmjmEICwoA5jivpJDQp+NgZHWRW76xyz6tllQSc009b7I6o59ZM+TfUppMvImgthCIbCU/uJRfJOZfaEbbmKTWf+gZMmZNMrczmcR9H7chLMUAKP5/XLgzCpeHwb7ro7C/l25WRCEhS5TGcall6zgOSHk2L3t9W9H0mReMqOUXM44QDfaHPpYJTxv68pJ4tit7xV/cG+Yddt3MRacN7uZZ0Ow5OXTOwuzbCk7rX9OwPa9SmyG/jo+zOb0BkPp4edU5M0WWvWJQpAQSo7muNM3vgalBuZgQBzxm+m6hNRh0LyNvR9uGNsGaraFLeUBxoSlGEC3iT/XLvuN5CJkEHp86Ldu4Ymeb3gMBD/1t6oyLXl6J5yVFjOzajOg4o4Kd1gcJnBxl4m6hXBIoi80bP382eqLxAdFuElujRlXsZ2H/6IoDBJVNy7u4XXnieG2aZbDNohbwezL/i5dfXCQH36JK5alGlIhBudhhrxZzPFgMTe2kBa236JFXBb+2thTUH1bHj5NeunBCaXrxz8INUl0AMKy6gsrN6KYkxxZaRY2hKKyr4Es6kYJLCE4JWKHdItBaGKsdl2Y/gJSyTy3kO5CTOeEr6b+C1476LHcsz5N0po9w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07592fb8-e8a9-4cde-b2e1-08d85905ee6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 23:28:48.2691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOGvImA+P/s747yz6vdvQHcHOPRWLbutF3WeRoAkJpgF0Yr8UCB+153FinWNtMJHkw6JYHoR/HvwyqkSRVzBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3588
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ENSwiU030595
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

On 2020/09/14 23:52, Mike Snitzer wrote:
> On Sun, Sep 13 2020 at  8:43pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/09/12 22:53, Ming Lei wrote:
>>> On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
>>>> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
>>>> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
>>>> those operations.
>>>
>>> Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
>>> chunk_sectors is set:
>>>
>>>         return min(blk_max_size_offset(q, offset),
>>>                         blk_queue_get_max_sectors(q, req_op(rq)));
>>>  
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
>>>> +	}>> +
>>>> +	return min(blk_max_size_offset(q, offset), max_sectors);
>>>>  }
>>>
>>> It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
>>> needs to be considered.
>>
>> That limit is needed for zoned block devices to ensure that *any* write request,
>> no matter the command, do not cross zone boundaries. Otherwise, the write would
>> be immediately failed by the device.
> 
> Thanks for the additional context, sorry to make you so concerned! ;)

No worries :)



-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

