Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 72049269BD8
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 04:15:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-EVYrtlyjNomqI3KfEYq5Xg-1; Mon, 14 Sep 2020 22:15:54 -0400
X-MC-Unique: EVYrtlyjNomqI3KfEYq5Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAFEF18A2252;
	Tue, 15 Sep 2020 02:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28EE81002393;
	Tue, 15 Sep 2020 02:15:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D2F21832FFA;
	Tue, 15 Sep 2020 02:15:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F2FVmP015735 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 22:15:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83E9D2166B44; Tue, 15 Sep 2020 02:15:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D8A32166B28
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 02:15:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA36101A56A
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 02:15:29 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-SlB2p2qlMciZkhxwFXtaow-1; Mon, 14 Sep 2020 22:15:26 -0400
X-MC-Unique: SlB2p2qlMciZkhxwFXtaow-1
IronPort-SDR: dAqien0Z8Gug0O+797wO2xXOabWJXS5+0hvmm8UjQWcW9iRjiVNB8oYAnVi7vTVUWEE9OA/eJm
	Kz+om2f0+anmtyPjZLkkboZiky9p1uNtlA3WhKaQN6Iue4BxdNDtI0GaV0VsFbuS6MSwFRGib1
	OVsOMaceRcxEgJlp1kKPhvjbWkEGGHodShr00rOoMoziU7LG5mUXuQWluu1V5fw7yihLVVt9PC
	VKS/6N9FXab6LVLh65fyQZccLqzv9JGnqzr9a91zN4ljGjfTH7zitKfwFEB/bpCTqB47QqqXAB
	e/M=
X-IronPort-AV: E=Sophos;i="5.76,427,1592841600"; d="scan'208";a="257009658"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
	by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 10:15:24 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1049.namprd04.prod.outlook.com (2603:10b6:910:56::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Tue, 15 Sep 2020 02:15:23 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Tue, 15 Sep 2020 02:15:23 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ming Lei <ming.lei@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Tue, 15 Sep 2020 02:15:23 +0000
Message-ID: <CY4PR04MB3751C73F80061266BEFA458DE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
	<CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200915020344.GB738570@T590>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4be38949-90b2-4d7f-7ed3-08d8591d3445
x-ms-traffictypediagnostic: CY4PR04MB1049:
x-microsoft-antispam-prvs: <CY4PR04MB1049A96B37F0C715838DCADEE7200@CY4PR04MB1049.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OxVgo6NVkiHpMyD55fURLDuHxo/W/5jwpM857tz33NBVXdmaBSHVOhe5FQcF+nNO0EvM+wspJ2PKhogkdz8T91tP/iG+31oH40FYX79lEh01pP9kqF1Z2c5EqMRcrouOzo/rIe8Jlf+Jky+O2qRQX8A63rdrFstEhsN+dXJmIry8CrHvoluWjb+B3cdX+798bEp3FMDsvlBH1lbSGvFXr9hDzWHAFM4D8sojem32iIFS7ldYT+4YR14hwcGJKRIc1+PX09/1PQQ9mlVEh86WjJufdWvHLrn6dI1Pp7AJz6lJwLfygEpMx7LQ/BQS37ouCw95od/93ztHY3TkCkZrUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(2906002)(9686003)(66946007)(64756008)(4326008)(66556008)(66476007)(7696005)(86362001)(5660300002)(66446008)(478600001)(91956017)(54906003)(76116006)(71200400001)(8936002)(52536014)(83380400001)(33656002)(6916009)(55016002)(53546011)(316002)(8676002)(186003)(6506007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rHqxoh18V28bpWcdtHXjgGMo6z9LS4lkTnJETU3Shz33qDagtUNYXVkv2g1ZtFzj0m/aUmExJFnwtk5hQ71V5zbRjASs79t4VynIHGTGwsKUlg1bhgEd2bfkPaKRZveEzExJaGP62Mbyl7XuniFP4oH/TTPWW62f8k6aAA2gDDS7faz/h5rxXj4hjaPrHKfqkztcXK2slUBgZKRLLRaMQB1D+4dn2VbSOqonpgLPuCpSq3rVHWrh48FB978jSB6jOGqRjLNIQ9lNX78i5bWc6mG8fbVCgWiult+ybaw/nqs5CpjUDm9hPEosAk7RMvX7rdKAypfMQnxivT64YF1srTUIVBibb1rLFXl6SEUMs6SNXj7HQGZ49mBBIKaHVtWBzWtjD/JYx/CN6ZB3/LVCyoJxWgBfpUGL9cY655GcUhnU0R1Zy1yEnypi85Tcvp0IJegztI2u7eGzbUm2j0El9BML1gREU4QwWRMr34Fq9qgRYUHxG1cYn/fQ3azLd2Sw9PMob6z0kmIqZp+HCxFEZ4tQL0IwC15BM/pDLkX5RtmrDnwgWfHvz0hxu3tO16oooyUPBwgEfmCbesoeWxbariTXgNUnKUq9Bg/vDDSY4lXzVlQg7ujjKAJhffFZyiD4rSEYrHTRiJKz7WHGTyVm82ONH1f0Rjzx3kWFLLE3IoBRY8nf2/jLqMqNXG1vwz0BnN88bqTOX4ZAg/GTdF7evQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be38949-90b2-4d7f-7ed3-08d8591d3445
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 02:15:23.7599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Omq27anF8l64Ks1qxguibiP6cOggxcfMlm0o34M7V0XUVpNtoRS+okj3TpFPvGExeMIRcAtxtExr9o2+QxG4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1049
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08F2FVmP015735
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2020/09/15 11:04, Ming Lei wrote:
> On Mon, Sep 14, 2020 at 12:43:06AM +0000, Damien Le Moal wrote:
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
> Looks both blk_bio_write_zeroes_split() and blk_bio_write_same_split()
> don't consider chunk_sectors limit, is that an issue for zone block?

Hu... Never looked at these. Yes, it will be a problem. write zeroes for NVMe
ZNS drives and write same for SCSI/ZBC drives. So yes, definitely something
that needs to be fixed. User of these will be file systems that in the case of
zoned block devices would be FS with zone support. f2fs does not use these
commands, and btrfs (posted recently) needs to be checked. But the FS itself
being zone aware, the requests will be zone aligned.

But definitely worth fixing.

Thanks !

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

