Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5054F0D
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 14:40:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DDFC307D97F;
	Tue, 25 Jun 2019 12:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2630B600C7;
	Tue, 25 Jun 2019 12:39:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0974F1806B1C;
	Tue, 25 Jun 2019 12:38:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PCbf6r014974 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 08:37:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE16A608A5; Tue, 25 Jun 2019 12:37:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769266085B;
	Tue, 25 Jun 2019 12:37:37 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DAAB368B1;
	Tue, 25 Jun 2019 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561466242; x=1593002242;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=PzBw+VL2FYfqwgkkhZDXCP2vS5OcKxqGM4KtRqsG488=;
	b=C98nMALmhsK/b7tTIPys84oWBgIi2C0/J7u2QB3v11u3f87rnu6hG4cN
	cCWHqGwhXwMmvf1kOk/RijwSuJsozDlwyWzsokeUwlZ9ikdkWJQqV0x4v
	UtiiMTP7fIRoZV4xiF2Y9Bpb6YJPGb3KMyttgxCCXTwTQcOBmDfdiq8ko
	wDdbWXIToTnYNiODDHMjR5Os2K/Itbcg7vuKiF3wKWAOIgOAdkSiqOaF2
	pNm9IMbPT8ecYPITMb84AGG3XnewF3HOv+R75wkWxh2QDtnvQUPbiNxwQ
	X+dFOvBEeTPHmS73W3B1P+2UL/lKNQUo3vy2lahLgLsWo95eYVPpTOrlv Q==;
X-IronPort-AV: E=Sophos;i="5.63,415,1557158400"; d="scan'208";a="113114685"
Received: from mail-co1nam05lp2055.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.55])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jun 2019 20:36:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MLYyMfRmNHDXWRmqXJkoDA1AFufNIOrHUUEn4BbKARs=;
	b=cnoQZeo4Ik6YPzGglDncYeCS0s09AKD8h4pDNVhHBY8xzqyYOViCBnpnfBkl7dWlwzLtpkkwHCbieFBQBcuqPVdADv+fZ2P9QQyMSWfWJ99GcK42jq6jpf6PUSESy+MAQIzJ7zb0CaVi1navGiloFe8XsvE56hrf+HSYyxxXL3c=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5432.namprd04.prod.outlook.com (20.178.51.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Tue, 25 Jun 2019 12:36:46 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.2008.017;
	Tue, 25 Jun 2019 12:36:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni
	<Chaitanya.Kulkarni@wdc.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 2/4] null_blk: add zone open, close, and finish support
Thread-Index: AQHVKDJPvRqrrDdCI02PGkGKUbxkfQ==
Date: Tue, 25 Jun 2019 12:36:45 +0000
Message-ID: <BYAPR04MB581665C81B89838BC022BF7BE7E30@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-3-mb@lightnvm.io>
	<BYAPR04MB5816D471063D970DDCF9AEC7E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
	<1aa6552c-ecf9-a168-df75-ec8c52ddbea6@lightnvm.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7818b15d-1f38-40a9-6d70-08d6f969c934
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5432; 
x-ms-traffictypediagnostic: BYAPR04MB5432:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB543279E0BE36C574315CA342E7E30@BYAPR04MB5432.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(346002)(39860400002)(366004)(396003)(199004)(189003)(8676002)(7416002)(6246003)(99286004)(14444005)(446003)(4326008)(74316002)(3846002)(6116002)(14454004)(91956017)(486006)(476003)(256004)(5660300002)(55016002)(316002)(305945005)(52536014)(72206003)(2906002)(7736002)(25786009)(68736007)(54906003)(73956011)(66946007)(110136005)(64756008)(9686003)(66556008)(66476007)(66446008)(53936002)(229853002)(7696005)(81166006)(66066001)(76176011)(66574012)(71190400001)(478600001)(71200400001)(102836004)(6506007)(186003)(53546011)(8936002)(81156014)(26005)(76116006)(2501003)(86362001)(2201001)(33656002)(6436002)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5432;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kYQpOYjsDU06Uc7yoQxfUK6kC7AWxSmd6WvYafg/EaoMM9vTKh1pI+u3XZLB1SZSrf5LvN+R0jNZFGNXkIiIn8U0lVJ7UATpJETezFR4VLMUOW+8r4tRJJYHdthPTNSLkqOi9OqwfStHF5ed6vdOBk2eXxgKSOGAnn2j0tN+S9jVwnVfeVm8JD75vnekVMS+NS7wITSSlAAYwQzUazHhPzXzFQGEmYPnywiNk2RDF9M1ljBjyHOjUFbgZK+4qqz7qAQI+2vOGrFHFLwXAVe+Oi2Qnd6msA7B/y8FC62W3BjQRS2vZBCTBRQ/Ilz+VShJN/IXtQ/sIhRb+u1JJOCiliUtf6H9mFzf5soU79cI8xmpG9XyNitv2GjbYB+kXTWpdUuKEcgkjQx+kXMmO2oXRk0w8eDb/LDs9EvtvbABlJc=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7818b15d-1f38-40a9-6d70-08d6f969c934
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 12:36:45.6705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5432
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Tue, 25 Jun 2019 12:37:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 25 Jun 2019 12:37:22 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=07216097b=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5PCbf6r014974
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/4] null_blk: add zone open, close,
	and finish support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 25 Jun 2019 12:40:20 +0000 (UTC)

