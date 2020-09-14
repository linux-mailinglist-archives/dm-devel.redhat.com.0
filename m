Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51845268231
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 02:44:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-7FAO3zRfPAqn7CPIDCbNSQ-1; Sun, 13 Sep 2020 20:44:12 -0400
X-MC-Unique: 7FAO3zRfPAqn7CPIDCbNSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B551E420E9;
	Mon, 14 Sep 2020 00:44:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6A25DA6B;
	Mon, 14 Sep 2020 00:43:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82AF21832FD3;
	Mon, 14 Sep 2020 00:43:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08E0hHv9015785 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 13 Sep 2020 20:43:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F7BC3325F; Mon, 14 Sep 2020 00:43:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A20533258
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:43:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2C6B185A78B
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:43:13 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-CVjUZHzVPhauYDnK8poc4w-1; Sun, 13 Sep 2020 20:43:11 -0400
X-MC-Unique: CVjUZHzVPhauYDnK8poc4w-1
IronPort-SDR: uQFIIRBR20Suf0po47g6+A8J2FhvpjiWa8QMkLOM83kGujEgivYZ1XqqFz3rKlGZN5N3US3cf3
	43mY776NSVPw+YIYKsocoTYn8ZuXaRIpQyC3HnEcnFsEhDLU8AT0T4+Z0YGuIcG6K9qgPVxBUJ
	PwHHErmY5W0GTZJGhozTfh0J0VBhXy5ciO8VZuHja+8DUhZ+n8qKEqXdBPqZ50FKTogugOUmCb
	AOrozvDfvWyk+FDZmaOJoBE11xOTX9biVzmZiHNZBVxP6abIvpPGw9CJT1Kb0ATulxYD3EmWuF
	bro=
X-IronPort-AV: E=Sophos;i="5.76,424,1592841600"; d="scan'208";a="148496945"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
	by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2020 08:43:09 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:903:bb::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Mon, 14 Sep 2020 00:43:07 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Mon, 14 Sep 2020 00:43:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ming Lei <ming.lei@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Mon, 14 Sep 2020 00:43:06 +0000
Message-ID: <CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4f042f29-efdc-4a03-9058-08d8584725b4
x-ms-traffictypediagnostic: CY4PR04MB0374:
x-microsoft-antispam-prvs: <CY4PR04MB03743F0DEBAF8AA0FEE07FE8E7230@CY4PR04MB0374.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2v4IZLy/IFRBCz+rPCOX/Ujoh3qcWDZmeBZ3YWA8LYS/8KH2hBeVTqpPzCA9lXk680pH8rJtXKJgXxer2fm3QWahCjyaLGMUKMCsjdUAKfd8+Kf8xj0q0fk5PANDas4dX2lJyd3QiX0prKr0QC7oCaBmhYk/KuKSrWA2VluP+sNI2/2F1IBwNaSuy+enlw9hcD3AXJ5dCbidr7fCh2MA+rkPbP5hxDWc3IS6Rskjy/mtyteSL4sPxKqde66wlh9okBWn+KreBv6xD7zmOX2uzhgNMgNeVG+3AejghAtB82716Gf/fOjVfZTUxuzw/sFJ6OVNorzzgN5q92hP9uW4JQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(5660300002)(110136005)(478600001)(55016002)(83380400001)(71200400001)(33656002)(7696005)(54906003)(186003)(9686003)(66946007)(64756008)(6506007)(66446008)(76116006)(91956017)(52536014)(53546011)(66476007)(66556008)(8936002)(86362001)(316002)(2906002)(4326008)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: b+RXRtKbOG6cE8+TCcJuZhFJ4tIPDROZLmkOoA1yZeqYfNgS4sPY9L71lahIQakxfyQ8c4OBFuYeSfJP4nvthWshH0xftvuNih2MZlsbdD7q/ffRdS6AR3e4sDC8hgA2bWh1qKXJ2g3dHkXWeP9+17zo585fLI3CFVvIlxZtufuDMDpJEdb24nS+EQA3P6AMTRQxwSKdofpilpG3oeaAbwf/rTcSY/JfxRADHpYmYsifOn1xQBwRJWC2xX5e/ro/bxKULqSrvkWs4zjqh4snFYxKm4bsVnuxaeJ+GYrT8UseviNKwh4x03I9++a4PdS0oZWCyEXn5/SyUAPhgbwSTQZq5bI8D0Iim/9z/60X2KxdprI0uVldit0NA+OuPWMgEdEzx8XpF/jJQEZjU8H/wVLTrcKOCEVR7Agc20s7LNgJKOX7EYDBngWDWYqy8Oe3EOPaX6X4hl3KIWD+ntbEYtW6CGhqC6wnOhUuRuIXuXw8S7zehyPJ873lJFkRNt1rMXvoiy8TYydsb8Cxa4i8uUTDxrDxWjvFY2BsX1l1b/v2BzsYjHYaB3BV5F/aWE8iJEQC+PdEIs92+dWvKXg5rTHcPig0pT0dKlNWCy2Fn6dcg30UJszxMidksHDc3NyzkCgUrrxHdn+DKZW0QOVlcBroLClIgEPVhWRmQaKUVGyvZJ5JUNIkc4tYAqicNSKP8jlMGyVeae8jXZphFj+ibg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f042f29-efdc-4a03-9058-08d8584725b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 00:43:06.9798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDxpjyaqf1Gt6R7VaJnDJUPD+YbjG3WgIBye4b1iKcol2reY9WJ824XJqXv32PxH+dnloWqySoYYfIP5bU/uXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0374
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08E0hHv9015785
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>
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

On 2020/09/12 22:53, Ming Lei wrote:
> On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
>> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
>> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
>> those operations.
> 
> Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
> chunk_sectors is set:
> 
>         return min(blk_max_size_offset(q, offset),
>                         blk_queue_get_max_sectors(q, req_op(rq)));
>  
>> Also, there is no need to avoid blk_max_size_offset() if
>> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
>>
>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>> ---
>>  include/linux/blkdev.h | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>> index bb5636cc17b9..453a3d735d66 100644
>> --- a/include/linux/blkdev.h
>> +++ b/include/linux/blkdev.h
>> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>>  						  sector_t offset)
>>  {
>>  	struct request_queue *q = rq->q;
>> +	int op;
>> +	unsigned int max_sectors;
>>  
>>  	if (blk_rq_is_passthrough(rq))
>>  		return q->limits.max_hw_sectors;
>>  
>> -	if (!q->limits.chunk_sectors ||
>> -	    req_op(rq) == REQ_OP_DISCARD ||
>> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
>> -		return blk_queue_get_max_sectors(q, req_op(rq));
>> +	op = req_op(rq);
>> +	max_sectors = blk_queue_get_max_sectors(q, op);
>>  
>> -	return min(blk_max_size_offset(q, offset),
>> -			blk_queue_get_max_sectors(q, req_op(rq)));
>> +	switch (op) {
>> +	case REQ_OP_DISCARD:
>> +	case REQ_OP_SECURE_ERASE:
>> +	case REQ_OP_WRITE_SAME:
>> +	case REQ_OP_WRITE_ZEROES:
>> +		return max_sectors;
>> +	}>> +
>> +	return min(blk_max_size_offset(q, offset), max_sectors);
>>  }
> 
> It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
> needs to be considered.

That limit is needed for zoned block devices to ensure that *any* write request,
no matter the command, do not cross zone boundaries. Otherwise, the write would
be immediately failed by the device.

> 
> 
> Thanks,
> Ming
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