On 2019/06/25 20:06, Matias Bj=F8rling wrote:
> On 6/22/19 3:02 AM, Damien Le Moal wrote:
>> On 2019/06/21 22:07, Matias Bj=F8rling wrote:
>>> From: Ajay Joshi <ajay.joshi@wdc.com>
>>>
>>> Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
>>> support to allow explicit control of zone states.
>>>
>>> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
>>> Signed-off-by: Matias Bj=F8rling <matias.bjorling@wdc.com>
>>> ---
>>>   drivers/block/null_blk.h       |  4 ++--
>>>   drivers/block/null_blk_main.c  | 13 ++++++++++---
>>>   drivers/block/null_blk_zoned.c | 33 ++++++++++++++++++++++++++++++---
>>>   3 files changed, 42 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
>>> index 34b22d6523ba..62ef65cb0f3e 100644
>>> --- a/drivers/block/null_blk.h
>>> +++ b/drivers/block/null_blk.h
>>> @@ -93,7 +93,7 @@ int null_zone_report(struct gendisk *disk, sector_t s=
ector,
>>>   		     gfp_t gfp_mask);
>>>   void null_zone_write(struct nullb_cmd *cmd, sector_t sector,
>>>   			unsigned int nr_sectors);
>>> -void null_zone_reset(struct nullb_cmd *cmd, sector_t sector);
>>> +void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t sector);
>>>   #else
>>>   static inline int null_zone_init(struct nullb_device *dev)
>>>   {
>>> @@ -111,6 +111,6 @@ static inline void null_zone_write(struct nullb_cmd=
 *cmd, sector_t sector,
>>>   				   unsigned int nr_sectors)
>>>   {
>>>   }
>>> -static inline void null_zone_reset(struct nullb_cmd *cmd, sector_t sec=
tor) {}
>>> +static inline void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t s=
ector) {}
>>>   #endif /* CONFIG_BLK_DEV_ZONED */
>>>   #endif /* __NULL_BLK_H */
>>> diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_mai=
n.c
>>> index 447d635c79a2..5058fb980c9c 100644
>>> --- a/drivers/block/null_blk_main.c
>>> +++ b/drivers/block/null_blk_main.c
>>> @@ -1209,10 +1209,17 @@ static blk_status_t null_handle_cmd(struct null=
b_cmd *cmd)
>>>   			nr_sectors =3D blk_rq_sectors(cmd->rq);
>>>   		}
>>>   =

>>> -		if (op =3D=3D REQ_OP_WRITE)
>>> +		switch (op) {
>>> +		case REQ_OP_WRITE:
>>>   			null_zone_write(cmd, sector, nr_sectors);
>>> -		else if (op =3D=3D REQ_OP_ZONE_RESET)
>>> -			null_zone_reset(cmd, sector);
>>> +			break;
>>> +		case REQ_OP_ZONE_RESET:
>>> +		case REQ_OP_ZONE_OPEN:
>>> +		case REQ_OP_ZONE_CLOSE:
>>> +		case REQ_OP_ZONE_FINISH:
>>> +			null_zone_mgmt_op(cmd, sector);
>>> +			break;
>>> +		}
>>>   	}
>>>   out:
>>>   	/* Complete IO by inline, softirq or timer */
>>> diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zo=
ned.c
>>> index fca0c97ff1aa..47d956b2e148 100644
>>> --- a/drivers/block/null_blk_zoned.c
>>> +++ b/drivers/block/null_blk_zoned.c
>>> @@ -121,17 +121,44 @@ void null_zone_write(struct nullb_cmd *cmd, secto=
r_t sector,
>>>   	}
>>>   }
>>>   =

>>> -void null_zone_reset(struct nullb_cmd *cmd, sector_t sector)
>>> +void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t sector)
>>>   {
>>>   	struct nullb_device *dev =3D cmd->nq->dev;
>>>   	unsigned int zno =3D null_zone_no(dev, sector);
>>>   	struct blk_zone *zone =3D &dev->zones[zno];
>>> +	enum req_opf op =3D req_op(cmd->rq);
>>>   =

>>>   	if (zone->type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
>>>   		cmd->error =3D BLK_STS_IOERR;
>>>   		return;
>>>   	}
>>>   =

>>> -	zone->cond =3D BLK_ZONE_COND_EMPTY;
>>> -	zone->wp =3D zone->start;
>>> +	switch (op) {
>>> +	case REQ_OP_ZONE_RESET:
>>> +		zone->cond =3D BLK_ZONE_COND_EMPTY;
>>> +		zone->wp =3D zone->start;
>>> +		return;
>>> +	case REQ_OP_ZONE_OPEN:
>>> +		if (zone->cond =3D=3D BLK_ZONE_COND_FULL) {
>>> +			cmd->error =3D BLK_STS_IOERR;
>>> +			return;
>>> +		}
>>> +		zone->cond =3D BLK_ZONE_COND_EXP_OPEN;
>>
>>
>> With ZBC, open of a full zone is a "nop". No error. So I would rather ha=
ve this as:
>>
>> 		if (zone->cond !=3D BLK_ZONE_COND_FULL)
>> 			zone->cond =3D BLK_ZONE_COND_EXP_OPEN;
>> 		=

> Is this only ZBC? I can't find a reference to it in ZAC. I think it =

> should fail. One is trying to open a zone that is full, one can't open =

> it again. It's done for this round.

Page 52/53, section 5.2.6.3.2:

If the OPEN ALL bit is cleared to zero and the zone specified by the ZONE ID
field (see 5.2.4.3.3) is in Zone Condition:
a) EMPTY, IMPLICITLY OPENED, or CLOSED, then the device shall process an
Explicitly Open Zone function
(see 4.6.3.4.10) for the zone specified by the ZONE ID field;
b) EXPLICITLY OPENED or FULL, then the device shall:
	A) not change the zone's state; and
	B) return successful command completion;

>>
>>> +		return;
>>> +	case REQ_OP_ZONE_CLOSE:
>>> +		if (zone->cond =3D=3D BLK_ZONE_COND_FULL) {
>>> +			cmd->error =3D BLK_STS_IOERR;
>>> +			return;
>>> +		}
>>> +		zone->cond =3D BLK_ZONE_COND_CLOSED;
>>
>> Sam as for open. Closing a full zone on ZBC is a nop. =

> =

> I think this should cause error.

See ZAB/ZAC close command description. Same text as above, almost. Not an e=
rror.
It is a nop. ZAC page 48, section 5.2.4.3.2:

If the CLOSE ALL bit is cleared to zero and the zone specified by the ZONE =
ID
field (see 5.2.4.3.3) is in Zone Condition:
a) IMPLICITLY OPENED, or EXPLICITLY OPENED, then the device shall process a
Close Zone function
(see 4.6.3.4.11) for the zone specified by the ZONE ID field;
b) EMPTY, CLOSED, or FULL, then the device shall:
	A) not change the zone's state; and
	B) return successful command completion;

> =

> And the code above would
>> also set an empty zone to closed. Finally, if the zone is open but nothi=
ng was
>> written to it, it must be returned to empty condition, not closed. =

> =

> Only on a reset event right? In general, if I do a expl. open, close it, =

> it should not go to empty.

See the zone state machine. It does return to empty from expl open if nothi=
ng
was written, that is, if the WP is still at zone start. This text is in ZAC
section 4.6.3.4.11 as noted above:

For the specified zone, the Zone Condition state machine processing of this
function (e.g., as shown in the ZC2: Implicit_Open state (see 4.6.3.4.3))
results in the Zone Condition for the specified zone becoming:
a) EMPTY, if the write pointer indicates the lowest LBA in the zone and Non
Sequential Write Resources Active is false; or
b) CLOSED, if the write pointer does not indicate the lowest LBA in the zon=
e or
Non-Sequential Write Resources Active is true.

> =

> So something
>> like this is needed.
>>
>> 		switch (zone->cond) {
>> 		case BLK_ZONE_COND_FULL:
>> 		case BLK_ZONE_COND_EMPTY:
>> 			break;
>> 		case BLK_ZONE_COND_EXP_OPEN:
>> 			if (zone->wp =3D=3D zone->start) {
>> 				zone->cond =3D BLK_ZONE_COND_EMPTY;
>> 				break;
>> 			}
>> 		/* fallthrough */
>> 		default:
>> 			zone->cond =3D BLK_ZONE_COND_CLOSED;
>> 		}
>>
>>> +		return;
>>> +	case REQ_OP_ZONE_FINISH:
>>> +		zone->cond =3D BLK_ZONE_COND_FULL;
>>> +		zone->wp =3D zone->start + zone->len;
>>> +		return;
>>> +	default:
>>> +		/* Invalid zone condition */
>>> +		cmd->error =3D BLK_STS_IOERR;
>>> +		return;
>>> +	}
>>>   }
>>>
>>
>>
> =

> =



-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
